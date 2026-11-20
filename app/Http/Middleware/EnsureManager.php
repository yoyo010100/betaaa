<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Symfony\Component\HttpFoundation\Response;

class EnsureManager
{
    /**
     * Restrict manager-only modules to super_admin / admin accounts.
     * Sales reps are redirected to their lead workspace instead of a dead end.
     */
    public function handle(Request $request, Closure $next): Response
    {
        $user = Auth::user();

        if ($user && $user->isSuperAdmin()) {
            return $next($request);
        }

        if ($request->expectsJson()) {
            abort(403, 'Manager access required.');
        }

        $redirect = redirect()->route('admin.leads.index');

        // Login lands on the dashboard; send sales reps to their workspace
        // quietly, but warn them when they manually hit a manager-only module.
        if (!$request->routeIs('admin.dashboard')) {
            $redirect->with('error', 'Manager access is required for that area.');
        }

        return $redirect;
    }
}
