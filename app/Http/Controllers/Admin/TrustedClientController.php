<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\TrustedClient;
use Illuminate\Http\Request;
use Illuminate\Validation\Rule;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\File;

class TrustedClientController extends Controller
{
    public function index()
    {
        $this->ensureManagerAccess();

        $clients = TrustedClient::orderBy('sort_order')
            ->orderBy('id')
            ->get();

        return view('admin.trusted-clients.index', compact('clients'));
    }

    public function store(Request $request)
    {
        $this->ensureManagerAccess();

        $validated = $request->validate([
            'name' => ['required', 'string', 'max:255'],
            'logo' => ['required', 'image', 'mimes:png,jpeg,jpeg,webp,svg', 'max:2048'],
            'is_active' => ['nullable', 'boolean'],
        ]);

        $fileName = null;
        if ($request->hasFile('logo')) {
            $fileName = Str::slug($request->name) . '-' . uniqid() . '.' . $request->logo->extension();
            $request->logo->move(public_path('uploads/clients'), $fileName);
        }

        TrustedClient::create([
            'name' => $validated['name'],
            'logo_path' => $fileName,
            'sort_order' => $validated['sort_order'] ?? 0,
            'is_active' => $validated['is_active'] ?? true,
        ]);

        return redirect()->route('admin.trusted-clients.index')
            ->with('success', 'Trusted client added successfully.');
    }

    public function update(Request $request, TrustedClient $client)
    {
        $this->ensureManagerAccess();

        $validated = $request->validate([
            'name' => ['required', 'string', 'max:255'],
            'logo' => ['image', 'mimes:png,jpeg,jpeg,webp,svg', 'max:2048'],
            'is_active' => ['nullable', 'boolean'],
        ]);

        if ($request->hasFile('logo')) {
            // Delete old file if exists
            if ($client->logo_path && file_exists(public_path('uploads/clients/' . $client->logo_path))) {
                unlink(public_path('uploads/clients/' . $client->logo_path));
            }
            $fileName = Str::slug($request->name) . '-' . uniqid() . '.' . $request->logo->extension();
            $request->logo->move(public_path('uploads/clients'), $fileName);
            $client->logo_path = $fileName;
        }

        $client->name = $validated['name'];
        $client->is_active = $validated['is_active'] ?? $client->is_active;
        $client->save();

        return redirect()->route('admin.trusted-clients.index')
            ->with('success', 'Trusted client updated successfully.');
    }

    public function toggle(TrustedClient $client)
    {
        $this->ensureManagerAccess();

        $client->update(['is_active' => !$client->is_active]);

        return redirect()->route('admin.trusted-clients.index')
            ->with('success', $client->is_active
                ? 'Trusted client activated.'
                : 'Trusted client deactivated.');
    }

    public function destroy(TrustedClient $client)
    {
        $this->ensureManagerAccess();

        // Delete file from disk if exists
        if ($client->logo_path && file_exists(public_path('uploads/clients/' . $client->logo_path))) {
            unlink(public_path('uploads/clients/' . $client->logo_path));
        }

        $client->delete();

        return redirect()->route('admin.trusted-clients.index')
            ->with('success', 'Trusted client deleted successfully.');
    }

    private function ensureManagerAccess(): void
    {
        $user = Auth::user();
        abort_unless($user && in_array($user->role, ['super_admin', 'admin'], true), 403, 'Manager access required.');
    }
}