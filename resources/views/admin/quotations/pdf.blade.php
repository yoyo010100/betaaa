@php
    $lead = $quotation->quoteRequest;
    $currencyCode = strtoupper($quotation->currency?->code ?? '');
    $currencySymbol = $quotation->currency?->symbol ?? '';
    $currencyName = trim((string) ($quotation->currency?->name ?? ''));

    $serviceEn = $lead?->service?->getTitle('en') ?? '';
    $serviceAr = $lead?->service?->getTitle('ar') ?? '';
    $productEn = $lead?->product?->getTitle('en') ?? '';
    $productAr = $lead?->product?->getTitle('ar') ?? '';

    $scope = $lead?->service?->getDescription('en')
        ?: $lead?->product?->getDescription('en')
        ?: $lead?->client_message
        ?: '—';
    $scope = \Illuminate\Support\Str::limit(trim(strip_tags($scope)), 520);

    $scopeAr = $lead?->service?->getDescription('ar')
        ?: $lead?->product?->getDescription('ar')
        ?: '';
    $scopeAr = \Illuminate\Support\Str::limit(trim(strip_tags($scopeAr)), 420);

    $statusLabel = ucwords(str_replace('_', ' ', $quotation->status ?: 'draft'));
    $issuedBy = $quotation->adminUser?->name ?? 'BETA Industrial';
    $issueDate = $quotation->created_at?->format('d M Y') ?? now()->format('d M Y');

    $reference = $reference ?? ('QT-' . ($quotation->created_at?->format('Y') ?? now()->format('Y')) . '-' . strtoupper(substr((string) $quotation->public_id, -8)));

    $logoPath = public_path('logo/beta-metal-logo-horizontal-white.png');
    $logo = file_exists($logoPath)
        ? 'data:image/png;base64,' . base64_encode(file_get_contents($logoPath))
        : null;
@endphp
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>BETA Quotation {{ $reference }}</title>
    <style>
        @page { margin: 0; }
        * { box-sizing: border-box; }
        body, table, td, th, div, span, p, ol, ul, li {
            font-family: "DejaVu Sans", sans-serif;
        }
        body {
            margin: 0;
            padding: 0;
            font-size: 10.5px;
            line-height: 1.5;
            color: #071321;
            background: #ffffff;
        }
        .page { width: 100%; }
        .header {
            background: #071321;
            color: #ffffff;
            padding: 26px 34px 22px;
        }
        .header-table { width: 100%; border-collapse: collapse; }
        .header-table td { vertical-align: middle; padding: 0; }
        .logo { height: 38px; }
        .brand-name {
            font-size: 20px;
            font-weight: bold;
            letter-spacing: 3px;
            color: #ffffff;
        }
        .brand-tagline {
            margin-top: 3px;
            font-size: 8.5px;
            letter-spacing: 1.8px;
            text-transform: uppercase;
            color: #F2A900;
        }
        .doc-type {
            text-align: right;
            font-size: 16px;
            font-weight: bold;
            letter-spacing: 2.4px;
            color: #ffffff;
        }
        .doc-type-ar {
            unicode-bidi: embed;
            direction: ltr;
            text-align: right;
            font-size: 11px;
            color: #F2A900;
            margin-top: 3px;
        }
        .accent-bar { height: 6px; background: #F2A900; }
        .content { padding: 24px 34px 0; }

        .meta-table { width: 100%; border-collapse: collapse; margin-bottom: 20px; }
        .meta-table td { padding: 0; vertical-align: top; }
        .meta-box {
            background: #F4F2EB;
            border: 1px solid #e3dfd2;
            padding: 10px 12px;
        }
        .meta-label {
            font-size: 7.5px;
            font-weight: bold;
            letter-spacing: 1.1px;
            text-transform: uppercase;
            color: #6b7280;
        }
        .meta-value { margin-top: 3px; font-size: 11px; font-weight: bold; color: #071321; }
        .meta-value-ar { unicode-bidi: embed; direction: ltr; font-size: 9px; color: #4b5563; margin-top: 1px; }

        .status-badge {
            display: inline-block;
            padding: 4px 10px;
            border: 1px solid #F2A900;
            background: #fff7e0;
            color: #7a5200;
            font-size: 8px;
            font-weight: bold;
            letter-spacing: 1px;
            text-transform: uppercase;
        }

        .section-title {
            margin: 0 0 9px;
            padding-left: 9px;
            border-left: 4px solid #F2A900;
            font-size: 11.5px;
            font-weight: bold;
            letter-spacing: 1.2px;
            text-transform: uppercase;
            color: #071321;
        }
        .section-title-ar {
            unicode-bidi: embed;
            direction: ltr;
            float: right;
            font-size: 9px;
            font-weight: normal;
            letter-spacing: 0;
            text-transform: none;
            color: #6b7280;
        }

        .info-table { width: 100%; border-collapse: collapse; margin-bottom: 20px; }
        .info-table td {
            width: 50%;
            padding: 8px 10px;
            border: 1px solid #e5e7eb;
            vertical-align: top;
        }
        .info-table td.alt { background: #fbfaf6; }
        .info-label {
            font-size: 7.5px;
            font-weight: bold;
            letter-spacing: 1px;
            text-transform: uppercase;
            color: #6b7280;
        }
        .info-label-ar { unicode-bidi: embed; direction: ltr; font-size: 8px; color: #9ca3af; font-weight: normal; }
        .info-value { margin-top: 3px; font-size: 10.5px; font-weight: bold; color: #071321; word-wrap: break-word; }
        .info-value-ar { unicode-bidi: embed; direction: ltr; font-size: 9px; color: #4b5563; margin-top: 1px; }

        .scope-box {
            border: 1px solid #e5e7eb;
            border-top: 3px solid #071321;
            padding: 11px 12px;
            margin-bottom: 20px;
            background: #ffffff;
        }
        .scope-text { font-size: 9.5px; line-height: 1.65; color: #374151; }
        .scope-text-ar { unicode-bidi: embed; direction: ltr; text-align: right; font-size: 9px; line-height: 1.7; color: #4b5563; margin-top: 6px; }

        .financial-box {
            background: #F4F2EB;
            border: 1px solid #e3dfd2;
            border-left: 5px solid #F2A900;
            padding: 15px 16px;
            margin-bottom: 18px;
        }
        .financial-table { width: 100%; border-collapse: collapse; }
        .financial-table td { padding: 5px 0; vertical-align: middle; }
        .financial-label {
            font-size: 8px;
            font-weight: bold;
            letter-spacing: 1px;
            text-transform: uppercase;
            color: #6b7280;
        }
        .financial-label-ar { unicode-bidi: embed; direction: ltr; font-size: 8px; color: #9ca3af; font-weight: normal; }
        .financial-value { font-size: 11px; font-weight: bold; color: #071321; }
        .total-row td { border-top: 1px solid #d8d2c2; padding-top: 10px; }
        .total-label { font-size: 10px; font-weight: bold; letter-spacing: 1px; text-transform: uppercase; color: #071321; }
        .total-amount { text-align: right; font-size: 20px; font-weight: bold; color: #071321; }
        .total-currency { font-size: 9px; font-weight: bold; letter-spacing: 1.5px; color: #8a6a00; text-align: right; }

        .terms { margin-bottom: 16px; }
        .terms-title {
            font-size: 9px;
            font-weight: bold;
            letter-spacing: 1.2px;
            text-transform: uppercase;
            color: #071321;
            margin-bottom: 6px;
        }
        .terms-title-ar { unicode-bidi: embed; direction: ltr; font-size: 8.5px; color: #6b7280; font-weight: normal; }
        .terms-list { margin: 0; padding-left: 14px; color: #4b5563; font-size: 8.5px; line-height: 1.65; }
        .terms-list li { margin-bottom: 2px; }

        .signature-table { width: 100%; border-collapse: collapse; margin-top: 12px; }
        .signature-table td { width: 50%; vertical-align: bottom; padding: 0; }
        .signature-line {
            border-top: 1px solid #9ca3af;
            margin-top: 30px;
            padding-top: 4px;
            font-size: 8px;
            color: #6b7280;
            letter-spacing: .6px;
            text-transform: uppercase;
        }

        .footer {
            margin-top: 18px;
            padding: 9px 34px;
            background: #071321;
            color: #cbd5e1;
            font-size: 7.5px;
            letter-spacing: .5px;
        }
        .footer-table { width: 100%; border-collapse: collapse; }
        .footer-table td { padding: 0; vertical-align: middle; }
        .footer-right { text-align: right; color: #F2A900; font-weight: bold; }
        .arabic { unicode-bidi: embed; direction: ltr; font-family: "DejaVu Sans", sans-serif; }
    </style>
</head>
<body>
<div class="page">

    {{-- HEADER --}}
    <div class="header">
        <table class="header-table">
            <tr>
                <td width="55%">
                    @if($logo)
                        <img src="{{ $logo }}" alt="BETA Industrial" class="logo">
                    @else
                        <div class="brand-name">BETA</div>
                    @endif
                    <div class="brand-tagline">Industrial &amp; Metals Solutions</div>
                </td>
                <td width="45%">
                    <div class="doc-type">QUOTATION RECEIPT</div>
                    <div class="doc-type-ar arabic">عرض سعر / إيصال</div>
                </td>
            </tr>
        </table>
    </div>
    <div class="accent-bar"></div>

    <div class="content">

        {{-- REFERENCE / DATE / STATUS --}}
        <table class="meta-table">
            <tr>
                <td width="40%" style="padding-right:8px">
                    <div class="meta-box">
                        <div class="meta-label">Quotation Reference / رقم عرض السعر</div>
                        <div class="meta-value">{{ $reference }}</div>
                    </div>
                </td>
                <td width="30%" style="padding-right:8px">
                    <div class="meta-box">
                        <div class="meta-label">Issue Date / تاريخ الإصدار</div>
                        <div class="meta-value">{{ $issueDate }}</div>
                    </div>
                </td>
                <td width="30%">
                    <div class="meta-box">
                        <div class="meta-label">Status / الحالة</div>
                        <div style="margin-top:4px"><span class="status-badge">{{ $statusLabel }}</span></div>
                    </div>
                </td>
            </tr>
        </table>

        {{-- CLIENT & PROJECT INFORMATION --}}
        <div class="section-title">
            Client &amp; Project Information
            <span class="section-title-ar arabic">معلومات العميل والمشروع</span>
        </div>
        <table class="info-table">
            <tr>
                <td class="alt">
                    <div class="info-label">Client Name / <span class="info-label-ar arabic">اسم العميل</span></div>
                    <div class="info-value">{{ $lead?->client_name ?: '—' }}</div>
                </td>
                <td>
                    <div class="info-label">Company / <span class="info-label-ar arabic">الشركة</span></div>
                    <div class="info-value">{{ $lead?->company_name ?: '—' }}</div>
                </td>
            </tr>
            <tr>
                <td>
                    <div class="info-label">Email / <span class="info-label-ar arabic">البريد الإلكتروني</span></div>
                    <div class="info-value">{{ $lead?->email ?: '—' }}</div>
                </td>
                <td class="alt">
                    <div class="info-label">Phone / <span class="info-label-ar arabic">رقم الهاتف</span></div>
                    <div class="info-value">{{ $lead?->phone ?: '—' }}</div>
                </td>
            </tr>
            <tr>
                <td class="alt">
                    <div class="info-label">Country / <span class="info-label-ar arabic">الدولة</span></div>
                    <div class="info-value">{{ $lead?->country?->name ?: '—' }}</div>
                </td>
                <td>
                    <div class="info-label">Requested Service / <span class="info-label-ar arabic">الخدمة المطلوبة</span></div>
                    <div class="info-value">{{ $serviceEn ?: '—' }}</div>
                    @if($serviceAr && $serviceAr !== $serviceEn)
                        <div class="info-value-ar arabic">{{ $serviceAr }}</div>
                    @endif
                </td>
            </tr>
            <tr>
                <td>
                    <div class="info-label">Product / <span class="info-label-ar arabic">المنتج</span></div>
                    <div class="info-value">{{ $productEn ?: '—' }}</div>
                    @if($productAr && $productAr !== $productEn)
                        <div class="info-value-ar arabic">{{ $productAr }}</div>
                    @endif
                </td>
                <td class="alt">
                    <div class="info-label">Prepared By / <span class="info-label-ar arabic">أعد بواسطة</span></div>
                    <div class="info-value">{{ $issuedBy }}</div>
                </td>
            </tr>
        </table>

        {{-- SCOPE SUMMARY --}}
        <div class="section-title">
            Scope Summary
            <span class="section-title-ar arabic">ملخص النطاق</span>
        </div>
        <div class="scope-box">
            <div class="scope-text">{!! nl2br(e($scope)) !!}</div>
            @if($scopeAr && $scopeAr !== $scope)
                <div class="scope-text-ar arabic">{{ $scopeAr }}</div>
            @endif
        </div>

        {{-- FINANCIAL BREAKDOWN (client-facing only) --}}
        <div class="section-title">
            Financial Summary
            <span class="section-title-ar arabic">الملخص المالي</span>
        </div>
        <div class="financial-box">
            <table class="financial-table">
                <tr>
                    <td>
                        <div class="financial-label">Currency / <span class="financial-label-ar arabic">العملة</span></div>
                        <div class="financial-value">
                            {{ $currencyCode }} @if($currencyName && $currencyName !== $currencyCode) — {{ $currencyName }}@endif
                        </div>
                    </td>
                    <td style="text-align:right">
                        <div class="financial-label">Quotation Total / <span class="financial-label-ar arabic">إجمالي عرض السعر</span></div>
                        <div class="total-currency">{{ $currencyCode }}</div>
                        <div class="total-amount">{{ $currencySymbol }} {{ number_format((float) $quotation->selling_price, 2) }}</div>
                    </td>
                </tr>
                <tr class="total-row">
                    <td colspan="2" style="font-size:8.5px;color:#6b7280">
                        Total payable as quoted in {{ $currencyCode }}. Applicable taxes, duties or shipping are not included unless expressly stated.
                    </td>
                </tr>
            </table>
        </div>

        {{-- VALIDITY & TERMS --}}
        <div class="terms">
            <div class="terms-title">
                Validity &amp; Terms
                <span class="terms-title-ar arabic">الصلاحية والشروط</span>
            </div>
            <ol class="terms-list">
                <li>This quotation is valid for <strong>30 days</strong> from the issue date shown above.</li>
                <li>All prices are quoted in <strong>{{ $currencyCode }}</strong> and exclude applicable taxes, duties or shipping unless expressly stated.</li>
                <li>Production and delivery schedules commence upon written acceptance of this quotation and agreement of payment terms.</li>
                <li>This is a system-generated quotation receipt and is valid without a handwritten signature.</li>
            </ol>
        </div>

        {{-- SIGNATURES --}}
        <table class="signature-table">
            <tr>
                <td style="padding-right:20px">
                    <div class="signature-line">Client Acceptance / قبول العميل</div>
                </td>
                <td style="padding-left:20px">
                    <div class="signature-line">For BETA Industrial / عن شركة بيتا الصناعية</div>
                </td>
            </tr>
        </table>

    </div>

    {{-- FOOTER --}}
    <div class="footer">
        <table class="footer-table">
            <tr>
                <td>BETA Industrial — Quotation Receipt {{ $reference }}</td>
                <td class="footer-right">VALID FOR 30 DAYS</td>
            </tr>
        </table>
    </div>

</div>
</body>
</html>
