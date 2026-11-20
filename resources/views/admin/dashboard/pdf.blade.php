@php
    $logoPath = public_path('logo/beta-metal-logo-horizontal-white.png');
    $logo = file_exists($logoPath)
        ? 'data:image/png;base64,' . base64_encode(file_get_contents($logoPath))
        : null;
@endphp
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>BETA Executive Report — {{ $year }} {{ $periodLabel }}</title>
    <style>
        @page { margin: 10mm; }
        * { box-sizing: border-box; }
        body, table, td, th, div, span, p {
            font-family: "DejaVu Sans", sans-serif;
        }
        body {
            margin: 0;
            padding: 0;
            font-size: 8.5px;
            line-height: 1.45;
            color: #071321;
            background: #ffffff;
        }
        .header {
            background: #071321;
            color: #ffffff;
            padding: 14px 18px;
            margin-bottom: 10px;
        }
        .header-table { width: 100%; border-collapse: collapse; }
        .header-table td { vertical-align: middle; padding: 0; }
        .logo { height: 30px; }
        .report-title {
            font-size: 16px;
            font-weight: bold;
            letter-spacing: 1.6px;
            color: #ffffff;
        }
        .report-subtitle {
            margin-top: 3px;
            font-size: 8px;
            letter-spacing: 1px;
            color: #F2A900;
            text-transform: uppercase;
        }
        .header-meta {
            text-align: right;
            font-size: 8px;
            line-height: 1.6;
            color: #cbd5e1;
        }
        .header-meta strong { color: #ffffff; }
        .accent-bar { height: 4px; background: #F2A900; margin-bottom: 12px; }

        .section-title {
            margin: 0 0 6px;
            padding-left: 7px;
            border-left: 3px solid #F2A900;
            font-size: 9.5px;
            font-weight: bold;
            letter-spacing: .9px;
            text-transform: uppercase;
            color: #071321;
        }
        .section-note {
            font-size: 7.5px;
            color: #6b7280;
            margin: -2px 0 7px;
        }

        table.data {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 11px;
        }
        table.data th,
        table.data td {
            border: 1px solid #e5e7eb;
            padding: 4px 6px;
            text-align: left;
            vertical-align: top;
        }
        table.data th {
            background: #F4F2EB;
            font-size: 7.5px;
            letter-spacing: .5px;
            text-transform: uppercase;
            color: #4b5563;
        }
        table.data td.num,
        table.data th.num { text-align: right; }
        table.data tr.total td {
            background: #F4F2EB;
            font-weight: bold;
        }
        .currency-tag {
            display: inline-block;
            padding: 2px 7px;
            border: 1px solid #F2A900;
            background: #fff7e0;
            color: #7a5200;
            font-size: 7px;
            font-weight: bold;
            letter-spacing: .8px;
        }

        table.fin-grid,
        table.chart-grid {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 10px;
        }
        table.fin-grid > tbody > tr > td,
        table.chart-grid > tbody > tr > td {
            width: 50%;
            vertical-align: top;
            padding: 0 5px;
        }
        table.fin-grid > tbody > tr > td:first-child,
        table.chart-grid > tbody > tr > td:first-child { padding-left: 0; }
        table.fin-grid > tbody > tr > td:last-child,
        table.chart-grid > tbody > tr > td:last-child { padding-right: 0; }

        .fin-box {
            border: 1px solid #e5e7eb;
            border-top: 3px solid #003087;
            padding: 7px 8px;
        }
        .fin-box.sar { border-top-color: #F2A900; }
        .fin-title {
            font-size: 9px;
            font-weight: bold;
            letter-spacing: .8px;
            text-transform: uppercase;
            margin-bottom: 5px;
        }
        .fin-row {
            display: block;
            padding: 4px 0;
            border-bottom: 1px solid #eef0f3;
        }
        .fin-row:last-child { border-bottom: none; }
        .fin-label { color: #6b7280; font-size: 7.5px; }
        .fin-value {
            float: right;
            font-weight: bold;
            font-size: 9px;
            color: #071321;
        }
        .fin-value.green { color: #276749; }

        .chart-cell {
            border: 1px solid #e5e7eb;
            padding: 5px;
            margin-bottom: 8px;
        }
        .chart-label {
            font-size: 7.5px;
            font-weight: bold;
            color: #4b5563;
            letter-spacing: .5px;
            text-transform: uppercase;
            margin-bottom: 4px;
        }
        .chart-img { width: 100%; }
        .chart-missing {
            padding: 30px 8px;
            text-align: center;
            font-size: 7.5px;
            color: #9ca3af;
            background: #f9fafb;
        }

        .footer {
            margin-top: 8px;
            padding-top: 6px;
            border-top: 1px solid #e5e7eb;
            font-size: 7px;
            color: #6b7280;
        }
        .footer-right { float: right; color: #F2A900; font-weight: bold; }
    </style>
</head>
<body>

<div class="header">
    <table class="header-table">
        <tr>
            <td width="55%">
                @if($logo)
                    <img src="{{ $logo }}" alt="BETA Industrial" class="logo">
                @else
                    <div class="report-title">BETA</div>
                @endif
                <div class="report-subtitle">Executive Sales Report</div>
            </td>
            <td width="45%" class="header-meta">
                <div><strong>{{ $year }}</strong> &bull; {{ $periodLabel }}</div>
                <div>{{ $startDate->format('d M Y') }} – {{ $endDate->format('d M Y') }}</div>
                <div>Generated {{ now()->format('d M Y H:i') }}</div>
            </td>
        </tr>
    </table>
</div>
<div class="accent-bar"></div>

<div class="section-title">Quote Funnel &amp; Source Summary</div>
<table class="data">
    <thead>
        <tr>
            <th>Total Quotes</th>
            <th>Deals Won</th>
            <th>Deals Lost</th>
            <th>Open / Quoted</th>
            <th>Win Rate</th>
            <th>Website Leads</th>
            <th>Event / Manual</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td class="num">{{ number_format($totalQuotes) }}</td>
            <td class="num">{{ number_format($dealsWon) }}</td>
            <td class="num">{{ number_format($dealsLost) }}</td>
            <td class="num">{{ number_format($openQuoted) }}</td>
            <td class="num">{{ number_format($winRate, 1) }}%</td>
            <td class="num">{{ number_format($sourceCounts['website']) }}</td>
            <td class="num">{{ number_format($sourceCounts['manual']) }}</td>
        </tr>
    </tbody>
</table>

<div class="section-title">Separated Financial Summary</div>
<div class="section-note">EGP and SAR are reported independently. No combined cross-currency total is calculated.</div>
<table class="fin-grid">
    <tr>
        <td>
            <div class="fin-box">
                <div class="fin-title">EGP Financials <span class="currency-tag">EGP</span></div>
                <div class="fin-row">
                    <span class="fin-label">Realized Revenue</span>
                    <span class="fin-value">{{ number_format($financials['EGP']['realized'], 2) }} EGP</span>
                </div>
                <div class="fin-row">
                    <span class="fin-label">Gross Profit</span>
                    <span class="fin-value green">{{ number_format($financials['EGP']['profit'], 2) }} EGP</span>
                </div>
                <div class="fin-row">
                    <span class="fin-label">Open Pipeline Value</span>
                    <span class="fin-value">{{ number_format($financials['EGP']['pipeline'], 2) }} EGP</span>
                </div>
            </div>
        </td>
        <td>
            <div class="fin-box sar">
                <div class="fin-title">SAR Financials <span class="currency-tag">SAR</span></div>
                <div class="fin-row">
                    <span class="fin-label">Realized Revenue</span>
                    <span class="fin-value">{{ number_format($financials['SAR']['realized'], 2) }} SAR</span>
                </div>
                <div class="fin-row">
                    <span class="fin-label">Gross Profit</span>
                    <span class="fin-value green">{{ number_format($financials['SAR']['profit'], 2) }} SAR</span>
                </div>
                <div class="fin-row">
                    <span class="fin-label">Open Pipeline Value</span>
                    <span class="fin-value">{{ number_format($financials['SAR']['pipeline'], 2) }} SAR</span>
                </div>
            </div>
        </td>
    </tr>
</table>

<div class="section-title">Rendered Charts</div>
<table class="chart-grid">
    <tr>
        <td>
            <div class="chart-cell">
                <div class="chart-label">EGP Monthly Revenue &amp; Gross Profit</div>
                @if(!empty($chartImages['egp']))
                    <img src="{{ $chartImages['egp'] }}" alt="EGP chart" class="chart-img">
                @else
                    <div class="chart-missing">Chart image not provided.</div>
                @endif
            </div>
        </td>
        <td>
            <div class="chart-cell">
                <div class="chart-label">SAR Monthly Revenue &amp; Gross Profit</div>
                @if(!empty($chartImages['sar']))
                    <img src="{{ $chartImages['sar'] }}" alt="SAR chart" class="chart-img">
                @else
                    <div class="chart-missing">Chart image not provided.</div>
                @endif
            </div>
        </td>
    </tr>
    <tr>
        <td>
            <div class="chart-cell">
                <div class="chart-label">Quote Conversion Funnel</div>
                @if(!empty($chartImages['funnel']))
                    <img src="{{ $chartImages['funnel'] }}" alt="Funnel chart" class="chart-img">
                @else
                    <div class="chart-missing">Chart image not provided.</div>
                @endif
            </div>
        </td>
        <td>
            <div class="chart-cell">
                <div class="chart-label">Sales Rep Performance Comparison</div>
                @if(!empty($chartImages['reps']))
                    <img src="{{ $chartImages['reps'] }}" alt="Sales rep chart" class="chart-img">
                @else
                    <div class="chart-missing">Chart image not provided.</div>
                @endif
            </div>
        </td>
    </tr>
</table>

<div class="section-title">Sales Team Performance Leaderboard</div>
<table class="data">
    <thead>
        <tr>
            <th>Sales Rep</th>
            <th class="num">Quotes</th>
            <th class="num">Won</th>
            <th class="num">Win Rate</th>
            <th class="num">EGP Revenue</th>
            <th class="num">SAR Revenue</th>
        </tr>
    </thead>
    <tbody>
        @forelse($salesRepStats as $rep)
            <tr>
                <td>{{ $rep['name'] }}</td>
                <td class="num">{{ number_format($rep['total_quotes']) }}</td>
                <td class="num">{{ number_format($rep['won']) }}</td>
                <td class="num">{{ number_format($rep['win_rate'], 1) }}%</td>
                <td class="num">{{ number_format($rep['egp_revenue'], 2) }} EGP</td>
                <td class="num">{{ number_format($rep['sar_revenue'], 2) }} SAR</td>
            </tr>
        @empty
            <tr>
                <td colspan="6" style="text-align:center;color:#6b7280">No sales reps found.</td>
            </tr>
        @endforelse
    </tbody>
</table>

<div class="footer">
    BETA Industrial — Executive Sales Report &bull; {{ $year }} &bull; {{ $periodLabel }}
    <span class="footer-right">EGP &amp; SAR REPORTED SEPARATELY</span>
</div>

</body>
</html>
