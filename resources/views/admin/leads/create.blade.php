@extends('layouts.admin')
@section('title', 'New Event / Walk-in Quote')
@section('page_title', 'New Event / Walk-in Quote')

@section('content')
<div style="max-width:980px;margin:0 auto">
    <div style="display:flex;justify-content:space-between;align-items:flex-start;gap:20px;margin-bottom:20px">
        <div>
            <a href="{{ route('admin.leads.index') }}" style="font-size:12px;color:var(--muted)">← Back to Leads</a>
            <h1 style="font-size:22px;font-weight:800;margin-top:4px">New Event / Walk-in Quote</h1>
            <p style="font-size:13px;color:var(--muted);margin-top:4px">
                Capture a lead on the spot and issue a quotation immediately.
            </p>
        </div>
    </div>

    <form action="{{ route('admin.leads.store') }}" method="POST">
        @csrf

        <div class="form-card">
            <h3>Client Details</h3>
            <div class="form-grid">
                <div class="form-group">
                    <label>Client Name *</label>
                    <input type="text" name="client_name" value="{{ old('client_name') }}" required>
                </div>

                <div class="form-group">
                    <label>Company</label>
                    <input type="text" name="company_name" value="{{ old('company_name') }}">
                </div>

                <div class="form-group">
                    <label>Phone *</label>
                    <input type="text" name="phone" value="{{ old('phone') }}" required>
                </div>

                <div class="form-group">
                    <label>Email</label>
                    <input type="email" name="email" value="{{ old('email') }}">
                </div>

                <div class="form-group">
                    <label>Country *</label>
                    <select name="country_id" required>
                        <option value="">Select country…</option>
                        @foreach($countries as $country)
                            <option value="{{ $country->id }}" {{ old('country_id') == $country->id ? 'selected' : '' }}>
                                {{ $country->name }}
                            </option>
                        @endforeach
                    </select>
                </div>

                <div class="form-group">
                    <label>Source *</label>
                    <select name="source" required>
                        @foreach(['event' => 'Event', 'phone' => 'Phone', 'walk_in' => 'Walk-in'] as $value => $label)
                            <option value="{{ $value }}" {{ old('source', 'event') === $value ? 'selected' : '' }}>
                                {{ $label }}
                            </option>
                        @endforeach
                    </select>
                </div>
            </div>
        </div>

        <div class="form-card">
            <h3>Project &amp; Request</h3>
            <div class="form-grid">
                <div class="form-group">
                    <label>Service</label>
                    <select name="service_id">
                        <option value="">Select service…</option>
                        @foreach($services as $service)
                            <option value="{{ $service->id }}" {{ old('service_id') == $service->id ? 'selected' : '' }}>
                                {{ $service->getTitle() }}
                            </option>
                        @endforeach
                    </select>
                </div>

                <div class="form-group">
                    <label>Product</label>
                    <select name="product_id">
                        <option value="">Select product…</option>
                        @foreach($products as $product)
                            <option value="{{ $product->id }}" {{ old('product_id') == $product->id ? 'selected' : '' }}>
                                {{ $product->getTitle() }}
                            </option>
                        @endforeach
                    </select>
                </div>

                <div class="form-group">
                    <label>Lead Status</label>
                    <select name="status">
                        @foreach($statusOptions as $status)
                            <option value="{{ $status }}" {{ old('status', 'new') === $status ? 'selected' : '' }}>
                                {{ ucfirst($status) }}
                            </option>
                        @endforeach
                    </select>
                </div>

                <div class="form-group full">
                    <label>Project Scope / Notes</label>
                    <textarea name="client_message" rows="4" placeholder="What does the client need? Dimensions, quantities, deadlines…">{{ old('client_message') }}</textarea>
                </div>
            </div>
        </div>

        <div class="form-card">
            <h3>Immediate Quotation <span style="font-size:11px;color:var(--muted);font-weight:500">(optional)</span></h3>
            <p style="font-size:12px;color:var(--muted);margin:-8px 0 18px">
                Fill all three pricing fields to create the quotation now. You will be redirected to the lead page where you can download the client PDF.
            </p>
            <div class="form-grid">
                <div class="form-group">
                    <label>Currency</label>
                    <select name="currency_id">
                        <option value="">— No quotation yet —</option>
                        @foreach($currencies as $currency)
                            <option value="{{ $currency->id }}" {{ old('currency_id') == $currency->id ? 'selected' : '' }}>
                                {{ $currency->code }} — {{ $currency->symbol }}
                            </option>
                        @endforeach
                    </select>
                </div>

                <div class="form-group">
                    <label>Factory Cost (Internal)</label>
                    <input type="number" name="factory_cost" step="0.01" min="0" value="{{ old('factory_cost') }}" placeholder="0.00">
                </div>

                <div class="form-group">
                    <label>Selling Price (Client Sees)</label>
                    <input type="number" name="selling_price" step="0.01" min="0" value="{{ old('selling_price') }}" placeholder="0.00">
                </div>
            </div>
        </div>

        <div style="display:flex;gap:10px;margin-bottom:32px">
            <button type="submit" class="btn btn-sun">Create Lead &amp; Open</button>
            <a href="{{ route('admin.leads.index') }}" class="btn btn-outline">Cancel</a>
        </div>
    </form>
</div>
@endsection
