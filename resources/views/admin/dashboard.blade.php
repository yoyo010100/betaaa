@extends('layouts.admin')
@section('title', 'Executive Dashboard')
@section('page_title', 'Executive Dashboard')

@section('content')

{{-- FILTER BAR --}}
<div style="display:flex;justify-content:space-between;align-items:flex-start;gap:20px;margin-bottom:24px;flex-wrap:wrap">
    <div>
        <h1 style="font-size:22px;font-weight:800">Executive Dashboard</h1>
        <p style="font-size:13px;color:var(--muted);margin-top:4px">
            {{ $periodLabel }} &bull; {{ $startDate->format('d M Y') }} – {{ $endDate->format('d M Y') }}
        </p>
    </div>

    <form method="GET" action="{{ route('admin.dashboard') }}" style="display:flex;gap:10px;align-items:center;flex-wrap:wrap">
        <select name="year" style="padding:9px 14px;border:1px solid var(--line);border-radius:6px;font-size:13px">
            @foreach($availableYears as $availableYear)
                <option value="{{ $availableYear }}" {{ (int) $year === (int) $availableYear ? 'selected' : '' }}>
                    {{ $availableYear }}
                </option>
            @endforeach
        </select>

        <select name="period" style="padding:9px 14px;border:1px solid var(--line);border-radius:6px;font-size:13px">
            @foreach($periods as $value => $label)
                <option value="{{ $value }}" {{ $period === $value ? 'selected' : '' }}>{{ $label }}</option>
            @endforeach
        </select>

        <button type="submit" class="btn btn-primary btn-sm">Apply Filter</button>
    </form>
</div>

{{-- QUOTE & DEAL FUNNEL KPIS --}}
<div class="metric-grid">
    <div class="metric-card">
        <h4>Total Quotes</h4>
        <div class="value">{{ number_format($totalQuotes) }}</div>
        <div class="sub" style="color:var(--muted)">All leads in selected period</div>
    </div>
    <div class="metric-card">
        <h4>Deals Won</h4>
        <div class="value" style="color:var(--green)">{{ number_format($dealsWon) }}</div>
        <div class="sub" style="color:var(--muted)">Status: won</div>
    </div>
    <div class="metric-card">
        <h4>Deals Lost</h4>
        <div class="value" style="color:var(--red)">{{ number_format($dealsLost) }}</div>
        <div class="sub" style="color:var(--muted)">Status: lost</div>
    </div>
    <div class="metric-card">
        <h4>Open / Quoted</h4>
        <div class="value" style="color:var(--ocean)">{{ number_format($openQuoted) }}</div>
        <div class="sub" style="color:var(--muted)">Status: new or quoted</div>
    </div>
    <div class="metric-card">
        <h4>Win Rate</h4>
        <div class="value">{{ number_format($winRate, 1) }}%</div>
        <div class="sub" style="color:var(--muted)">Won ÷ total quotes</div>
    </div>
    <div class="metric-card">
        <h4>Website Leads</h4>
        <div class="value">{{ number_format($sourceCounts['website']) }}</div>
        <div class="sub" style="color:var(--muted)">Source: website</div>
    </div>
    <div class="metric-card">
        <h4>Event / Manual</h4>
        <div class="value" style="color:var(--sun)">{{ number_format($sourceCounts['manual']) }}</div>
        <div class="sub" style="color:var(--muted)">Event, phone &amp; walk-in</div>
    </div>
</div>

{{-- SEPARATED CURRENCY FINANCIALS --}}
<div style="display:grid;grid-template-columns:1fr 1fr;gap:24px;margin-bottom:24px">
    <div class="chart-card" style="border-top:4px solid #003087;margin-bottom:0">
        <h4 style="display:flex;justify-content:space-between;align-items:center">
            <span>EGP Financials</span>
            <span class="badge" style="background:#e8edf7;color:#003087">EGP</span>
        </h4>
        <div style="display:grid;gap:14px">
            <div style="display:flex;justify-content:space-between;gap:12px;padding-bottom:12px;border-bottom:1px solid var(--line)">
                <span style="font-size:12px;color:var(--muted)">Realized Revenue</span>
                <strong style="font-size:16px">{{ number_format($financials['EGP']['realized'], 2) }} EGP</strong>
            </div>
            <div style="display:flex;justify-content:space-between;gap:12px;padding-bottom:12px;border-bottom:1px solid var(--line)">
                <span style="font-size:12px;color:var(--muted)">Gross Profit</span>
                <strong style="font-size:16px;color:var(--green)">{{ number_format($financials['EGP']['profit'], 2) }} EGP</strong>
            </div>
            <div style="display:flex;justify-content:space-between;gap:12px">
                <span style="font-size:12px;color:var(--muted)">Open Pipeline Value</span>
                <strong style="font-size:16px;color:var(--ocean)">{{ number_format($financials['EGP']['pipeline'], 2) }} EGP</strong>
            </div>
        </div>
    </div>

    <div class="chart-card" style="border-top:4px solid #F2A900;margin-bottom:0">
        <h4 style="display:flex;justify-content:space-between;align-items:center">
            <span>SAR Financials</span>
            <span class="badge" style="background:#fff7e0;color:#8a6a00">SAR</span>
        </h4>
        <div style="display:grid;gap:14px">
            <div style="display:flex;justify-content:space-between;gap:12px;padding-bottom:12px;border-bottom:1px solid var(--line)">
                <span style="font-size:12px;color:var(--muted)">Realized Revenue</span>
                <strong style="font-size:16px">{{ number_format($financials['SAR']['realized'], 2) }} SAR</strong>
            </div>
            <div style="display:flex;justify-content:space-between;gap:12px;padding-bottom:12px;border-bottom:1px solid var(--line)">
                <span style="font-size:12px;color:var(--muted)">Gross Profit</span>
                <strong style="font-size:16px;color:var(--green)">{{ number_format($financials['SAR']['profit'], 2) }} SAR</strong>
            </div>
            <div style="display:flex;justify-content:space-between;gap:12px">
                <span style="font-size:12px;color:var(--muted)">Open Pipeline Value</span>
                <strong style="font-size:16px;color:var(--sun)">{{ number_format($financials['SAR']['pipeline'], 2) }} SAR</strong>
            </div>
        </div>
    </div>
</div>

<div style="font-size:11px;color:var(--muted);margin:-12px 0 24px">
    EGP and SAR are reported independently. No combined cross-currency total is calculated.
</div>

{{-- MONTHLY CURRENCY CHARTS --}}
<div style="display:grid;grid-template-columns:1fr 1fr;gap:24px;margin-bottom:24px">
    <div class="chart-card" style="margin-bottom:0">
        <h4>EGP Monthly Revenue &amp; Gross Profit</h4>
        <div style="height:300px;position:relative"><canvas id="egpChart"></canvas></div>
    </div>
    <div class="chart-card" style="margin-bottom:0">
        <h4>SAR Monthly Revenue &amp; Gross Profit</h4>
        <div style="height:300px;position:relative"><canvas id="sarChart"></canvas></div>
    </div>
</div>

{{-- FUNNEL + SALES REP CHART --}}
<div style="display:grid;grid-template-columns:1fr 1fr;gap:24px;margin-bottom:24px">
    <div class="chart-card" style="margin-bottom:0">
        <h4>Quote Conversion Funnel</h4>
        <div style="height:300px;position:relative"><canvas id="funnelChart"></canvas></div>
    </div>
    <div class="chart-card" style="margin-bottom:0">
        <h4>Sales Rep Performance Comparison</h4>
        <div style="height:300px;position:relative"><canvas id="repsChart"></canvas></div>
    </div>
</div>

{{-- SALES TEAM LEADERBOARD --}}
<div class="table-wrap">
    <div class="table-toolbar">
        <h3 style="font-size:15px;font-weight:700;flex:1">Sales Team Performance Leaderboard</h3>
        <span style="font-size:11px;color:var(--muted)">{{ $periodLabel }}</span>
    </div>
    <table>
        <thead>
            <tr>
                <th>Sales Rep</th>
                <th>Quotes</th>
                <th>Won</th>
                <th>Win Rate</th>
                <th>EGP Revenue</th>
                <th>SAR Revenue</th>
            </tr>
        </thead>
        <tbody>
            @forelse($salesRepStats as $rep)
                <tr>
                    <td style="font-weight:700">{{ $rep['name'] }}</td>
                    <td>{{ number_format($rep['total_quotes']) }}</td>
                    <td style="color:var(--green);font-weight:700">{{ number_format($rep['won']) }}</td>
                    <td>{{ number_format($rep['win_rate'], 1) }}%</td>
                    <td>{{ number_format($rep['egp_revenue'], 2) }} EGP</td>
                    <td>{{ number_format($rep['sar_revenue'], 2) }} SAR</td>
                </tr>
            @empty
                <tr>
                    <td colspan="6" style="text-align:center;color:var(--muted);padding:32px">
                        No sales reps found.
                    </td>
                </tr>
            @endforelse
        </tbody>
    </table>
</div>

{{-- PDF EXPORT --}}
<div style="display:flex;justify-content:flex-end;align-items:center;gap:14px;margin-bottom:32px">
    <span style="font-size:11px;color:var(--muted)">Exports the dashboard with the rendered charts.</span>
    <form method="POST" action="{{ route('admin.dashboard.export-pdf') }}" id="pdfExportForm">
        @csrf
        <input type="hidden" name="year" value="{{ $year }}">
        <input type="hidden" name="period" value="{{ $period }}">
        <input type="hidden" name="chart_egp" id="chart_egp">
        <input type="hidden" name="chart_sar" id="chart_sar">
        <input type="hidden" name="chart_funnel" id="chart_funnel">
        <input type="hidden" name="chart_reps" id="chart_reps">
        <button type="button" id="downloadPdfBtn" class="btn btn-sun">
            ⬇ Download Executive Report (PDF)
        </button>
    </form>
</div>

@endsection

@push('scripts')
<script src="https://cdn.jsdelivr.net/npm/chart.js@4.4.1/dist/chart.umd.min.js"></script>
<script>
document.addEventListener('DOMContentLoaded', () => {
    Chart.defaults.font.family = 'DM Sans, sans-serif';
    Chart.defaults.color = '#1a202c';

    const months = @json($monthly['months']);
    const egpRevenue = @json($monthly['EGP']['revenue']);
    const egpProfit = @json($monthly['EGP']['profit']);
    const sarRevenue = @json($monthly['SAR']['revenue']);
    const sarProfit = @json($monthly['SAR']['profit']);
    const funnel = @json($funnel);
    const repStats = @json($salesRepStats);

    const currencyChart = (canvasId, code, revenue, profit, revenueColor, profitColor) => {
        return new Chart(document.getElementById(canvasId), {
            type: 'bar',
            data: {
                labels: months,
                datasets: [
                    {
                        label: 'Revenue (' + code + ')',
                        data: revenue,
                        backgroundColor: revenueColor,
                        borderRadius: 4,
                        order: 2
                    },
                    {
                        label: 'Gross Profit (' + code + ')',
                        data: profit,
                        type: 'line',
                        borderColor: profitColor,
                        backgroundColor: profitColor,
                        borderWidth: 3,
                        pointRadius: 3,
                        tension: 0.35,
                        order: 1
                    }
                ]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                interaction: { mode: 'index', intersect: false },
                plugins: {
                    legend: { position: 'bottom' },
                    tooltip: {
                        callbacks: {
                            label: (context) => context.dataset.label + ': ' + code + ' ' + Number(context.raw).toLocaleString()
                        }
                    }
                },
                scales: {
                    y: {
                        beginAtZero: true,
                        ticks: {
                            callback: (value) => code + ' ' + Number(value).toLocaleString()
                        }
                    },
                    x: { grid: { display: false } }
                }
            }
        });
    };

    const egpChart = currencyChart('egpChart', 'EGP', egpRevenue, egpProfit, '#003087', '#F2A900');
    const sarChart = currencyChart('sarChart', 'SAR', sarRevenue, sarProfit, '#F2A900', '#071321');

    const funnelChart = new Chart(document.getElementById('funnelChart'), {
        type: 'bar',
        data: {
            labels: ['New', 'Quoted', 'Won', 'Lost'],
            datasets: [{
                label: 'Leads',
                data: [funnel.new, funnel.quoted, funnel.won, funnel.lost],
                backgroundColor: ['#003087', '#F2A900', '#16a34a', '#e53e3e'],
                borderRadius: 4
            }]
        },
        options: {
            indexAxis: 'y',
            responsive: true,
            maintainAspectRatio: false,
            plugins: { legend: { display: false } },
            scales: {
                x: { beginAtZero: true, ticks: { precision: 0 } },
                y: { grid: { display: false } }
            }
        }
    });

    const repsChart = new Chart(document.getElementById('repsChart'), {
        type: 'bar',
        data: {
            labels: repStats.map((rep) => rep.name),
            datasets: [
                {
                    label: 'Total Quotes',
                    data: repStats.map((rep) => rep.total_quotes),
                    backgroundColor: '#003087',
                    borderRadius: 4
                },
                {
                    label: 'Deals Won',
                    data: repStats.map((rep) => rep.won),
                    backgroundColor: '#16a34a',
                    borderRadius: 4
                }
            ]
        },
        options: {
            responsive: true,
            maintainAspectRatio: false,
            plugins: { legend: { position: 'bottom' } },
            scales: {
                y: { beginAtZero: true, ticks: { precision: 0 } },
                x: { grid: { display: false } }
            }
        }
    });

    document.getElementById('downloadPdfBtn')?.addEventListener('click', () => {
        document.getElementById('chart_egp').value = egpChart.canvas.toDataURL('image/png');
        document.getElementById('chart_sar').value = sarChart.canvas.toDataURL('image/png');
        document.getElementById('chart_funnel').value = funnelChart.canvas.toDataURL('image/png');
        document.getElementById('chart_reps').value = repsChart.canvas.toDataURL('image/png');
        document.getElementById('pdfExportForm').submit();
    });
});
</script>
@endpush
