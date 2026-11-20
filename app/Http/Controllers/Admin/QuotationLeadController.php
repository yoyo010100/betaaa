<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Jobs\SendQuotationNotificationJob;
use App\Models\Country;
use App\Models\Currency;
use App\Models\Product;
use App\Models\Quotation;
use App\Models\QuoteRequest;
use App\Models\Service;
use App\Models\User;
use App\Services\AuditLogger;
use App\Support\ArabicPdf;
use Barryvdh\DomPDF\Facade\Pdf;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Str;
use Illuminate\Validation\Rule;

class QuotationLeadController extends Controller
{
    public function index(Request $request)
    {
        $user = Auth::user();

        $query = QuoteRequest::with([
            'country',
            'service',
            'product',
            'quotation.currency',
            'quotation.adminUser',
        ]);

        // Sales reps see their own leads, unassigned website leads they can
        // claim, and any lead they have already quoted.
        if (!$user->isSuperAdmin()) {
            $query->where(function ($q) use ($user) {
                $q->where('assigned_admin_id', $user->id)
                  ->orWhereNull('assigned_admin_id')
                  ->orWhereHas('quotation', fn ($quote) => $quote->where('admin_user_id', $user->id));
            });
        }

        if ($request->filled('status')) {
            $query->where('status', $request->status);
        }
        if ($request->filled('country')) {
            $query->whereHas('country', fn($q) => $q->where('iso2', $request->country));
        }
        if ($request->filled('search')) {
            $query->where(function ($q) use ($request) {
                $q->where('client_name', 'like', '%' . $request->search . '%')
                  ->orWhere('company_name', 'like', '%' . $request->search . '%')
                  ->orWhere('email', 'like', '%' . $request->search . '%');
            });
        }

        $leads = $query->latest()->paginate(20);
        $currencies = Currency::where('is_active', true)->get();
        $countries = Country::where('is_active', true)->get();
        $salesReps = $user->isSuperAdmin()
            ? User::whereIn('role', ['sales', 'super_admin', 'admin'])->pluck('name', 'id')
            : collect();
        $statusOptions = $this->statusOptions($user);

        return view('admin.leads.index', compact(
            'leads',
            'currencies',
            'countries',
            'salesReps',
            'statusOptions'
        ));
    }

    public function create()
    {
        $countries = Country::where('is_active', true)->orderBy('name')->get();
        $services = Service::where('is_active', true)->orderBy('id')->get();
        $products = Product::where('is_active', true)->orderBy('id')->get();
        $currencies = Currency::where('is_active', true)->get();
        $statusOptions = $this->statusOptions(Auth::user());

        return view('admin.leads.create', compact(
            'countries',
            'services',
            'products',
            'currencies',
            'statusOptions'
        ));
    }

    /**
     * Create an event / walk-in / phone lead from the fast-entry form, with an
     * optional quotation so the rep can download the client PDF immediately.
     */
    public function storeManual(Request $request)
    {
        $user = Auth::user();

        $validated = $request->validate([
            'client_name' => ['required', 'string', 'max:150'],
            'company_name' => ['nullable', 'string', 'max:150'],
            'phone' => ['required', 'string', 'max:50'],
            'email' => ['nullable', 'email', 'max:254'],
            'country_id' => ['required', 'exists:countries,id'],
            'service_id' => ['nullable', 'exists:services,id'],
            'product_id' => ['nullable', 'exists:products,id'],
            'source' => ['required', 'in:event,phone,walk_in'],
            'client_message' => ['nullable', 'string', 'max:5000'],
            'status' => ['nullable', Rule::in($this->statusOptions($user))],
            'currency_id' => ['nullable', 'required_with:factory_cost,selling_price', 'exists:currencies,id'],
            'factory_cost' => ['nullable', 'required_with:currency_id,selling_price', 'numeric', 'min:0'],
            'selling_price' => ['nullable', 'required_with:currency_id,factory_cost', 'numeric', 'min:0'],
        ]);

        $lead = QuoteRequest::create([
            'client_name' => $validated['client_name'],
            'company_name' => $validated['company_name'] ?? null,
            'phone' => $validated['phone'],
            'email' => $validated['email'] ?? '',
            'country_id' => $validated['country_id'],
            'service_id' => $validated['service_id'] ?? null,
            'product_id' => $validated['product_id'] ?? null,
            'client_message' => $validated['client_message'] ?? '',
            'source' => $validated['source'],
            'status' => $validated['status'] ?? 'new',
            'assigned_admin_id' => $user->id,
            'submitted_at' => now(),
        ]);

        if ($request->filled('currency_id')
            && $request->filled('factory_cost')
            && $request->filled('selling_price')) {
            $quotation = Quotation::create([
                'quote_request_id' => $lead->id,
                'admin_user_id' => $user->id,
                'currency_id' => $validated['currency_id'],
                'factory_cost' => $validated['factory_cost'],
                'selling_price' => $validated['selling_price'],
                'status' => 'sent_to_client',
            ]);

            // Auto-update lead status from new → quoted when a quotation is created
            if ($lead->status === 'new') {
                $lead->status = 'quoted';
                $lead->save();
            }
        }

        return redirect()->route('admin.leads.show', $lead->public_id)
            ->with('success', 'Event quote created. You can download the client PDF now.');
    }

    public function show(QuoteRequest $lead)
    {
        $this->ensureLeadAccess($lead);

        $user = Auth::user();
        $lead->load([
            'country',
            'service',
            'product',
            'quotation.currency',
            'quotation.adminUser',
            'attachments',
        ]);
        $currencies = Currency::where('is_active', true)->get();
        $salesReps = $user->isSuperAdmin()
            ? User::whereIn('role', ['sales', 'super_admin', 'admin'])->pluck('name', 'id')
            : collect();
        $statusOptions = $this->statusOptions($user);

        return view('admin.leads.show', compact(
            'lead',
            'currencies',
            'salesReps',
            'statusOptions'
        ));
    }

    public function storeQuotation(Request $request, QuoteRequest $lead)
    {
        $this->ensureLeadAccess($lead);

        $validated = $request->validate([
            'currency_id' => ['required', 'exists:currencies,id'],
            'factory_cost' => ['required', 'numeric', 'min:0'],
            'selling_price' => ['required', 'numeric', 'min:0'],
            'admin_notes' => ['nullable', 'string', 'max:5000'],
        ]);

        $user = Auth::user();
        $oldQuotation = $lead->quotation ? $lead->quotation->toArray() : null;

        $profitAmount = round(Quotation::grossProfit($validated['selling_price'], $validated['factory_cost']), 2);

        $quotation = Quotation::updateOrCreate(
            ['quote_request_id' => $lead->id],
            [
                'public_id' => $lead->quotation?->public_id ?? (string) Str::ulid(),
                'admin_user_id' => $user->id,
                'currency_id' => $validated['currency_id'],
                'factory_cost' => $validated['factory_cost'],
                'selling_price' => $validated['selling_price'],
                'admin_notes' => $validated['admin_notes'] ?? null,
                'status' => 'sent_to_client',
            ]
        );

        // Sales reps claim unassigned website leads when they quote them.
        if (!$user->isSuperAdmin() && $lead->assigned_admin_id === null) {
            $lead->assigned_admin_id = $user->id;
        }

        $lead->status = 'quoted';
        $lead->save();

        AuditLogger::log(
            'quotation.created_or_updated',
            $quotation,
            $oldQuotation,
            ['factory_cost' => $validated['factory_cost'], 'selling_price' => $validated['selling_price'], 'profit_amount' => $profitAmount]
        );

        // Offload client notification to the Redis queue.
        SendQuotationNotificationJob::dispatch($lead);

        return redirect()->route('admin.leads.show', $lead->public_id)
            ->with('success', 'Quotation saved. Profit: ' . number_format($profitAmount, 2));
    }

    public function updateStatus(Request $request, QuoteRequest $lead)
    {
        $this->ensureLeadAccess($lead);

        $user = Auth::user();
        $validated = $request->validate([
            'status' => ['required', 'string', Rule::in($this->statusOptions($user))],
        ]);

        $old = $lead->only(['status']);
        $attributes = ['status' => $validated['status']];

        // Claim an unassigned lead on first status change as well.
        if (!$user->isSuperAdmin() && $lead->assigned_admin_id === null) {
            $attributes['assigned_admin_id'] = $user->id;
        }

        $lead->update($attributes);

        AuditLogger::log('lead.status_changed', $lead, $old, ['status' => $validated['status']]);

        return redirect()->back()->with('success', 'Lead status updated to: ' . ucfirst($validated['status']));
    }

    /**
     * Stream a client-ready quotation receipt as a PDF.
     * Internal cost/profit fields are never passed to the client view.
     */
    public function pdf(Quotation $quotation)
    {
        $this->ensureQuotationAccess($quotation);

        $quotation->load([
            'quoteRequest.country',
            'quoteRequest.service',
            'quoteRequest.product',
            'currency',
            'adminUser',
        ]);

        $reference = 'QT-' . ($quotation->created_at?->format('Y') ?? now()->format('Y')) . '-' . strtoupper(substr((string) $quotation->public_id, -8));

        $pdf = ArabicPdf::loadView('admin.quotations.pdf', compact('quotation', 'reference'))
            ->setPaper('a4', 'portrait')
            ->setOption([
                'defaultFont' => 'DejaVu Sans',
                'isRemoteEnabled' => false,
                'isHtml5ParserEnabled' => true,
            ]);

        $filename = $reference . '.pdf';

        return $pdf->download($filename);
    }

    private function statusOptions(User $user): array
    {
        return ['new', 'quoted', 'won', 'lost'];
    }

    private function ensureLeadAccess(QuoteRequest $lead): void
    {
        $user = Auth::user();

        if (!$user || $user->isSuperAdmin()) {
            return;
        }

        $ownsQuotation = $lead->quotation()->where('admin_user_id', $user->id)->exists();
        $canAccess = $lead->assigned_admin_id === null
            || (int) $lead->assigned_admin_id === (int) $user->id
            || $ownsQuotation;

        abort_unless($canAccess, 403, 'You do not have access to this lead.');
    }

    private function ensureQuotationAccess(Quotation $quotation): void
    {
        $user = Auth::user();

        if (!$user || $user->isSuperAdmin()) {
            return;
        }

        $quotation->loadMissing('quoteRequest');
        $lead = $quotation->quoteRequest;

        $canAccess = $lead
            && ($lead->assigned_admin_id === null
                || (int) $lead->assigned_admin_id === (int) $user->id
                || (int) $quotation->admin_user_id === (int) $user->id);

        abort_unless($canAccess, 403, 'You do not have access to this quotation.');
    }
}
