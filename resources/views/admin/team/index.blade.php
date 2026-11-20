@extends('layouts.admin')
@section('title', 'Sales Team')
@section('page_title', 'Sales Team Management')

@section('content')
<div style="display:flex;justify-content:space-between;align-items:flex-start;gap:20px;margin-bottom:24px">
    <div>
        <h1 style="font-size:22px;font-weight:800">Sales Team</h1>
        <p style="font-size:13px;color:var(--muted);margin-top:4px">
            Manage sales accounts and track quotation performance.
        </p>
    </div>
    <a href="{{ route('admin.team.create') }}" class="btn btn-sun">+ Add Sales Rep</a>
</div>

<div class="table-wrap">
    <table>
        <thead>
            <tr>
                <th>Sales Rep</th>
                <th>Status</th>
                <th>Total Quotes</th>
                <th>Deals Won</th>
                <th>Win Rate</th>
                <th>Won Revenue</th>
                <th></th>
            </tr>
        </thead>
        <tbody>
            @forelse($members as $member)
                <tr>
                    <td>
                        <div style="font-weight:700">{{ $member->name }}</div>
                        <div style="font-size:11px;color:var(--muted)">{{ $member->email }}</div>
                    </td>
                    <td>
                        <span class="badge badge-{{ $member->is_active ? 'accepted' : 'rejected' }}">
                            {{ $member->is_active ? 'Active' : 'Inactive' }}
                        </span>
                    </td>
                    <td style="font-weight:700">{{ number_format($member->performance['total_quotes']) }}</td>
                    <td style="font-weight:700">{{ number_format($member->performance['deals_won']) }}</td>
                    <td>
                        <div style="display:flex;align-items:center;gap:10px">
                            <strong style="min-width:42px">{{ number_format($member->performance['win_rate'], 1) }}%</strong>
                            <div style="width:70px;height:6px;background:var(--line);border-radius:99px;overflow:hidden">
                                <div style="height:100%;width:{{ min(100, $member->performance['win_rate']) }}%;background:var(--green)"></div>
                            </div>
                        </div>
                    </td>
                    <td style="font-size:12px">
                        <div><strong>EGP</strong> {{ number_format($member->performance['won_revenue']['EGP'], 2) }}</div>
                        <div style="color:var(--muted)"><strong>SAR</strong> {{ number_format($member->performance['won_revenue']['SAR'], 2) }}</div>
                    </td>
                    <td>
                        <div style="display:flex;gap:8px;align-items:center">
                            <a href="{{ route('admin.team.edit', $member->public_id) }}" class="btn btn-outline btn-sm">Edit</a>
                            <form action="{{ route('admin.team.toggle', $member->public_id) }}" method="POST">
                                @csrf
                                @method('PATCH')
                                <button type="submit" class="btn btn-sm {{ $member->is_active ? 'btn-danger' : 'btn-primary' }}">
                                    {{ $member->is_active ? 'Deactivate' : 'Activate' }}
                                </button>
                            </form>
                        </div>
                    </td>
                </tr>
            @empty
                <tr>
                    <td colspan="7" style="text-align:center;padding:40px;color:var(--muted)">
                        No sales accounts yet. Add your first sales rep to get started.
                    </td>
                </tr>
            @endforelse
        </tbody>
    </table>
</div>
@endsection
