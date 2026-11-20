@extends('layouts.admin')
@section('title', 'Trusted Clients')
@section('page_title', 'Trusted Clients')

@section('content')

<!-- Page Header -->
<div style="display:flex;justify-content:space-between;align-items:flex-start;gap:20px;margin-bottom:24px">
    <div>
        <h1 style="font-size:22px;font-weight:800">Trusted Clients & Partners</h1>
        <p style="font-size:13px;color:var(--muted);margin-top:4px">Manage your trusted client relationships</p>
    </div>
    <a href="javascript:void(0)" class="btn btn-sun" style="padding: 10px 20px;" onclick="openAddModal()">+ Add Client</a>
</div>

<!-- Clients Card -->
<div style="background: #fff; border-radius: 14px; border: 1px solid #e2e8f0; box-shadow: 0 1px 3px rgba(0,0,0,0.04); padding: 24px;">
    <table class="table table-hover mb-0">
        <thead>
            <tr>
                <th style="width: 60px;">#</th>
                <th>Logo</th>
                <th style="width: 220px;">Client Name</th>
                <th style="width: 100px;">Sort Order</th>
                <th style="width: 140px;">Status</th>
                <th style="width: 180px;">Actions</th>
            </tr>
        </thead>
        <tbody>
            @forelse($clients as $index => $client)
                <tr style="border-bottom: 1px solid #f1f3f4;">
                    <td style="font-weight: 700; font-size: 12px;">{{ $index + 1 }}</td>
                    <td>
                        @if($client->logo_path && file_exists(public_path('uploads/clients/' . $client->logo_path)))
                            <img src="{{ asset('uploads/clients/' . $client->logo_path) }}" alt="{{ $client->name }}" style="width: 96px; height: 48px; background: #f8fafc; border: 1px solid #e2e8f0; border-radius: 8px; padding: 6px; object-fit: contain;">
                        @else
                            <div style="width: 96px; height: 48px; background: #f8fafc; border: 1px solid #e2e8f0; border-radius: 8px; display: flex; align-items: center; justify-content: center; font-size: 11px; color: #64748b; text-transform: uppercase;">
                                {{ strtoupper(substr($client->name, 0, 3)) }}
                            </div>
                        @endif
                    </td>
                    <td style="font-weight: 700; font-size: 13px;">{{ $client->name }}</td>
                    <td style="font-size: 12px;">
                        <span class="badge badge-primary" style="background: #e2e8f0; color: #475467; font-size: 11px; padding: 3px 8px; border-radius: 12px;">{{ $client->sort_order ?? 0 }}</span>
                    </td>
                    <td>
                        <span class="badge badge-{{ $client->is_active ? 'accepted' : 'rejected' }}" style="font-size: 11px; padding: 4px 8px; border-radius: 12px;">
                            @if($client->is_active)
                                Active
                            @else
                                Hidden
                            @endif
                        </span>
                    </td>
                    <td style="font-size: 12px; display: flex; gap: 6px; align-items: center;">
                        <a href="javascript:void(0)" class="btn btn-outline btn-xs" title="Edit" onclick="openEditModal({{ $client->id }})">Edit</a>
                        <form action="{{ route('admin.trusted-clients.destroy', $client->id) }}" method="POST" style="display:inline;" onsubmit="return confirm('Are you sure you want to delete this client?')">
                            @csrf @method('DELETE')
                            <button type="submit" class="btn btn-outline btn-xs text-danger" title="Delete">Del</button>
                        </form>
                    </td>
                </tr>
            @empty
                <tr>
                    <td colspan="6" style="text-align: center; padding: 40px; color: var(--muted);">
                        <div style="background: #f8fafc; border: 1px dashed #e2e8f0; border-radius: 12px; padding: 32px;">
                            <p style="margin: 0 0 12px 0; font-size: 14px; color: var(--muted);">No trusted clients found.</p>
                            <p style="margin: 8px 0 0 0; font-size: 13px; color: var(--muted);">Add your first client to appear here.</p>
                        </div>
                    </td>
                </tr>
            @endforelse
        </tbody>
    </table>
</div>

<!-- Modals -->
<!-- Add Client Modal -->
<div id="addClientModal" style="display: none; position: fixed; inset: 0; background: rgba(7,19,33,0.55); z-index: 1000; align-items: center; justify-content: center;">
    <div class="modal-card" style="max-width: 480px; width: 92%; background: #fff; border-radius: 16px; padding: 28px;">
        <h3 style="margin: 0 0 24px 0; font-size: 20px; font-weight: 800;">Add New Trusted Client</h3>
        <form action="{{ route('admin.trusted-clients.store') }}" method="POST" enctype="multipart/form-data">
            @csrf
            <input type="hidden" name="is_active" value="1">
            <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 20px; margin-bottom: 24px;">
                <div>
                    <label style="display: block; font-size: 13px; font-weight: 700; color: var(--ink); margin-bottom: 8px;">Client Name *</label>
                    <input type="text" name="name" class="form-control" required style="width: 100%; padding: 10px 12px; border: 1px solid #e2e8f0; border-radius: 8px; font-size: 14px;">
                </div>
                <div>
                    <label style="display: block; font-size: 13px; font-weight: 700; color: var(--ink); margin-bottom: 8px;">Logo *</label>
                    <div style="border: 1px solid #e2e8f0; border-radius: 8px; padding: 12px; position: relative; min-height: 120px;">
                        <img id="addLogoPreview" src="#" alt="Logo preview" style="position: absolute; inset: 0; width: 100%; height: 100%; object-fit: contain; display: none;">
                        <div id="addLogoPlaceholder" style="text-align: center; color: #64748b;">Click to upload logo</div>
                        <input type="file" name="logo" accept="image/png, image/jpeg, image/webp, image/svg+xml" required style="position: absolute; inset: 0; opacity: 0;">
                    </div>
                    <div id="addLogoError" style="margin-top: 8px; font-size: 12px; color: #e53e3e; display: none;"></div>
                </div>
            </div>
            <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 20px; margin-bottom: 24px;">
                <div>
                    <label style="display: block; font-size: 13px; font-weight: 700; color: var(--ink); margin-bottom: 8px;">Sort Order</label>
                    <input type="number" name="sort_order" class="form-control" value="0" style="width: 100%; padding: 10px 12px; border: 1px solid #e2e8f0; border-radius: 8px; font-size: 14px;">
                </div>
                <div>
                    <label style="display: block; font-size: 13px; font-weight: 700; color: var(--ink); margin-bottom: 8px;">Active</label>
                    <div style="display: flex; align-items: center; gap: 8px;">
                        <input type="checkbox" name="is_active" class="form-check-input" id="modalIsActive" checked style="width: 20px; height: 20px;">
                        <span style="font-size: 14px; color: var(--ink);">Active</span>
                    </div>
                </div>
            </div>
            <div style="display: flex; justify-content: flex-end; gap: 12px; margin-top: 24px;">
                <button type="button" class="btn btn-outline" style="padding: 10px 20px; font-size: 14px;" onclick="closeAddModal()">Cancel</button>
                <button type="submit" class="btn btn-sun" style="padding: 10px 20px; font-size: 14px;">Save Client</button>
            </div>
        </form>
    </div>
</div>

<!-- Edit Client Modal -->
<div id="editClientModal" style="display: none; position: fixed; inset: 0; background: rgba(7,19,33,0.55); z-index: 1000; align-items: center; justify-content: center;">
    <div class="modal-card" style="max-width: 480px; width: 92%; background: #fff; border-radius: 16px; padding: 28px;">
        <h3 style="margin: 0 0 24px 0; font-size: 20px; font-weight: 800;">Edit Trusted Client</h3>
        <form action="{{ route('admin.trusted-clients.update', '#clientId') }}" method="POST" enctype="multipart/form-data">
            @csrf
            <input type="hidden" name="clientId" id="editClientId" value="">
            <input type="hidden" name="is_active" id="editIsActive">
            <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 20px; margin-bottom: 24px;">
                <div>
                    <label style="display: block; font-size: 13px; font-weight: 700; color: var(--ink); margin-bottom: 8px;">Client Name *</label>
                    <input type="text" name="name" id="editClientName" class="form-control" required style="width: 100%; padding: 10px 12px; border: 1px solid #e2e8f0; border-radius: 8px; font-size: 14px;">
                </div>
                <div>
                    <label style="display: block; font-size: 13px; font-weight: 700; color: var(--ink); margin-bottom: 8px;">Logo</label>
                    <div style="border: 1px solid #e2e8f0; border-radius: 8px; padding: 12px; position: relative; min-height: 120px;">
                        <img id="editLogoPreview" src="#" alt="Logo preview" style="position: absolute; inset: 0; width: 100%; height: 100%; object-fit: contain; display: none;">
                        <div id="editLogoPlaceholder" style="text-align: center; color: #64748b;">Current: {{ old('name', '') }}</div>
                        <input type="file" name="logo" accept="image/png, image/jpeg, image/webp, image/svg+xml" style="position: absolute; inset: 0; opacity: 0;">
                    </div>
                    <div id="editLogoError" style="margin-top: 8px; font-size: 12px; color: #e53e3e; display: none;"></div>
                </div>
            </div>
            <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 20px; margin-bottom: 24px;">
                <div>
                    <label style="display: block; font-size: 13px; font-weight: 700; color: var(--ink); margin-bottom: 8px;">Sort Order</label>
                    <input type="number" name="sort_order" id="editSortOrder" class="form-control" value="0" style="width: 100%; padding: 10px 12px; border: 1px solid #e2e8f0; border-radius: 8px; font-size: 14px;">
                </div>
                <div>
                    <label style="display: block; font-size: 13px; font-weight: 700; color: var(--ink); margin-bottom: 8px;">Active</label>
                    <div style="display: flex; align-items: center; gap: 8px;">
                        <input type="checkbox" name="is_active" class="form-check-input" id="editIsActiveDefault" checked style="width: 20px; height: 20px;">
                        <span style="font-size: 14px; color: var(--ink);">Active</span>
                    </div>
                </div>
            </div>
            <div style="display: flex; justify-content: flex-end; gap: 12px; margin-top: 24px;">
                <button type="button" class="btn btn-outline" style="padding: 10px 20px; font-size: 14px;" onclick="closeEditModal()">Cancel</button>
                <button type="submit" class="btn btn-sun" style="padding: 10px 20px; font-size: 14px;">Update Client</button>
            </div>
        </form>
    </div>
</div>

<script>
function openAddModal() {
    document.getElementById('addClientModal').style.display = 'flex';
    document.getElementById('addLogoPreview').style.display = 'none';
    document.getElementById('addLogoPlaceholder').style.display = 'block';
    document.getElementById('addLogoError').style.display = 'none';
    document.getElementById('addClientModal').setAttribute('aria-hidden', 'false');
    document.body.style.overflow = 'hidden';
}

function closeAddModal() {
    document.getElementById('addClientModal').style.display = 'none';
    document.body.style.overflow = '';
    document.getElementById('addClientModal').setAttribute('aria-hidden', 'true');
}

function openEditModal(clientId) {
    // Fetch client data or populate from known data
    document.getElementById('editClientId').value = clientId;
    // For demo, populate with placeholder data - in real app, fetch via AJAX
    document.getElementById('editClientName').value = 'Client Name';
    document.getElementById('editLogoPreview').style.display = 'none';
    document.getElementById('editLogoPlaceholder').style.display = 'block';
    document.getElementById('editLogoError').style.display = 'none';
    document.getElementById('editClientModal').style.display = 'flex';
    document.body.style.overflow = 'hidden';
    document.getElementById('editClientModal').setAttribute('aria-hidden', 'false');
}

function closeEditModal() {
    document.getElementById('editClientModal').style.display = 'none';
    document.body.style.overflow = '';
    document.getElementById('editClientModal').setAttribute('aria-hidden', 'true');
}
</script>

@endsection