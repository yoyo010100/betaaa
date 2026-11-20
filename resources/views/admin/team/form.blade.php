@extends('layouts.admin')
@section('title', $isEdit ? 'Edit Sales Rep' : 'Add Sales Rep')
@section('page_title', $isEdit ? 'Edit Sales Rep' : 'Add Sales Rep')

@section('content')
<div style="max-width:760px;margin:0 auto">
    <a href="{{ route('admin.team.index') }}" style="font-size:12px;color:var(--muted)">← Back to Sales Team</a>

    <div class="form-card" style="margin-top:12px">
        <h3>{{ $isEdit ? 'Edit Sales Account' : 'New Sales Account' }}</h3>

        <form action="{{ $action }}" method="POST">
            @csrf
            @if($method !== 'POST')
                @method($method)
            @endif

            <div class="form-grid">
                <div class="form-group">
                    <label>Full Name</label>
                    <input type="text" name="name" value="{{ old('name', $member->name) }}" required>
                </div>

                <div class="form-group">
                    <label>Email Address</label>
                    <input type="email" name="email" value="{{ old('email', $member->email) }}" required>
                </div>

                <div class="form-group">
                    <label>Password {{ $isEdit ? '(optional)' : '' }}</label>
                    <input type="password" name="password" {{ $isEdit ? '' : 'required' }} autocomplete="new-password">
                    @if($isEdit)
                        <small style="font-size:11px;color:var(--muted)">Leave blank to keep the current password.</small>
                    @endif
                </div>

                <div class="form-group">
                    <label>Confirm Password</label>
                    <input type="password" name="password_confirmation" autocomplete="new-password">
                </div>

                <div class="form-group full">
                    <label style="display:flex;align-items:center;gap:10px;text-transform:none;letter-spacing:0;font-size:13px;color:var(--charcoal)">
                        <input type="checkbox" name="is_active" value="1" style="width:auto;padding:0"
                            {{ old('is_active', $member->is_active) ? 'checked' : '' }}>
                        Account is active and can log in
                    </label>
                </div>
            </div>

            <div style="display:flex;gap:10px;margin-top:24px">
                <button type="submit" class="btn btn-sun">
                    {{ $isEdit ? 'Save Changes' : 'Create Sales Account' }}
                </button>
                <a href="{{ route('admin.team.index') }}" class="btn btn-outline">Cancel</a>
            </div>
        </form>
    </div>
</div>
@endsection
