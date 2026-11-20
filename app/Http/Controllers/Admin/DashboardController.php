<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\QuoteRequest;
use App\Models\Quotation;
use App\Models\User;
use App\Support\ArabicPdf;
use Barryvdh\DomPDF\Facade\Pdf;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Validation\Rule;

class DashboardController extends Controller
{
    public function index(Request $request)
    {
        $year = (int) $request->query('year', now()->year);
        if ($year < 2000 || $year > 2100) {
            $year = (int) now()->year;
        }

        $periods = $this->periodOptions();
        $period = (string) $request->query('period', 'full_year');
        if (!array_key_exists($period, $periods)) {
            $period = 'full_year';
        }

        $data = $this->buildDashboardData($year, $period);

        return view('admin.dashboard', array_merge($data, [
            'availableYears' => $this->availableYears($year),
            'periods' => $periods,
        ]));
    }

    /**
     * Export the executive dashboard with the browser-rendered Chart.js canvases.
     */
    public function exportPdf(Request $request)
    {
        $periods = $this->periodOptions();

        $validated = $request->validate([
            'year' => ['required', 'integer', 'min:2000', 'max:2100'],
            'period' => ['required', 'string', Rule::in(array_keys($periods))],
            'chart_egp' => ['nullable', 'string'],
            'chart_sar' => ['nullable', 'string'],
            'chart_funnel' => ['nullable', 'string'],
            'chart_reps' => ['nullable', 'string'],
        ]);

        $data = $this->buildDashboardData((int) $validated['year'], $validated['period']);

        $chartImages = [
            'egp' => $validated['chart_egp'] ?? null,
            'sar' => $validated['chart_sar'] ?? null,
            'funnel' => $validated['chart_funnel'] ?? null,
            'reps' => $validated['chart_reps'] ?? null,
        ];

        $pdf = ArabicPdf::loadView('admin.dashboard.pdf', array_merge($data, compact('chartImages')))
            ->setPaper('a4', 'landscape')
            ->setOption([
                'defaultFont' => 'DejaVu Sans',
                'isRemoteEnabled' => false,
                'isHtml5ParserEnabled' => true,
            ]);

        return $pdf->download(
            'BETA-Executive-Report-' . $validated['year'] . '-' . $validated['period'] . '.pdf'
        );
    }

    private function buildDashboardData(int $year, string $period): array
    {
        $periods = $this->periodOptions();
        [$start, $end] = $this->dateRange($year, $period);

        $leadQuery = QuoteRequest::query()->whereBetween('submitted_at', [$start, $end]);

        $totalQuotes = (clone $leadQuery)->count();
        $dealsWon = (clone $leadQuery)->where('status', 'won')->count();
        $dealsLost = (clone $leadQuery)->where('status', 'lost')->count();
        $openQuoted = (clone $leadQuery)->whereIn('status', ['new', 'quoted'])->count();
        $winRate = $totalQuotes > 0 ? round(($dealsWon / $totalQuotes) * 100, 1) : 0.0;

        $sourceCounts = [
            'website' => (clone $leadQuery)->where('source', 'website')->count(),
            'manual' => (clone $leadQuery)->whereIn('source', ['event', 'phone', 'walk_in'])->count(),
        ];

        $funnel = [
            'new' => (clone $leadQuery)->where('status', 'new')->count(),
            'quoted' => (clone $leadQuery)->where('status', 'quoted')->count(),
            'won' => $dealsWon,
            'lost' => $dealsLost,
        ];

        return [
            'year' => $year,
            'period' => $period,
            'periodLabel' => $periods[$period],
            'startDate' => $start,
            'endDate' => $end,
            'totalQuotes' => $totalQuotes,
            'dealsWon' => $dealsWon,
            'dealsLost' => $dealsLost,
            'openQuoted' => $openQuoted,
            'winRate' => $winRate,
            'sourceCounts' => $sourceCounts,
            'funnel' => $funnel,
            'financials' => $this->financialSummary($start, $end),
            'monthly' => $this->monthlySeries($start, $end),
            'salesRepStats' => $this->salesRepStats($start, $end),
        ];
    }

    private function financialSummary(Carbon $start, Carbon $end): array
    {
        $summary = [];

        foreach (['EGP', 'SAR'] as $code) {
            $base = Quotation::query()
                ->join('currencies', 'currencies.id', '=', 'quotations.currency_id')
                ->join('quote_requests', 'quote_requests.id', '=', 'quotations.quote_request_id')
                ->where('currencies.code', $code)
                ->whereBetween('quotations.created_at', [$start, $end])
                ->whereNull('quote_requests.deleted_at');

            $summary[$code] = [
                'realized' => (float) (clone $base)
                    ->where('quote_requests.status', 'won')
                    ->sum('quotations.selling_price'),
                'profit' => (float) (clone $base)
                    ->where('quote_requests.status', 'won')
                    ->sum('quotations.profit_amount'),
                'pipeline' => (float) (clone $base)
                    ->where('quote_requests.status', 'quoted')
                    ->sum('quotations.selling_price'),
            ];
        }

        return $summary;
    }

    private function monthlySeries(Carbon $start, Carbon $end): array
    {
        $monthKeys = [];
        $monthLabels = [];
        $cursor = $start->copy()->startOfMonth();
        $lastMonth = $end->copy()->startOfMonth();

        while ($cursor->lte($lastMonth)) {
            $monthKeys[] = $cursor->format('Y-m');
            $monthLabels[] = $cursor->format('M Y');
            $cursor->addMonth();
        }

        $series = [
            'months' => $monthLabels,
            'EGP' => [
                'revenue' => array_fill(0, count($monthKeys), 0.0),
                'profit' => array_fill(0, count($monthKeys), 0.0),
            ],
            'SAR' => [
                'revenue' => array_fill(0, count($monthKeys), 0.0),
                'profit' => array_fill(0, count($monthKeys), 0.0),
            ],
        ];

        foreach (['EGP', 'SAR'] as $code) {
            $rows = Quotation::query()
                ->join('currencies', 'currencies.id', '=', 'quotations.currency_id')
                ->join('quote_requests', 'quote_requests.id', '=', 'quotations.quote_request_id')
                ->where('currencies.code', $code)
                ->whereBetween('quotations.created_at', [$start, $end])
                ->whereNull('quote_requests.deleted_at')
                ->selectRaw('DATE_FORMAT(quotations.created_at, "%Y-%m") as month, SUM(quotations.selling_price) as revenue, SUM(quotations.profit_amount) as profit')
                ->groupBy('month')
                ->orderBy('month')
                ->get()
                ->keyBy('month');

            foreach ($monthKeys as $index => $key) {
                $row = $rows->get($key);
                $series[$code]['revenue'][$index] = (float) ($row->revenue ?? 0);
                $series[$code]['profit'][$index] = (float) ($row->profit ?? 0);
            }
        }

        return $series;
    }

    private function salesRepStats(Carbon $start, Carbon $end)
    {
        return User::where('role', 'sales')
            ->orderBy('name')
            ->get()
            ->map(function (User $user) use ($start, $end) {
                $quotations = Quotation::query()
                    ->where('admin_user_id', $user->id)
                    ->whereBetween('created_at', [$start, $end])
                    ->with(['currency:id,code', 'quoteRequest:id,status'])
                    ->get();

                $totalQuotes = $quotations->count();
                $wonQuotes = $quotations->filter(
                    fn ($quotation) => $quotation->quoteRequest?->status === 'won'
                );

                $egpRevenue = 0.0;
                $sarRevenue = 0.0;

                foreach ($wonQuotes as $quotation) {
                    $code = strtoupper((string) ($quotation->currency?->code ?? ''));
                    if ($code === 'EGP') {
                        $egpRevenue += (float) $quotation->selling_price;
                    } elseif ($code === 'SAR') {
                        $sarRevenue += (float) $quotation->selling_price;
                    }
                }

                return [
                    'id' => $user->id,
                    'name' => $user->name,
                    'total_quotes' => $totalQuotes,
                    'won' => $wonQuotes->count(),
                    'win_rate' => $totalQuotes > 0
                        ? round(($wonQuotes->count() / $totalQuotes) * 100, 1)
                        : 0.0,
                    'egp_revenue' => $egpRevenue,
                    'sar_revenue' => $sarRevenue,
                ];
            });
    }

    private function availableYears(int $selectedYear): array
    {
        $years = QuoteRequest::query()
            ->selectRaw('YEAR(submitted_at) as year')
            ->whereNotNull('submitted_at')
            ->distinct()
            ->pluck('year')
            ->map(fn ($year) => (int) $year)
            ->all();

        $years[] = (int) now()->year;
        $years[] = $selectedYear;

        $years = array_values(array_unique(array_filter($years)));
        rsort($years);

        return $years;
    }

    private function dateRange(int $year, string $period): array
    {
        return match ($period) {
            'q1' => [Carbon::create($year, 1, 1)->startOfDay(), Carbon::create($year, 3, 31)->endOfDay()],
            'q2' => [Carbon::create($year, 4, 1)->startOfDay(), Carbon::create($year, 6, 30)->endOfDay()],
            'q3' => [Carbon::create($year, 7, 1)->startOfDay(), Carbon::create($year, 9, 30)->endOfDay()],
            'q4' => [Carbon::create($year, 10, 1)->startOfDay(), Carbon::create($year, 12, 31)->endOfDay()],
            'h1' => [Carbon::create($year, 1, 1)->startOfDay(), Carbon::create($year, 6, 30)->endOfDay()],
            'q1_q3' => [Carbon::create($year, 1, 1)->startOfDay(), Carbon::create($year, 9, 30)->endOfDay()],
            default => [Carbon::create($year, 1, 1)->startOfDay(), Carbon::create($year, 12, 31)->endOfDay()],
        };
    }

    private function periodOptions(): array
    {
        return [
            'q1' => 'Q1 (Jan – Mar)',
            'q2' => 'Q2 (Apr – Jun)',
            'q3' => 'Q3 (Jul – Sep)',
            'q4' => 'Q4 (Oct – Dec)',
            'h1' => 'First Half — H1 (Jan – Jun)',
            'q1_q3' => '3 Quarters (Jan – Sep)',
            'full_year' => 'Full Year (Jan – Dec)',
        ];
    }
}
