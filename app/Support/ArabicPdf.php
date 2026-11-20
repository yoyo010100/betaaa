<?php

namespace App\Support;

use ArPHP\I18N\Arabic;
use Barryvdh\DomPDF\Facade\Pdf;
use Barryvdh\DomPDF\PDF as DomPdfWrapper;

class ArabicPdf
{
    protected static ?Arabic $arabic = null;

    protected static function getArabic(): Arabic
    {
        return self::$arabic ??= new Arabic();
    }

    /**
     * Load and render a Blade view with automatic Arabic glyph shaping and line-ordering.
     */
    public static function loadView(string $view, array $data = [], int $wrapLength = 75): DomPdfWrapper
    {
        $html = view($view, $data)->render();
        $shapedHtml = self::shapeHtml($html, $wrapLength);

        /** @var DomPdfWrapper $pdf */
        $pdf = Pdf::loadHTML($shapedHtml);

        $pdf->setOption([
            'defaultFont' => 'DejaVu Sans',
            'isHtml5ParserEnabled' => true,
            'isRemoteEnabled' => false,
        ]);

        return $pdf;
    }

    /**
     * Automatically shape all Arabic text nodes in the given HTML string.
     * Skips <style>, <script>, comments, and tag attributes.
     * Multi-line wrapped segments convert newlines to <br> to ensure DomPDF renders
     * top-to-bottom line order.
     */
    public static function shapeHtml(string $html, int $wrapLength = 75): string
    {
        $arabic = self::getArabic();

        // Match <style>...</style>, <script>...</script>, comments, HTML tags, or text nodes outside tags.
        $pattern = '/<(style|script)\b[^>]*>.*?<\/\1>|<!--.*?-->|<[^>]+>|([^<]+)/su';

        return (string) preg_replace_callback($pattern, function (array $matches) use ($arabic, $wrapLength) {
            // Group 2 contains text node content outside tags, style/script, and comments.
            if (!isset($matches[2]) || $matches[2] === '') {
                return $matches[0];
            }

            $text = $matches[2];

            // If there are no Arabic characters, keep text untouched.
            if (!preg_match('/\p{Arabic}/u', $text)) {
                return $matches[0];
            }

            // Preserve leading and trailing whitespace so indentation/formatting is intact.
            if (preg_match('/^(\s*)(.*?)(\s*)$/su', $text, $parts)) {
                $leading = $parts[1];
                $core = $parts[2];
                $trailing = $parts[3];

                if ($core === '') {
                    return $matches[0];
                }

                $decoded = html_entity_decode($core, ENT_QUOTES | ENT_HTML5, 'UTF-8');
                $shaped = $arabic->utf8Glyphs($decoded, $wrapLength, false, false);
                $encoded = htmlspecialchars($shaped, ENT_QUOTES | ENT_SUBSTITUTE, 'UTF-8');
                $shapedWithBr = str_replace(["\r\n", "\r", "\n"], '<br>', $encoded);

                return $leading . $shapedWithBr . $trailing;
            }

            return $matches[0];
        }, $html);
    }
}
