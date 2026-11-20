@extends('layouts.admin')
@section('title', 'Quotation Leads')
@section('page_title', 'Quotation Leads')

@section('content')
<div style="display:flex;justify-content:space-between;align-items:flex-start;gap:20px;margin-bottom:20px">
    <div>
        <h1 style="font-size:22px;font-weight:800">Quotation Leads</h1>
        <p style="font-size:13px;color:var(--muted);margin-top:4px">
            {{ Auth::user()->isSuperAdmin() ? 'All leads across the sales team.' : 'Your leads and unassigned website leads.' }}
        </p>
    </div>
    <a href="{{ route('admin.leads.create') }}" class="btn btn-sun">+ Add Event / Manual Quote</a>
</div>

<div class="table-wrap">
    <div class="table-toolbar">
        <form style="display:flex;gap:10px;flex:1;flex-wrap:wrap" method="GET">
            <input name="search" placeholder="Search client, company, email…" value="{{ request('search') }}">
            <select name="status">
                <option value="">All Statuses</option>
                @foreach(['new','quoted','won','lost'] as $s)
                    <option value="{{ $s }}" {{ request('status') === $s ? 'selected' : '' }}>{{ ucfirst($s) }}</option>
                @endforeach
            </select>
            <select name="country">
                <option value="">All Countries</option>
                @foreach($countries as $c)
                    <option value="{{ $c->iso2 }}" {{ request('country') === $c->iso2 ? 'selected' : '' }}>{{ $c->name }}</option>
                @endforeach
            </select>
            <button type="submit" class="btn btn-primary btn-sm">Filter</button>
            <a href="{{ route('admin.leads.index') }}" class="btn btn-outline btn-sm">Reset</a>
        </form>
        <div style="font-size:12px;color:var(--muted)">{{ $leads->total() }} total leads</div>
    </div>
    <table>
        <thead>
            <tr>
                <th>Client</th>
                <th>Company</th>
                <th>Country</th>
                <th>Service / Product</th>
                <th>Status</th>
                <th>Quotation</th>
                @if(Auth::user()->isSuperAdmin())
                    <th>Owner / Quoted By</th>
                @endif
                <th>Submitted</th>
                <th></th>
            </tr>
        </thead>
        <tbody>
            @forelse($leads as $lead)
            <tr>
                <td>
                    <div style="font-weight:700">{{ $lead->client_name }}</div>
                    <div style="font-size:11px;color:var(--muted)">{{ $lead->email }}</div>
                </td>
                <td style="color:var(--muted)">{{ $lead->company_name ?: '—' }}</td>
                <td>{{ $lead->country?->name ?? '—' }}</td>
                <td style="font-size:12px">
                    {{ $lead->service?->getTitle() ?? '' }}<br>
                    <span style="color:var(--muted)">{{ $lead->product?->getTitle() ?? '' }}</span>
                </td>
                <td><span class="badge badge-{{ $lead->status }}">{{ $lead->status }}</span></td>
                <td>
                    @if($lead->quotation)
                        <div style="font-size:12px;font-weight:700;color:var(--green)">
                            {{ $lead->quotation->currency->symbol ?? '' }}{{ number_format($lead->quotation->selling_price, 0) }}
                        </div>
                        <div style="font-size:10px;color:var(--muted)">
                            Profit: {{ number_format($lead->quotation->profit_amount, 0) }}
                        </div>
                    @else
                        <span style="font-size:11px;color:var(--muted)">No quotation yet</span>
                    @endif
                </td>
                @if(Auth::user()->isSuperAdmin())
                    @php
                        $owner = $lead->assigned_admin_id ? ($salesReps[$lead->assigned_admin_id] ?? null) : null;
                        $quotedBy = $lead->quotation?->adminUser?->name;
                    @endphp
                    <td style="font-size:12px">
                        @if($owner)
                            <div style="font-weight:700">{{ $owner }}</div>
                        @else
                            <span style="font-size:11px;color:var(--muted)">Unassigned</span>
                        @endif
                        @if($quotedBy && $quotedBy !== $owner)
                            <div style="font-size:10px;color:var(--muted)">Quoted: {{ $quotedBy }}</div>
                        @endif
                    </td>
                @endif
                <td style="font-size:12px;color:var(--muted)">{{ $lead->submitted_at?->format('M d, Y') }}</td>
                <td>
                    <a href="{{ route('admin.leads.show', $lead->public_id) }}" class="btn btn-sun btn-sm">Open →</a>
                    @if($lead->quotation)
                        <a href="{{ route('admin.quotations.pdf', $lead->quotation) }}" class="btn btn-outline btn-sm" style="margin-left: 6px;;">⬇ PDF</a>
                    @endif
                </td>
            </tr>
            @empty
            <tr><td colspan="{{ Auth::user()->isSuperAdmin() ? 9 : 8 }}" style="text-align:center;padding:40px;color:var(--muted)">No leads found matching your criteria.</td></tr>
            @endforelse
        </tbody>
    </table>
    @if($leads->hasPages())
    <div class="pagination-bar">
        <span>Page {{ $leads->currentPage() }} of {{ $leads->lastPage() }}</span>
        {{ $leads->withQueryString()->links() }}
    </div>
    @endif
</div>
@endsection
