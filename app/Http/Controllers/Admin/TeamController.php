<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Validation\Rule;

class TeamController extends Controller
{
    public function index()
    {
        $members = User::where('role', 'sales')
            ->with([
                'quotations.currency:id,code',
                'quotations.quoteRequest:id,status',
            ])
            ->orderBy('name')
            ->get()
            ->map(function (User $member) {
                $quotations = $member->quotations;
                $totalQuotes = $quotations->count();

                $wonQuotes = $quotations->filter(
                    fn ($quotation) => in_array($quotation->quoteRequest?->status, ['won', 'accepted'], true)
                );

                $wonRevenue = ['EGP' => 0.0, 'SAR' => 0.0];
                foreach ($wonQuotes as $quotation) {
                    $code = strtoupper((string) ($quotation->currency?->code ?? ''));
                    if (array_key_exists($code, $wonRevenue)) {
                        $wonRevenue[$code] += (float) $quotation->selling_price;
                    }
                }

                $member->performance = [
                    'total_quotes' => $totalQuotes,
                    'deals_won' => $wonQuotes->count(),
                    'win_rate' => $totalQuotes > 0 ? round(($wonQuotes->count() / $totalQuotes) * 100, 1) : 0.0,
                    'won_revenue' => $wonRevenue,
                ];

                return $member;
            });

        return view('admin.team.index', compact('members'));
    }

    public function create()
    {
        return view('admin.team.form', [
            'member' => new User(['role' => 'sales', 'is_active' => true]),
            'action' => route('admin.team.store'),
            'method' => 'POST',
            'isEdit' => false,
        ]);
    }

    public function store(Request $request)
    {
        $validated = $request->validate([
            'name' => ['required', 'string', 'max:255'],
            'email' => ['required', 'email', 'max:255', Rule::unique('users', 'email')],
            'password' => ['required', 'string', 'min:8', 'confirmed'],
            'is_active' => ['nullable', 'boolean'],
        ]);

        User::create([
            'name' => $validated['name'],
            'email' => $validated['email'],
            'password' => $validated['password'],
            'role' => 'sales',
            'is_active' => $request->boolean('is_active'),
        ]);

        return redirect()->route('admin.team.index')
            ->with('success', 'Sales account created successfully.');
    }

    public function edit(User $member)
    {
        $this->ensureSalesMember($member);

        return view('admin.team.form', [
            'member' => $member,
            'action' => route('admin.team.update', $member->public_id),
            'method' => 'PUT',
            'isEdit' => true,
        ]);
    }

    public function update(Request $request, User $member)
    {
        $this->ensureSalesMember($member);

        $validated = $request->validate([
            'name' => ['required', 'string', 'max:255'],
            'email' => ['required', 'email', 'max:255', Rule::unique('users', 'email')->ignore($member->id)],
            'password' => ['nullable', 'string', 'min:8', 'confirmed'],
            'is_active' => ['nullable', 'boolean'],
        ]);

        $data = [
            'name' => $validated['name'],
            'email' => $validated['email'],
            'is_active' => $request->boolean('is_active'),
        ];

        if (!empty($validated['password'])) {
            $data['password'] = $validated['password'];
        }

        $member->update($data);

        return redirect()->route('admin.team.index')
            ->with('success', 'Sales account updated successfully.');
    }

    public function toggle(User $member)
    {
        $this->ensureSalesMember($member);

        $member->update(['is_active' => !$member->is_active]);

        return redirect()->route('admin.team.index')
            ->with('success', $member->is_active
                ? 'Sales account activated.'
                : 'Sales account deactivated.');
    }

    private function ensureSalesMember(User $member): void
    {
        abort_unless($member->role === 'sales', 404);
    }
}
