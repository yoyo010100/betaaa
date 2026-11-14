-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Nov 14, 2026 at 02:33 PM
-- Server version: 8.0.46
-- PHP Version: 8.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `beta`
--

-- --------------------------------------------------------

--
-- Table structure for table `announcements`
--

CREATE TABLE `announcements` (
  `id` bigint UNSIGNED NOT NULL,
  `public_id` char(26) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` json NOT NULL,
  `slug` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'news',
  `excerpt` json DEFAULT NULL,
  `content` json NOT NULL,
  `published_at` datetime DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `announcements`
--

INSERT INTO `announcements` (`id`, `public_id`, `title`, `slug`, `type`, `excerpt`, `content`, `published_at`, `is_active`, `created_at`, `updated_at`) VALUES
(1, '01M713QQYEQP8JXY27B87256BS', '{\"ar\": \"بيتا تفوز بعقد توريد وتصنيع 4500 طن هياكل معدنية بمجمع العين السخنة\", \"en\": \"BETA Awarded 4,500-Ton Heavy Steel Expansion in Ain Sokhna\"}', 'beta-awarded-ain-sokhna-petrochemical-contract', 'press_release', '{\"ar\": \"بيتا الصناعية توقع عقداً بارزاً لتصنيع وتركيب مسارات الأنابيب والهياكل الثقيلة بالمنطقة الاقتصادية لقناة السويس.\", \"en\": \"BETA Industrial secures landmark contract to fabricate and install high-tonnage pipe racks and heavy structures in Suez Economic Zone.\"}', '{\"ar\": \"فازت شركة بيتا للصناعات المعدنية رسمياً بحزمة الأعمال الإنشائية الرئيسية لمجمع البتروكيماويات بالعين السخنة. يشمل نطاق العمل النمذجة الهندسية وتصنيع 4500 طن من المنشآت الفولاذية الثقيلة والجلفنة والتركيب في فترة قياسية مدتها 9 أشهر.\", \"en\": \"BETA Industrial has officially been awarded the primary structural steel package for the new chemical processing terminal in Ain Sokhna, Egypt. The scope entails engineering 3D Tekla modeling, 4,500 tons of heavy welded plate girders, hot-dip galvanizing, and turnkey erection within an accelerated 9-month timeframe.\"}', '2026-11-04 21:34:26', 1, '2026-11-09 19:34:26', '2026-11-09 19:34:26'),
(2, '01M713QQYNYAP12HD810WJJ8EG', '{\"ar\": \"بيتا تعزز عملياتها اللوجستية وتوسع شراكاتها في المدن الصناعية (مدن) بالرياض\", \"en\": \"BETA Strengthens Logistics Hub & MODON Operations in Riyadh KSA\"}', 'saudi-arabia-riyadh-fabrication-hub-expansion', 'news', '{\"ar\": \"توسع استراتيجي لشركة بيتا في المملكة العربية السعودية لدعم المشاريع العملاقة والمستودعات اللوجستية.\", \"en\": \"Strategic expansion in Saudi Arabia to support giga-projects and industrial logistics warehousing across the Kingdom.\"}', '{\"ar\": \"ضمن التزامنا برؤية المملكة 2030، قامت بيتا بتوسيع مركز التنسيق الهندسي والميداني في الرياض لتوريد وتركيب الهياكل الفولاذية للمستودعات اللوجستية الكبرى وفق أعلى المواصفات السعودية SASO.\", \"en\": \"As part of our commitment to Saudi Vision 2030, BETA Industrial has expanded its technical coordination center in Riyadh, partnering with regional logistics developers to supply certified heavy structural frames and rapid-erection warehouse solutions.\"}', '2026-10-28 21:34:26', 1, '2026-11-09 19:34:26', '2026-11-09 19:34:26'),
(3, '01M713QQYYCEW8FJYD5BZXEMK9', '{\"ar\": \"بيتا تجدد اعتمادات الجودة العالمية للحام والإنتاج الإنشائي ISO 3834-2 و EN 1090-2\", \"en\": \"BETA Renews ISO 3834-2 & EN 1090-2 Global Welding Certifications\"}', 'iso-3834-and-en-1090-welding-quality-accreditation', 'news', '{\"ar\": \"تأكيد الالتزام بأعلى معايير الجودة العالمية والفحص غير الإتلافي للحامات الهياكل الإنشائية الثقيلة.\", \"en\": \"International audits confirm rigorous quality assurance, non-destructive testing (NDT), and certified welding coordination.\"}', '{\"ar\": \"أتمت مصانع بيتا بنجاح التدقيق السنوي الشامل لشهادة الجودة العالمية للحام المنصهر للمواد المعدنية ومطابقة شهادة تصنيع الهياكل الفولاذية الأوربية حتى الدرجة EXC3.\", \"en\": \"Our manufacturing plants have successfully completed the comprehensive audit for ISO 3834-2 (Comprehensive Quality Requirements for Fusion Welding of Metallic Materials) and EN 1090-2 Execution Class EXC3.\"}', '2026-10-20 21:34:26', 1, '2026-11-09 19:34:26', '2026-11-09 19:34:26');

-- --------------------------------------------------------

--
-- Table structure for table `attachments`
--

CREATE TABLE `attachments` (
  `id` bigint UNSIGNED NOT NULL,
  `public_id` char(26) COLLATE utf8mb4_unicode_ci NOT NULL,
  `attachable_type` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `attachable_id` bigint UNSIGNED NOT NULL,
  `file_path` varchar(512) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mime_type` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size_bytes` bigint UNSIGNED DEFAULT NULL,
  `scan_status` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'passed',
  `uploaded_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `attachments`
--

INSERT INTO `attachments` (`id`, `public_id`, `attachable_type`, `attachable_id`, `file_path`, `file_name`, `mime_type`, `size_bytes`, `scan_status`, `uploaded_at`, `created_at`, `updated_at`) VALUES
(3, '01M7B7A5Z986ZK32XD52VKF06T', 'App\\Models\\Product', 9, 'uploads/products/technical/test_technical_1794599360.pdf', 'السيرة الذاتية - يحيى الجندي.pdf', 'application/pdf', 132929, 'passed', '2026-11-13 17:49:20', '2026-11-13 17:49:20', '2026-11-13 17:49:20'),
(4, '01M7B86YDG72NKYBFPN0QD3MK6', 'App\\Models\\Product', 10, 'uploads/products/technical/test_technical_1794600303.pdf', 'السيرة الذاتية - يحيى الجندي.pdf', 'application/pdf', 132929, 'passed', '2026-11-13 18:05:03', '2026-11-13 18:05:03', '2026-11-13 18:05:03'),
(5, '01M7D41XXSE3NPDF48TE7TH836', 'App\\Models\\Product', 11, 'uploads/products/technical/sea_technical_1794663053.pdf', 'السيرة الذاتية - يحيى الجندي.pdf', 'application/pdf', 132929, 'passed', '2026-11-14 11:30:53', '2026-11-14 11:30:53', '2026-11-14 11:30:53');

-- --------------------------------------------------------

--
-- Table structure for table `audit_logs`
--

CREATE TABLE `audit_logs` (
  `id` bigint UNSIGNED NOT NULL,
  `actor_user_id` bigint UNSIGNED DEFAULT NULL,
  `event_type` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_type` varchar(160) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_id` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `old_values` json DEFAULT NULL,
  `new_values` json DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `audit_logs`
--

INSERT INTO `audit_logs` (`id`, `actor_user_id`, `event_type`, `model_type`, `model_id`, `old_values`, `new_values`, `ip_address`, `user_agent`, `created_at`) VALUES
(1, NULL, 'auth.login_failed', NULL, NULL, NULL, '{\"email\": \"admin@beta.com\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/156.0.0.0 Safari/537.36', '2026-11-09 19:29:55'),
(2, NULL, 'auth.login_failed', NULL, NULL, NULL, '{\"email\": \"admin@beta.com\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/156.0.0.0 Safari/537.36', '2026-11-09 19:29:55'),
(3, NULL, 'quotation.created', 'App\\Models\\Quotation', '01M713QQZP1AX29NAC6RQMTFY4', '[]', '{\"admin_notes\": \"Costing breakdown calculated via internal fabrication rate matrix.\", \"currency_id\": 1, \"factory_cost\": 38000000, \"selling_price\": 49500000}', '127.0.0.1', 'Symfony', '2026-11-09 19:34:26'),
(4, NULL, 'quotation.created', 'App\\Models\\Quotation', '01M713QR11HGT0TR6HT266XXV5', '[]', '{\"admin_notes\": \"Costing breakdown calculated via internal fabrication rate matrix.\", \"currency_id\": 2, \"factory_cost\": 6200000, \"selling_price\": 8400000}', '127.0.0.1', 'Symfony', '2026-11-09 19:34:26'),
(5, NULL, 'quotation.created', 'App\\Models\\Quotation', '01M713QR1FDFNXEPWR2G96H8Z8', '[]', '{\"admin_notes\": \"Costing breakdown calculated via internal fabrication rate matrix.\", \"currency_id\": 1, \"factory_cost\": 24500000, \"selling_price\": 32000000}', '127.0.0.1', 'Symfony', '2026-11-09 19:34:26'),
(6, NULL, 'quotation.created', 'App\\Models\\Quotation', '01M713QR1R15EW39HZ158QNTDN', '[]', '{\"admin_notes\": \"Costing breakdown calculated via internal fabrication rate matrix.\", \"currency_id\": 2, \"factory_cost\": 3100000, \"selling_price\": 4200000}', '127.0.0.1', 'Symfony', '2026-11-09 19:34:26'),
(7, 1, 'auth.login', 'App\\Models\\User', '01M713QQ9Z1MMDHPW2GS553N4E', NULL, '{\"email\": \"admin@beta.com\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT; Windows NT 10.0; en-US) WindowsPowerShell/5.1.26100.9711', '2026-11-09 19:34:52'),
(8, 1, 'auth.login_success', 'App\\Models\\User', '01M713QQ9Z1MMDHPW2GS553N4E', NULL, '{\"role\": \"super_admin\", \"email\": \"admin@beta.com\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT; Windows NT 10.0; en-US) WindowsPowerShell/5.1.26100.9711', '2026-11-09 19:34:52'),
(9, 1, 'auth.login', 'App\\Models\\User', '01M713QQ9Z1MMDHPW2GS553N4E', NULL, '{\"email\": \"admin@beta.com\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/156.0.0.0 Safari/537.36', '2026-11-09 19:34:59'),
(10, 1, 'auth.login_success', 'App\\Models\\User', '01M713QQ9Z1MMDHPW2GS553N4E', NULL, '{\"role\": \"super_admin\", \"email\": \"admin@beta.com\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/156.0.0.0 Safari/537.36', '2026-11-09 19:34:59'),
(11, 1, 'auth.login', 'App\\Models\\User', '01M713QQ9Z1MMDHPW2GS553N4E', NULL, '{\"email\": \"admin@beta.com\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/157.0.0.0 Safari/537.36', '2026-11-12 15:32:00'),
(12, 1, 'auth.login_success', 'App\\Models\\User', '01M713QQ9Z1MMDHPW2GS553N4E', NULL, '{\"role\": \"super_admin\", \"email\": \"admin@beta.com\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/157.0.0.0 Safari/537.36', '2026-11-12 15:32:00'),
(13, 1, 'auth.login', 'App\\Models\\User', '01M713QQ9Z1MMDHPW2GS553N4E', NULL, '{\"email\": \"admin@beta.com\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT; Windows NT 10.0; en-US) WindowsPowerShell/5.1.26100.9818', '2026-11-12 15:36:51'),
(14, 1, 'auth.login_success', 'App\\Models\\User', '01M713QQ9Z1MMDHPW2GS553N4E', NULL, '{\"role\": \"super_admin\", \"email\": \"admin@beta.com\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT; Windows NT 10.0; en-US) WindowsPowerShell/5.1.26100.9818', '2026-11-12 15:36:51'),
(15, 1, 'auth.login', 'App\\Models\\User', '01M713QQ9Z1MMDHPW2GS553N4E', NULL, '{\"email\": \"admin@beta.com\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT; Windows NT 10.0; en-US) WindowsPowerShell/5.1.26100.9818', '2026-11-12 15:37:41'),
(16, 1, 'auth.login_success', 'App\\Models\\User', '01M713QQ9Z1MMDHPW2GS553N4E', NULL, '{\"role\": \"super_admin\", \"email\": \"admin@beta.com\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT; Windows NT 10.0; en-US) WindowsPowerShell/5.1.26100.9818', '2026-11-12 15:37:41'),
(17, 1, 'auth.login', 'App\\Models\\User', '01M713QQ9Z1MMDHPW2GS553N4E', NULL, '{\"email\": \"admin@beta.com\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT; Windows NT 10.0; en-US) WindowsPowerShell/5.1.26100.9818', '2026-11-12 15:38:19'),
(18, 1, 'auth.login_success', 'App\\Models\\User', '01M713QQ9Z1MMDHPW2GS553N4E', NULL, '{\"role\": \"super_admin\", \"email\": \"admin@beta.com\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT; Windows NT 10.0; en-US) WindowsPowerShell/5.1.26100.9818', '2026-11-12 15:38:19'),
(19, 1, 'auth.login', 'App\\Models\\User', '01M713QQ9Z1MMDHPW2GS553N4E', NULL, '{\"email\": \"admin@beta.com\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT; Windows NT 10.0; en-US) WindowsPowerShell/5.1.26100.9818', '2026-11-12 15:40:14'),
(20, 1, 'auth.login_success', 'App\\Models\\User', '01M713QQ9Z1MMDHPW2GS553N4E', NULL, '{\"role\": \"super_admin\", \"email\": \"admin@beta.com\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT; Windows NT 10.0; en-US) WindowsPowerShell/5.1.26100.9818', '2026-11-12 15:40:14'),
(21, 1, 'auth.login', 'App\\Models\\User', '01M713QQ9Z1MMDHPW2GS553N4E', NULL, '{\"email\": \"admin@beta.com\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT; Windows NT 10.0; en-US) WindowsPowerShell/5.1.26100.9818', '2026-11-12 15:41:35'),
(22, 1, 'auth.login_success', 'App\\Models\\User', '01M713QQ9Z1MMDHPW2GS553N4E', NULL, '{\"role\": \"super_admin\", \"email\": \"admin@beta.com\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT; Windows NT 10.0; en-US) WindowsPowerShell/5.1.26100.9818', '2026-11-12 15:41:35'),
(23, 1, 'auth.login', 'App\\Models\\User', '01M713QQ9Z1MMDHPW2GS553N4E', NULL, '{\"email\": \"admin@beta.com\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT; Windows NT 10.0; en-US) WindowsPowerShell/5.1.26100.9818', '2026-11-12 15:41:53'),
(24, 1, 'auth.login_success', 'App\\Models\\User', '01M713QQ9Z1MMDHPW2GS553N4E', NULL, '{\"role\": \"super_admin\", \"email\": \"admin@beta.com\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT; Windows NT 10.0; en-US) WindowsPowerShell/5.1.26100.9818', '2026-11-12 15:41:53'),
(25, 1, 'auth.login', 'App\\Models\\User', '01M713QQ9Z1MMDHPW2GS553N4E', NULL, '{\"email\": \"admin@beta.com\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT; Windows NT 10.0; en-US) WindowsPowerShell/5.1.26100.9818', '2026-11-12 15:42:36'),
(26, 1, 'auth.login_success', 'App\\Models\\User', '01M713QQ9Z1MMDHPW2GS553N4E', NULL, '{\"role\": \"super_admin\", \"email\": \"admin@beta.com\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT; Windows NT 10.0; en-US) WindowsPowerShell/5.1.26100.9818', '2026-11-12 15:42:36'),
(27, 1, 'auth.login', 'App\\Models\\User', '01M713QQ9Z1MMDHPW2GS553N4E', NULL, '{\"email\": \"admin@beta.com\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/157.0.0.0 Safari/537.36', '2026-11-13 08:43:03'),
(28, 1, 'auth.login_success', 'App\\Models\\User', '01M713QQ9Z1MMDHPW2GS553N4E', NULL, '{\"role\": \"super_admin\", \"email\": \"admin@beta.com\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/157.0.0.0 Safari/537.36', '2026-11-13 08:43:03'),
(29, 1, 'technical_download.created', 'App\\Models\\TechnicalDownload', '1', NULL, '{\"id\": 1, \"title_ar\": \"تيست\", \"title_en\": \"test\", \"file_path\": \"downloads/files/test_1794566693.pdf\", \"is_active\": true, \"created_at\": \"2026-11-13T10:44:53.000000Z\", \"sort_order\": \"10\", \"updated_at\": \"2026-11-13T10:44:53.000000Z\", \"issuance_date\": \"2020-01-01T00:00:00.000000Z\", \"preview_image\": \"downloads/previews/test_1794566693.png\", \"description_ar\": \"شي شسب شسؤ 1 سؤ1صي س 1 يل ق لىى2 ث\", \"description_en\": \"asdasd as dascaf sfd asd w asd a21 2xac 1 cs1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/157.0.0.0 Safari/537.36', '2026-11-13 08:44:53'),
(30, 1, 'certificate.created', 'App\\Models\\Certificate', '1', NULL, '{\"id\": 1, \"title_ar\": \"تيست\", \"title_en\": \"test\", \"file_path\": \"downloads/files/test_1794567753.pdf\", \"is_active\": true, \"created_at\": \"2026-11-13T11:02:33.000000Z\", \"sort_order\": 1, \"updated_at\": \"2026-11-13T11:02:33.000000Z\", \"issuance_date\": \"2020-10-20T00:00:00.000000Z\", \"preview_image\": \"downloads/previews/test_1794567753.jpeg\", \"description_ar\": \"ينتبىينتىب سهنتى 1خه خ1ت908تس89تب خ1ؤ ا18\", \"description_en\": \"df dfasdc 1sd1 w1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/157.0.0.0 Safari/537.36', '2026-11-13 09:02:33'),
(31, 1, 'certificate.created', 'App\\Models\\Certificate', '2', NULL, '{\"id\": 2, \"title_ar\": \"تيست2\", \"title_en\": \"test2\", \"file_path\": \"downloads/files/test2_1794567804.pdf\", \"is_active\": true, \"created_at\": \"2026-11-13T11:03:24.000000Z\", \"sort_order\": 2, \"updated_at\": \"2026-11-13T11:03:24.000000Z\", \"issuance_date\": \"2021-10-20T00:00:00.000000Z\", \"preview_image\": \"downloads/previews/test2_1794567804.jpg\", \"description_ar\": \"سىشتنىؤ 12 12 ىنسنشي\", \"description_en\": \"s af1 kdkfn onjn1 kmxlkn 11\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/157.0.0.0 Safari/537.36', '2026-11-13 09:03:24'),
(32, 1, 'auth.login', 'App\\Models\\User', '01M713QQ9Z1MMDHPW2GS553N4E', NULL, '{\"email\": \"admin@beta.com\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/157.0.0.0 Safari/537.36', '2026-11-13 13:14:22'),
(33, 1, 'auth.login_success', 'App\\Models\\User', '01M713QQ9Z1MMDHPW2GS553N4E', NULL, '{\"role\": \"super_admin\", \"email\": \"admin@beta.com\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/157.0.0.0 Safari/537.36', '2026-11-13 13:14:22'),
(34, 1, 'auth.login', 'App\\Models\\User', '01M713QQ9Z1MMDHPW2GS553N4E', NULL, '{\"email\": \"admin@beta.com\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/157.0.0.0 Safari/537.36', '2026-11-13 16:13:36'),
(35, 1, 'auth.login_success', 'App\\Models\\User', '01M713QQ9Z1MMDHPW2GS553N4E', NULL, '{\"role\": \"super_admin\", \"email\": \"admin@beta.com\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/157.0.0.0 Safari/537.36', '2026-11-13 16:13:36'),
(36, 1, 'auth.login', 'App\\Models\\User', '01M713QQ9Z1MMDHPW2GS553N4E', NULL, '{\"email\": \"admin@beta.com\"}', '127.0.0.1', 'curl/8.22.0', '2026-11-13 17:46:45'),
(37, 1, 'auth.login_success', 'App\\Models\\User', '01M713QQ9Z1MMDHPW2GS553N4E', NULL, '{\"role\": \"super_admin\", \"email\": \"admin@beta.com\"}', '127.0.0.1', 'curl/8.22.0', '2026-11-13 17:46:45'),
(38, 1, 'product.created', 'App\\Models\\Product', '01M7B75JTRGFJ6C0XR2JZDF58P', NULL, '{\"slug\": \"test-upload-1794599207\", \"title\": {\"ar\": \"Upload Test Product AR\", \"en\": \"Upload Test Product\"}, \"is_active\": true, \"public_id\": \"01M7B75JTRGFJ6C0XR2JZDF58P\", \"created_at\": \"2026-11-13T19:46:49.000000Z\", \"updated_at\": \"2026-11-13T19:46:49.000000Z\", \"description\": {\"ar\": \"Temporary upload regression test AR.\", \"en\": \"Temporary upload regression test.\"}, \"specifications\": []}', '127.0.0.1', 'curl/8.22.0', '2026-11-13 17:46:49'),
(39, 1, 'product.created', 'App\\Models\\Product', '01M7B7A5YJS4RVJK7AA17ADX26', NULL, '{\"slug\": \"testing\", \"title\": {\"ar\": \"تيست\", \"en\": \"test\"}, \"is_active\": true, \"public_id\": \"01M7B7A5YJS4RVJK7AA17ADX26\", \"created_at\": \"2026-11-13T19:49:20.000000Z\", \"updated_at\": \"2026-11-13T19:49:20.000000Z\", \"description\": {\"ar\": \"سمنشيسشمين ست يشينتشسي حخشسيكم\", \"en\": \"askjdl aksjd12 ksjdalkjsd\"}, \"specifications\": []}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/157.0.0.0 Safari/537.36', '2026-11-13 17:49:20'),
(40, 1, 'product.created', 'App\\Models\\Product', '01M7B86YCT12VR1NDTVY7HA99G', NULL, '{\"slug\": \"testfarid\", \"title\": {\"ar\": \"تيست\", \"en\": \"test\"}, \"is_active\": true, \"public_id\": \"01M7B86YCT12VR1NDTVY7HA99G\", \"created_at\": \"2026-11-13T20:05:03.000000Z\", \"updated_at\": \"2026-11-13T20:05:03.000000Z\", \"description\": {\"ar\": \"سمنيشتسمينش كي 2منتمنشست ين\", \"en\": \"sdkjas dalkd skjskjasd\"}, \"specifications\": []}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/157.0.0.0 Safari/537.36', '2026-11-13 18:05:03'),
(41, 1, 'product.updated', 'App\\Models\\Product', '01M7B86YCT12VR1NDTVY7HA99G', '{\"slug\": \"testfarid\", \"title\": {\"ar\": \"تيست\", \"en\": \"test\"}, \"is_active\": true, \"public_id\": \"01M7B86YCT12VR1NDTVY7HA99G\", \"created_at\": \"2026-11-13T20:05:03.000000Z\", \"deleted_at\": null, \"updated_at\": \"2026-11-13T20:05:03.000000Z\", \"description\": {\"ar\": \"سمنيشتسمينش كي 2منتمنشست ين\", \"en\": \"sdkjas dalkd skjskjasd\"}, \"specifications\": []}', '{\"slug\": \"testfarid\", \"title\": {\"ar\": \"تيست\", \"en\": \"test\"}, \"is_active\": true, \"public_id\": \"01M7B86YCT12VR1NDTVY7HA99G\", \"created_at\": \"2026-11-13T20:05:03.000000Z\", \"deleted_at\": null, \"updated_at\": \"2026-11-13T20:05:03.000000Z\", \"description\": {\"ar\": \"سمنيشتسمينش كي 2منتمنشست ين\", \"en\": \"sdkjas dalkd skjskjasd\"}, \"specifications\": []}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/157.0.0.0 Safari/537.36', '2026-11-13 18:06:08'),
(42, 1, 'auth.login', 'App\\Models\\User', '01M713QQ9Z1MMDHPW2GS553N4E', NULL, '{\"email\": \"admin@beta.com\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/157.0.0.0 Safari/537.36', '2026-11-14 11:20:31'),
(43, 1, 'auth.login_success', 'App\\Models\\User', '01M713QQ9Z1MMDHPW2GS553N4E', NULL, '{\"role\": \"super_admin\", \"email\": \"admin@beta.com\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/157.0.0.0 Safari/537.36', '2026-11-14 11:20:31'),
(44, 1, 'product.created', 'App\\Models\\Product', '01M7D41XTE45NSDC7X3WV3T225', NULL, '{\"slug\": \"sea\", \"title\": {\"ar\": \"بحر\", \"en\": \"sea\"}, \"is_active\": true, \"public_id\": \"01M7D41XTE45NSDC7X3WV3T225\", \"created_at\": \"2026-11-14T13:30:53.000000Z\", \"updated_at\": \"2026-11-14T13:30:53.000000Z\", \"description\": {\"ar\": \"سشب سشب شس يبص يشسيب 24124 سشي شي\", \"en\": \"sadsd 12 sc1 sg1 vd1  fvv\"}, \"specifications\": []}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/157.0.0.0 Safari/537.36', '2026-11-14 11:30:53'),
(45, 1, 'product.created', 'App\\Models\\Product', '01M7D5WK0FXMRHQM3HMMMDJ35H', NULL, '{\"slug\": \"mslan\", \"title\": {\"ar\": \"مثلا\", \"en\": \"mslan\"}, \"file_path\": \"uploads/products/files/mslan-datasheet-1794664975.pdf\", \"is_active\": true, \"public_id\": \"01M7D5WK0FXMRHQM3HMMMDJ35H\", \"created_at\": \"2026-11-14T14:02:55.000000Z\", \"updated_at\": \"2026-11-14T14:02:55.000000Z\", \"description\": {\"ar\": \"سشي س يبش سبشبشس ب2شبس 2\", \"en\": \"sad as da 2sa dfa\"}, \"specifications\": []}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/157.0.0.0 Safari/537.36', '2026-11-14 12:02:55'),
(46, 1, 'product.updated', 'App\\Models\\Product', '01M7D5WK0FXMRHQM3HMMMDJ35H', '{\"slug\": \"mslan\", \"title\": {\"ar\": \"مثلا\", \"en\": \"mslan\"}, \"file_path\": \"uploads/products/files/mslan-datasheet-1794664975.pdf\", \"is_active\": true, \"public_id\": \"01M7D5WK0FXMRHQM3HMMMDJ35H\", \"created_at\": \"2026-11-14T14:02:55.000000Z\", \"deleted_at\": null, \"updated_at\": \"2026-11-14T14:02:55.000000Z\", \"description\": {\"ar\": \"سشي س يبش سبشبشس ب2شبس 2\", \"en\": \"sad as da 2sa dfa\"}, \"specifications\": []}', '{\"slug\": \"mslan\", \"title\": {\"ar\": \"مثلا\", \"en\": \"mslan\"}, \"file_path\": \"uploads/products/files/mslan-datasheet-1794664996.pdf\", \"is_active\": true, \"public_id\": \"01M7D5WK0FXMRHQM3HMMMDJ35H\", \"created_at\": \"2026-11-14T14:02:55.000000Z\", \"deleted_at\": null, \"updated_at\": \"2026-11-14T14:03:16.000000Z\", \"description\": {\"ar\": \"سشي س يبش سبشبشس ب2شبس 2\", \"en\": \"sad as da 2sa dfa\"}, \"specifications\": []}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/157.0.0.0 Safari/537.36', '2026-11-14 12:03:16');

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cache`
--

INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
('356a192b7913b04c54574d18c28d46e6395428ab', 'i:2;', 1794666483),
('356a192b7913b04c54574d18c28d46e6395428ab:timer', 'i:1794666483;', 1794666483),
('5c785c036466adea360111aa28563bfd556b5fba', 'i:2;', 1794666864),
('5c785c036466adea360111aa28563bfd556b5fba:timer', 'i:1794666864;', 1794666864),
('public.jobs.ar', 'O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:3:{i:0;O:21:\"App\\Models\\JobPosting\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:12:\"job_postings\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:8:{s:2:\"id\";i:1;s:9:\"public_id\";s:26:\"01M713QQZ66HNNVY21FHPVFJRA\";s:5:\"title\";s:135:\"{\"ar\": \"مهندس أول نمذجة وتفصيل إنشائي (Tekla Structures)\", \"en\": \"Senior Tekla Structural Detailer / Modeler\"}\";s:10:\"country_id\";i:1;s:11:\"description\";s:350:\"{\"ar\": \"خبرة لا تقل عن 5 سنوات في النمذجة ثلاثية الأبعاد للمنشآت الفولاذية وتفاصيل الوصلات وإصدار المخططات التنفيذية.\", \"en\": \"Minimum 5+ years experience in 3D modeling of heavy industrial structural steel, connection details, and generating shop drawings.\"}\";s:9:\"is_active\";i:1;s:10:\"created_at\";s:19:\"2026-11-09 21:34:26\";s:10:\"updated_at\";s:19:\"2026-11-09 21:34:26\";}s:11:\"\0*\0original\";a:8:{s:2:\"id\";i:1;s:9:\"public_id\";s:26:\"01M713QQZ66HNNVY21FHPVFJRA\";s:5:\"title\";s:135:\"{\"ar\": \"مهندس أول نمذجة وتفصيل إنشائي (Tekla Structures)\", \"en\": \"Senior Tekla Structural Detailer / Modeler\"}\";s:10:\"country_id\";i:1;s:11:\"description\";s:350:\"{\"ar\": \"خبرة لا تقل عن 5 سنوات في النمذجة ثلاثية الأبعاد للمنشآت الفولاذية وتفاصيل الوصلات وإصدار المخططات التنفيذية.\", \"en\": \"Minimum 5+ years experience in 3D modeling of heavy industrial structural steel, connection details, and generating shop drawings.\"}\";s:9:\"is_active\";i:1;s:10:\"created_at\";s:19:\"2026-11-09 21:34:26\";s:10:\"updated_at\";s:19:\"2026-11-09 21:34:26\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:5:{s:5:\"title\";s:5:\"array\";s:11:\"description\";s:5:\"array\";s:9:\"is_active\";s:7:\"boolean\";s:9:\"closes_at\";s:8:\"datetime\";s:12:\"published_at\";s:8:\"datetime\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:7:\"country\";O:18:\"App\\Models\\Country\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:9:\"countries\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:7:{s:2:\"id\";i:1;s:4:\"iso2\";s:2:\"EG\";s:4:\"name\";s:5:\"Egypt\";s:11:\"currency_id\";i:1;s:9:\"is_active\";i:1;s:10:\"created_at\";s:19:\"2026-11-09 21:33:24\";s:10:\"updated_at\";s:19:\"2026-11-09 21:33:24\";}s:11:\"\0*\0original\";a:7:{s:2:\"id\";i:1;s:4:\"iso2\";s:2:\"EG\";s:4:\"name\";s:5:\"Egypt\";s:11:\"currency_id\";i:1;s:9:\"is_active\";i:1;s:10:\"created_at\";s:19:\"2026-11-09 21:33:24\";s:10:\"updated_at\";s:19:\"2026-11-09 21:33:24\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:1:{s:9:\"is_active\";s:7:\"boolean\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:1:{i:0;s:2:\"id\";}}}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:1:{i:0;s:2:\"id\";}}i:1;O:21:\"App\\Models\\JobPosting\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:12:\"job_postings\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:8:{s:2:\"id\";i:2;s:9:\"public_id\";s:26:\"01M713QQZAECG8ADE6XN7RD0PQ\";s:5:\"title\";s:189:\"{\"ar\": \"مهندس موقع أول - تركيبات هياكل معدنية (الرياض والمنطقة الشرقية)\", \"en\": \"Lead Site Erection Engineer (Riyadh & Eastern Province)\"}\";s:10:\"country_id\";i:2;s:11:\"description\";s:363:\"{\"ar\": \"الإشراف الميداني على تركيب الهياكل المعدنية وحسابات حمولة الرافعات واختبارات العزم وتطبيق معايير السلامة بالمملكة.\", \"en\": \"Hands-on supervision of heavy steel erection, crane rigging calculations, bolt torque verification, and site HSE protocols in KSA.\"}\";s:9:\"is_active\";i:1;s:10:\"created_at\";s:19:\"2026-11-09 21:34:26\";s:10:\"updated_at\";s:19:\"2026-11-09 21:34:26\";}s:11:\"\0*\0original\";a:8:{s:2:\"id\";i:2;s:9:\"public_id\";s:26:\"01M713QQZAECG8ADE6XN7RD0PQ\";s:5:\"title\";s:189:\"{\"ar\": \"مهندس موقع أول - تركيبات هياكل معدنية (الرياض والمنطقة الشرقية)\", \"en\": \"Lead Site Erection Engineer (Riyadh & Eastern Province)\"}\";s:10:\"country_id\";i:2;s:11:\"description\";s:363:\"{\"ar\": \"الإشراف الميداني على تركيب الهياكل المعدنية وحسابات حمولة الرافعات واختبارات العزم وتطبيق معايير السلامة بالمملكة.\", \"en\": \"Hands-on supervision of heavy steel erection, crane rigging calculations, bolt torque verification, and site HSE protocols in KSA.\"}\";s:9:\"is_active\";i:1;s:10:\"created_at\";s:19:\"2026-11-09 21:34:26\";s:10:\"updated_at\";s:19:\"2026-11-09 21:34:26\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:5:{s:5:\"title\";s:5:\"array\";s:11:\"description\";s:5:\"array\";s:9:\"is_active\";s:7:\"boolean\";s:9:\"closes_at\";s:8:\"datetime\";s:12:\"published_at\";s:8:\"datetime\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:7:\"country\";O:18:\"App\\Models\\Country\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:9:\"countries\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:7:{s:2:\"id\";i:2;s:4:\"iso2\";s:2:\"SA\";s:4:\"name\";s:12:\"Saudi Arabia\";s:11:\"currency_id\";i:2;s:9:\"is_active\";i:1;s:10:\"created_at\";s:19:\"2026-11-09 21:33:24\";s:10:\"updated_at\";s:19:\"2026-11-09 21:33:24\";}s:11:\"\0*\0original\";a:7:{s:2:\"id\";i:2;s:4:\"iso2\";s:2:\"SA\";s:4:\"name\";s:12:\"Saudi Arabia\";s:11:\"currency_id\";i:2;s:9:\"is_active\";i:1;s:10:\"created_at\";s:19:\"2026-11-09 21:33:24\";s:10:\"updated_at\";s:19:\"2026-11-09 21:33:24\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:1:{s:9:\"is_active\";s:7:\"boolean\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:1:{i:0;s:2:\"id\";}}}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:1:{i:0;s:2:\"id\";}}i:2;O:21:\"App\\Models\\JobPosting\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:12:\"job_postings\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:8:{s:2:\"id\";i:3;s:9:\"public_id\";s:26:\"01M713QQZD4JMFZQGZBRRDG8EH\";s:5:\"title\";s:141:\"{\"ar\": \"مهندس جودة وتفتيش لحام معتمد (CSWIP 3.1 / CWI)\", \"en\": \"Certified QA/QC Welding Inspector (CSWIP 3.1 / CWI)\"}\";s:10:\"country_id\";i:1;s:11:\"description\";s:338:\"{\"ar\": \"مراقبة جودة اللحامات وإجراء الفحوصات غير الإتلافية ومتابعة اختبارات اللحامين وتجهيز وثائق تسليم الجودة.\", \"en\": \"Perform visual inspection, NDT witnessing (UT, MPI), welder performance qualifications, and documentation for client handover.\"}\";s:9:\"is_active\";i:1;s:10:\"created_at\";s:19:\"2026-11-09 21:34:26\";s:10:\"updated_at\";s:19:\"2026-11-09 21:34:26\";}s:11:\"\0*\0original\";a:8:{s:2:\"id\";i:3;s:9:\"public_id\";s:26:\"01M713QQZD4JMFZQGZBRRDG8EH\";s:5:\"title\";s:141:\"{\"ar\": \"مهندس جودة وتفتيش لحام معتمد (CSWIP 3.1 / CWI)\", \"en\": \"Certified QA/QC Welding Inspector (CSWIP 3.1 / CWI)\"}\";s:10:\"country_id\";i:1;s:11:\"description\";s:338:\"{\"ar\": \"مراقبة جودة اللحامات وإجراء الفحوصات غير الإتلافية ومتابعة اختبارات اللحامين وتجهيز وثائق تسليم الجودة.\", \"en\": \"Perform visual inspection, NDT witnessing (UT, MPI), welder performance qualifications, and documentation for client handover.\"}\";s:9:\"is_active\";i:1;s:10:\"created_at\";s:19:\"2026-11-09 21:34:26\";s:10:\"updated_at\";s:19:\"2026-11-09 21:34:26\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:5:{s:5:\"title\";s:5:\"array\";s:11:\"description\";s:5:\"array\";s:9:\"is_active\";s:7:\"boolean\";s:9:\"closes_at\";s:8:\"datetime\";s:12:\"published_at\";s:8:\"datetime\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:7:\"country\";r:48;}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:1:{i:0;s:2:\"id\";}}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}', 1794539080),
('public.jobs.en', 'O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:3:{i:0;O:21:\"App\\Models\\JobPosting\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:12:\"job_postings\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:8:{s:2:\"id\";i:1;s:9:\"public_id\";s:26:\"01M713QQZ66HNNVY21FHPVFJRA\";s:5:\"title\";s:135:\"{\"ar\": \"مهندس أول نمذجة وتفصيل إنشائي (Tekla Structures)\", \"en\": \"Senior Tekla Structural Detailer / Modeler\"}\";s:10:\"country_id\";i:1;s:11:\"description\";s:350:\"{\"ar\": \"خبرة لا تقل عن 5 سنوات في النمذجة ثلاثية الأبعاد للمنشآت الفولاذية وتفاصيل الوصلات وإصدار المخططات التنفيذية.\", \"en\": \"Minimum 5+ years experience in 3D modeling of heavy industrial structural steel, connection details, and generating shop drawings.\"}\";s:9:\"is_active\";i:1;s:10:\"created_at\";s:19:\"2026-11-09 21:34:26\";s:10:\"updated_at\";s:19:\"2026-11-09 21:34:26\";}s:11:\"\0*\0original\";a:8:{s:2:\"id\";i:1;s:9:\"public_id\";s:26:\"01M713QQZ66HNNVY21FHPVFJRA\";s:5:\"title\";s:135:\"{\"ar\": \"مهندس أول نمذجة وتفصيل إنشائي (Tekla Structures)\", \"en\": \"Senior Tekla Structural Detailer / Modeler\"}\";s:10:\"country_id\";i:1;s:11:\"description\";s:350:\"{\"ar\": \"خبرة لا تقل عن 5 سنوات في النمذجة ثلاثية الأبعاد للمنشآت الفولاذية وتفاصيل الوصلات وإصدار المخططات التنفيذية.\", \"en\": \"Minimum 5+ years experience in 3D modeling of heavy industrial structural steel, connection details, and generating shop drawings.\"}\";s:9:\"is_active\";i:1;s:10:\"created_at\";s:19:\"2026-11-09 21:34:26\";s:10:\"updated_at\";s:19:\"2026-11-09 21:34:26\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:5:{s:5:\"title\";s:5:\"array\";s:11:\"description\";s:5:\"array\";s:9:\"is_active\";s:7:\"boolean\";s:9:\"closes_at\";s:8:\"datetime\";s:12:\"published_at\";s:8:\"datetime\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:7:\"country\";O:18:\"App\\Models\\Country\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:9:\"countries\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:7:{s:2:\"id\";i:1;s:4:\"iso2\";s:2:\"EG\";s:4:\"name\";s:5:\"Egypt\";s:11:\"currency_id\";i:1;s:9:\"is_active\";i:1;s:10:\"created_at\";s:19:\"2026-11-09 21:33:24\";s:10:\"updated_at\";s:19:\"2026-11-09 21:33:24\";}s:11:\"\0*\0original\";a:7:{s:2:\"id\";i:1;s:4:\"iso2\";s:2:\"EG\";s:4:\"name\";s:5:\"Egypt\";s:11:\"currency_id\";i:1;s:9:\"is_active\";i:1;s:10:\"created_at\";s:19:\"2026-11-09 21:33:24\";s:10:\"updated_at\";s:19:\"2026-11-09 21:33:24\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:1:{s:9:\"is_active\";s:7:\"boolean\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:1:{i:0;s:2:\"id\";}}}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:1:{i:0;s:2:\"id\";}}i:1;O:21:\"App\\Models\\JobPosting\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:12:\"job_postings\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:8:{s:2:\"id\";i:2;s:9:\"public_id\";s:26:\"01M713QQZAECG8ADE6XN7RD0PQ\";s:5:\"title\";s:189:\"{\"ar\": \"مهندس موقع أول - تركيبات هياكل معدنية (الرياض والمنطقة الشرقية)\", \"en\": \"Lead Site Erection Engineer (Riyadh & Eastern Province)\"}\";s:10:\"country_id\";i:2;s:11:\"description\";s:363:\"{\"ar\": \"الإشراف الميداني على تركيب الهياكل المعدنية وحسابات حمولة الرافعات واختبارات العزم وتطبيق معايير السلامة بالمملكة.\", \"en\": \"Hands-on supervision of heavy steel erection, crane rigging calculations, bolt torque verification, and site HSE protocols in KSA.\"}\";s:9:\"is_active\";i:1;s:10:\"created_at\";s:19:\"2026-11-09 21:34:26\";s:10:\"updated_at\";s:19:\"2026-11-09 21:34:26\";}s:11:\"\0*\0original\";a:8:{s:2:\"id\";i:2;s:9:\"public_id\";s:26:\"01M713QQZAECG8ADE6XN7RD0PQ\";s:5:\"title\";s:189:\"{\"ar\": \"مهندس موقع أول - تركيبات هياكل معدنية (الرياض والمنطقة الشرقية)\", \"en\": \"Lead Site Erection Engineer (Riyadh & Eastern Province)\"}\";s:10:\"country_id\";i:2;s:11:\"description\";s:363:\"{\"ar\": \"الإشراف الميداني على تركيب الهياكل المعدنية وحسابات حمولة الرافعات واختبارات العزم وتطبيق معايير السلامة بالمملكة.\", \"en\": \"Hands-on supervision of heavy steel erection, crane rigging calculations, bolt torque verification, and site HSE protocols in KSA.\"}\";s:9:\"is_active\";i:1;s:10:\"created_at\";s:19:\"2026-11-09 21:34:26\";s:10:\"updated_at\";s:19:\"2026-11-09 21:34:26\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:5:{s:5:\"title\";s:5:\"array\";s:11:\"description\";s:5:\"array\";s:9:\"is_active\";s:7:\"boolean\";s:9:\"closes_at\";s:8:\"datetime\";s:12:\"published_at\";s:8:\"datetime\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:7:\"country\";O:18:\"App\\Models\\Country\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:9:\"countries\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:7:{s:2:\"id\";i:2;s:4:\"iso2\";s:2:\"SA\";s:4:\"name\";s:12:\"Saudi Arabia\";s:11:\"currency_id\";i:2;s:9:\"is_active\";i:1;s:10:\"created_at\";s:19:\"2026-11-09 21:33:24\";s:10:\"updated_at\";s:19:\"2026-11-09 21:33:24\";}s:11:\"\0*\0original\";a:7:{s:2:\"id\";i:2;s:4:\"iso2\";s:2:\"SA\";s:4:\"name\";s:12:\"Saudi Arabia\";s:11:\"currency_id\";i:2;s:9:\"is_active\";i:1;s:10:\"created_at\";s:19:\"2026-11-09 21:33:24\";s:10:\"updated_at\";s:19:\"2026-11-09 21:33:24\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:1:{s:9:\"is_active\";s:7:\"boolean\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:1:{i:0;s:2:\"id\";}}}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:1:{i:0;s:2:\"id\";}}i:2;O:21:\"App\\Models\\JobPosting\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:12:\"job_postings\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:8:{s:2:\"id\";i:3;s:9:\"public_id\";s:26:\"01M713QQZD4JMFZQGZBRRDG8EH\";s:5:\"title\";s:141:\"{\"ar\": \"مهندس جودة وتفتيش لحام معتمد (CSWIP 3.1 / CWI)\", \"en\": \"Certified QA/QC Welding Inspector (CSWIP 3.1 / CWI)\"}\";s:10:\"country_id\";i:1;s:11:\"description\";s:338:\"{\"ar\": \"مراقبة جودة اللحامات وإجراء الفحوصات غير الإتلافية ومتابعة اختبارات اللحامين وتجهيز وثائق تسليم الجودة.\", \"en\": \"Perform visual inspection, NDT witnessing (UT, MPI), welder performance qualifications, and documentation for client handover.\"}\";s:9:\"is_active\";i:1;s:10:\"created_at\";s:19:\"2026-11-09 21:34:26\";s:10:\"updated_at\";s:19:\"2026-11-09 21:34:26\";}s:11:\"\0*\0original\";a:8:{s:2:\"id\";i:3;s:9:\"public_id\";s:26:\"01M713QQZD4JMFZQGZBRRDG8EH\";s:5:\"title\";s:141:\"{\"ar\": \"مهندس جودة وتفتيش لحام معتمد (CSWIP 3.1 / CWI)\", \"en\": \"Certified QA/QC Welding Inspector (CSWIP 3.1 / CWI)\"}\";s:10:\"country_id\";i:1;s:11:\"description\";s:338:\"{\"ar\": \"مراقبة جودة اللحامات وإجراء الفحوصات غير الإتلافية ومتابعة اختبارات اللحامين وتجهيز وثائق تسليم الجودة.\", \"en\": \"Perform visual inspection, NDT witnessing (UT, MPI), welder performance qualifications, and documentation for client handover.\"}\";s:9:\"is_active\";i:1;s:10:\"created_at\";s:19:\"2026-11-09 21:34:26\";s:10:\"updated_at\";s:19:\"2026-11-09 21:34:26\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:5:{s:5:\"title\";s:5:\"array\";s:11:\"description\";s:5:\"array\";s:9:\"is_active\";s:7:\"boolean\";s:9:\"closes_at\";s:8:\"datetime\";s:12:\"published_at\";s:8:\"datetime\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:1:{s:7:\"country\";r:48;}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:1:{i:0;s:2:\"id\";}}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}', 1794665542);
INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
('public.products.all.en', 'O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:8:{i:0;O:18:\"App\\Models\\Product\":31:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:8:\"products\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:11:{s:2:\"id\";i:1;s:9:\"public_id\";s:26:\"01M713QQXRXMQ5PP6ZF3WXEZV2\";s:5:\"title\";s:124:\"{\"ar\": \"أعمدة وكمرات الهياكل الإنشائية الثقيلة\", \"en\": \"Heavy Structural Columns & Beams\"}\";s:4:\"slug\";s:30:\"heavy-structural-columns-beams\";s:9:\"file_path\";N;s:11:\"description\";s:315:\"{\"ar\": \"هياكل فولاذية عالية المقاومة طبقا لمواصفات ASTM مخصصة للمصانع الكبرى والمستودعات والمباني متعددة الطوابق.\", \"en\": \"High-yield ASTM steel framing for industrial complexes, mega factories, and multi-story infrastructure.\"}\";s:14:\"specifications\";s:172:\"{\"finish\": \"Hot-Dip Galvanized / Multi-Coat Epoxy\", \"steel_grade\": \"ASTM A36 / A992 / S355JR\", \"welding_code\": \"AWS D1.1 / EN 1090-2 EXC3\", \"yield_strength\": \"355 MPa min\"}\";s:9:\"is_active\";i:1;s:10:\"created_at\";s:19:\"2026-11-09 21:34:26\";s:10:\"updated_at\";s:19:\"2026-11-09 21:34:26\";s:10:\"deleted_at\";N;}s:11:\"\0*\0original\";a:11:{s:2:\"id\";i:1;s:9:\"public_id\";s:26:\"01M713QQXRXMQ5PP6ZF3WXEZV2\";s:5:\"title\";s:124:\"{\"ar\": \"أعمدة وكمرات الهياكل الإنشائية الثقيلة\", \"en\": \"Heavy Structural Columns & Beams\"}\";s:4:\"slug\";s:30:\"heavy-structural-columns-beams\";s:9:\"file_path\";N;s:11:\"description\";s:315:\"{\"ar\": \"هياكل فولاذية عالية المقاومة طبقا لمواصفات ASTM مخصصة للمصانع الكبرى والمستودعات والمباني متعددة الطوابق.\", \"en\": \"High-yield ASTM steel framing for industrial complexes, mega factories, and multi-story infrastructure.\"}\";s:14:\"specifications\";s:172:\"{\"finish\": \"Hot-Dip Galvanized / Multi-Coat Epoxy\", \"steel_grade\": \"ASTM A36 / A992 / S355JR\", \"welding_code\": \"AWS D1.1 / EN 1090-2 EXC3\", \"yield_strength\": \"355 MPa min\"}\";s:9:\"is_active\";i:1;s:10:\"created_at\";s:19:\"2026-11-09 21:34:26\";s:10:\"updated_at\";s:19:\"2026-11-09 21:34:26\";s:10:\"deleted_at\";N;}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:5:{s:5:\"title\";s:5:\"array\";s:11:\"description\";s:5:\"array\";s:14:\"specifications\";s:5:\"array\";s:9:\"is_active\";s:7:\"boolean\";s:10:\"deleted_at\";s:8:\"datetime\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:3:{s:11:\"attachments\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}s:10:\"attributes\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}s:6:\"images\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:1:{i:0;s:2:\"id\";}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:8:{i:0;s:9:\"public_id\";i:1;s:5:\"title\";i:2;s:4:\"slug\";i:3;s:11:\"description\";i:4;s:14:\"specifications\";i:5;s:9:\"is_active\";i:6;s:9:\"file_path\";i:7;s:14:\"technical_file\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:2:\"id\";}s:16:\"\0*\0forceDeleting\";b:0;}i:1;O:18:\"App\\Models\\Product\":31:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:8:\"products\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:11:{s:2:\"id\";i:2;s:9:\"public_id\";s:26:\"01M713QQXX8JHWC5K6JSQVK8MX\";s:5:\"title\";s:107:\"{\"ar\": \"جمالونات الأسقف ذات البحور الواسعة\", \"en\": \"Clear-Span Roof Trusses\"}\";s:4:\"slug\";s:23:\"clear-span-roof-trusses\";s:9:\"file_path\";N;s:11:\"description\";s:325:\"{\"ar\": \"جمالونات فولاذية واسعة البحر مصممة لتوفير مساحات تخزين ومستودعات خالية من الأعمدة الداخلية حتى 60 متراً.\", \"en\": \"Long-span structural trusses designed for column-free distribution warehouses and aircraft hangars up to 60 meters.\"}\";s:14:\"specifications\";s:204:\"{\"finish\": \"Industrial Protective Polyurethane Coating\", \"span_range\": \"20m - 65m Clear Span\", \"steel_grade\": \"S275 / S355 Structural Hollow Sections\", \"deflection_limit\": \"L / 360 conforming to BS 5950\"}\";s:9:\"is_active\";i:1;s:10:\"created_at\";s:19:\"2026-11-09 21:34:26\";s:10:\"updated_at\";s:19:\"2026-11-09 21:34:26\";s:10:\"deleted_at\";N;}s:11:\"\0*\0original\";a:11:{s:2:\"id\";i:2;s:9:\"public_id\";s:26:\"01M713QQXX8JHWC5K6JSQVK8MX\";s:5:\"title\";s:107:\"{\"ar\": \"جمالونات الأسقف ذات البحور الواسعة\", \"en\": \"Clear-Span Roof Trusses\"}\";s:4:\"slug\";s:23:\"clear-span-roof-trusses\";s:9:\"file_path\";N;s:11:\"description\";s:325:\"{\"ar\": \"جمالونات فولاذية واسعة البحر مصممة لتوفير مساحات تخزين ومستودعات خالية من الأعمدة الداخلية حتى 60 متراً.\", \"en\": \"Long-span structural trusses designed for column-free distribution warehouses and aircraft hangars up to 60 meters.\"}\";s:14:\"specifications\";s:204:\"{\"finish\": \"Industrial Protective Polyurethane Coating\", \"span_range\": \"20m - 65m Clear Span\", \"steel_grade\": \"S275 / S355 Structural Hollow Sections\", \"deflection_limit\": \"L / 360 conforming to BS 5950\"}\";s:9:\"is_active\";i:1;s:10:\"created_at\";s:19:\"2026-11-09 21:34:26\";s:10:\"updated_at\";s:19:\"2026-11-09 21:34:26\";s:10:\"deleted_at\";N;}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:5:{s:5:\"title\";s:5:\"array\";s:11:\"description\";s:5:\"array\";s:14:\"specifications\";s:5:\"array\";s:9:\"is_active\";s:7:\"boolean\";s:10:\"deleted_at\";s:8:\"datetime\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:3:{s:11:\"attachments\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}s:10:\"attributes\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}s:6:\"images\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:1:{i:0;s:2:\"id\";}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:8:{i:0;s:9:\"public_id\";i:1;s:5:\"title\";i:2;s:4:\"slug\";i:3;s:11:\"description\";i:4;s:14:\"specifications\";i:5;s:9:\"is_active\";i:6;s:9:\"file_path\";i:7;s:14:\"technical_file\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:2:\"id\";}s:16:\"\0*\0forceDeleting\";b:0;}i:2;O:18:\"App\\Models\\Product\":31:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:8:\"products\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:11:{s:2:\"id\";i:3;s:9:\"public_id\";s:26:\"01M713QQY2E4S47MA8N35FW7B5\";s:5:\"title\";s:131:\"{\"ar\": \"كمرات الأوناش الملحومة والمسطحات الثقيلة\", \"en\": \"Built-Up Crane Girders & Plate Work\"}\";s:4:\"slug\";s:22:\"built-up-crane-girders\";s:9:\"file_path\";N;s:11:\"description\";s:317:\"{\"ar\": \"كمرات صفائحية ملحومة آلياً مخصصة لمسارات الأوناش العلوية الثقيلة ذات التحمل العالي للأحمال الديناميكية.\", \"en\": \"Custom welded plate girders engineered for heavy industrial overhead cranes with high fatigue resistance.\"}\";s:14:\"specifications\";s:236:\"{\"testing\": \"100% Ultrasonic & Magnetic Particle NDT\", \"capacity\": \"Supports Overhead Cranes up to 80 Metric Tons\", \"steel_grade\": \"High-Strength Heavy Plate ASTM A572 Gr. 50\", \"welding_process\": \"Automated Submerged Arc Welding (SAW)\"}\";s:9:\"is_active\";i:1;s:10:\"created_at\";s:19:\"2026-11-09 21:34:26\";s:10:\"updated_at\";s:19:\"2026-11-09 21:34:26\";s:10:\"deleted_at\";N;}s:11:\"\0*\0original\";a:11:{s:2:\"id\";i:3;s:9:\"public_id\";s:26:\"01M713QQY2E4S47MA8N35FW7B5\";s:5:\"title\";s:131:\"{\"ar\": \"كمرات الأوناش الملحومة والمسطحات الثقيلة\", \"en\": \"Built-Up Crane Girders & Plate Work\"}\";s:4:\"slug\";s:22:\"built-up-crane-girders\";s:9:\"file_path\";N;s:11:\"description\";s:317:\"{\"ar\": \"كمرات صفائحية ملحومة آلياً مخصصة لمسارات الأوناش العلوية الثقيلة ذات التحمل العالي للأحمال الديناميكية.\", \"en\": \"Custom welded plate girders engineered for heavy industrial overhead cranes with high fatigue resistance.\"}\";s:14:\"specifications\";s:236:\"{\"testing\": \"100% Ultrasonic & Magnetic Particle NDT\", \"capacity\": \"Supports Overhead Cranes up to 80 Metric Tons\", \"steel_grade\": \"High-Strength Heavy Plate ASTM A572 Gr. 50\", \"welding_process\": \"Automated Submerged Arc Welding (SAW)\"}\";s:9:\"is_active\";i:1;s:10:\"created_at\";s:19:\"2026-11-09 21:34:26\";s:10:\"updated_at\";s:19:\"2026-11-09 21:34:26\";s:10:\"deleted_at\";N;}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:5:{s:5:\"title\";s:5:\"array\";s:11:\"description\";s:5:\"array\";s:14:\"specifications\";s:5:\"array\";s:9:\"is_active\";s:7:\"boolean\";s:10:\"deleted_at\";s:8:\"datetime\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:3:{s:11:\"attachments\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}s:10:\"attributes\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}s:6:\"images\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:1:{i:0;s:2:\"id\";}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:8:{i:0;s:9:\"public_id\";i:1;s:5:\"title\";i:2;s:4:\"slug\";i:3;s:11:\"description\";i:4;s:14:\"specifications\";i:5;s:9:\"is_active\";i:6;s:9:\"file_path\";i:7;s:14:\"technical_file\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:2:\"id\";}s:16:\"\0*\0forceDeleting\";b:0;}i:3;O:18:\"App\\Models\\Product\":31:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:8:\"products\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:11:{s:2:\"id\";i:4;s:9:\"public_id\";s:26:\"01M713QQY8376NS60BMHJ1WKEX\";s:5:\"title\";s:121:\"{\"ar\": \"المباني الفولاذية سابقة الهندسة (PEB)\", \"en\": \"Pre-Engineered Steel Buildings (PEB)\"}\";s:4:\"slug\";s:30:\"pre-engineered-steel-buildings\";s:9:\"file_path\";N;s:11:\"description\";s:324:\"{\"ar\": \"أنظمة إطارات صلبة متطورة مع ألواح تكسية عازلة (ساندوتش بانل) للتركيب السريع في المشاريع الصناعية والتجارية.\", \"en\": \"Optimized rigid frame steel systems with insulated sandwich panel claddings for rapid commercial deployment.\"}\";s:14:\"specifications\";s:221:\"{\"cladding\": \"PIR Fire-Rated Insulated Sandwich Panels\", \"primary_framing\": \"Tapered Built-Up I-Sections\", \"secondary_framing\": \"Cold-Formed Galvanized Z & C Purlins\", \"wind_speed_design\": \"Up to 160 km/h regional codes\"}\";s:9:\"is_active\";i:1;s:10:\"created_at\";s:19:\"2026-11-09 21:34:26\";s:10:\"updated_at\";s:19:\"2026-11-09 21:34:26\";s:10:\"deleted_at\";N;}s:11:\"\0*\0original\";a:11:{s:2:\"id\";i:4;s:9:\"public_id\";s:26:\"01M713QQY8376NS60BMHJ1WKEX\";s:5:\"title\";s:121:\"{\"ar\": \"المباني الفولاذية سابقة الهندسة (PEB)\", \"en\": \"Pre-Engineered Steel Buildings (PEB)\"}\";s:4:\"slug\";s:30:\"pre-engineered-steel-buildings\";s:9:\"file_path\";N;s:11:\"description\";s:324:\"{\"ar\": \"أنظمة إطارات صلبة متطورة مع ألواح تكسية عازلة (ساندوتش بانل) للتركيب السريع في المشاريع الصناعية والتجارية.\", \"en\": \"Optimized rigid frame steel systems with insulated sandwich panel claddings for rapid commercial deployment.\"}\";s:14:\"specifications\";s:221:\"{\"cladding\": \"PIR Fire-Rated Insulated Sandwich Panels\", \"primary_framing\": \"Tapered Built-Up I-Sections\", \"secondary_framing\": \"Cold-Formed Galvanized Z & C Purlins\", \"wind_speed_design\": \"Up to 160 km/h regional codes\"}\";s:9:\"is_active\";i:1;s:10:\"created_at\";s:19:\"2026-11-09 21:34:26\";s:10:\"updated_at\";s:19:\"2026-11-09 21:34:26\";s:10:\"deleted_at\";N;}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:5:{s:5:\"title\";s:5:\"array\";s:11:\"description\";s:5:\"array\";s:14:\"specifications\";s:5:\"array\";s:9:\"is_active\";s:7:\"boolean\";s:10:\"deleted_at\";s:8:\"datetime\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:3:{s:11:\"attachments\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}s:10:\"attributes\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}s:6:\"images\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:1:{i:0;s:2:\"id\";}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:8:{i:0;s:9:\"public_id\";i:1;s:5:\"title\";i:2;s:4:\"slug\";i:3;s:11:\"description\";i:4;s:14:\"specifications\";i:5;s:9:\"is_active\";i:6;s:9:\"file_path\";i:7;s:14:\"technical_file\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:2:\"id\";}s:16:\"\0*\0forceDeleting\";b:0;}i:4;O:18:\"App\\Models\\Product\":31:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:8:\"products\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:11:{s:2:\"id\";i:9;s:9:\"public_id\";s:26:\"01M7B7A5YJS4RVJK7AA17ADX26\";s:5:\"title\";s:32:\"{\"ar\": \"تيست\", \"en\": \"test\"}\";s:4:\"slug\";s:7:\"testing\";s:9:\"file_path\";N;s:11:\"description\";s:102:\"{\"ar\": \"سمنشيسشمين ست يشينتشسي حخشسيكم\", \"en\": \"askjdl aksjd12 ksjdalkjsd\"}\";s:14:\"specifications\";s:2:\"[]\";s:9:\"is_active\";i:1;s:10:\"created_at\";s:19:\"2026-11-13 19:49:20\";s:10:\"updated_at\";s:19:\"2026-11-13 19:49:20\";s:10:\"deleted_at\";N;}s:11:\"\0*\0original\";a:11:{s:2:\"id\";i:9;s:9:\"public_id\";s:26:\"01M7B7A5YJS4RVJK7AA17ADX26\";s:5:\"title\";s:32:\"{\"ar\": \"تيست\", \"en\": \"test\"}\";s:4:\"slug\";s:7:\"testing\";s:9:\"file_path\";N;s:11:\"description\";s:102:\"{\"ar\": \"سمنشيسشمين ست يشينتشسي حخشسيكم\", \"en\": \"askjdl aksjd12 ksjdalkjsd\"}\";s:14:\"specifications\";s:2:\"[]\";s:9:\"is_active\";i:1;s:10:\"created_at\";s:19:\"2026-11-13 19:49:20\";s:10:\"updated_at\";s:19:\"2026-11-13 19:49:20\";s:10:\"deleted_at\";N;}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:5:{s:5:\"title\";s:5:\"array\";s:11:\"description\";s:5:\"array\";s:14:\"specifications\";s:5:\"array\";s:9:\"is_active\";s:7:\"boolean\";s:10:\"deleted_at\";s:8:\"datetime\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:3:{s:11:\"attachments\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:1:{i:0;O:21:\"App\\Models\\Attachment\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:11:\"attachments\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:12:{s:2:\"id\";i:3;s:9:\"public_id\";s:26:\"01M7B7A5Z986ZK32XD52VKF06T\";s:15:\"attachable_type\";s:18:\"App\\Models\\Product\";s:13:\"attachable_id\";i:9;s:9:\"file_path\";s:56:\"uploads/products/technical/test_technical_1794599360.pdf\";s:9:\"file_name\";s:55:\"السيرة الذاتية - يحيى الجندي.pdf\";s:9:\"mime_type\";s:15:\"application/pdf\";s:10:\"size_bytes\";i:132929;s:11:\"scan_status\";s:6:\"passed\";s:11:\"uploaded_at\";s:19:\"2026-11-13 19:49:20\";s:10:\"created_at\";s:19:\"2026-11-13 19:49:20\";s:10:\"updated_at\";s:19:\"2026-11-13 19:49:20\";}s:11:\"\0*\0original\";a:12:{s:2:\"id\";i:3;s:9:\"public_id\";s:26:\"01M7B7A5Z986ZK32XD52VKF06T\";s:15:\"attachable_type\";s:18:\"App\\Models\\Product\";s:13:\"attachable_id\";i:9;s:9:\"file_path\";s:56:\"uploads/products/technical/test_technical_1794599360.pdf\";s:9:\"file_name\";s:55:\"السيرة الذاتية - يحيى الجندي.pdf\";s:9:\"mime_type\";s:15:\"application/pdf\";s:10:\"size_bytes\";i:132929;s:11:\"scan_status\";s:6:\"passed\";s:11:\"uploaded_at\";s:19:\"2026-11-13 19:49:20\";s:10:\"created_at\";s:19:\"2026-11-13 19:49:20\";s:10:\"updated_at\";s:19:\"2026-11-13 19:49:20\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:2:{s:10:\"size_bytes\";s:7:\"integer\";s:11:\"uploaded_at\";s:8:\"datetime\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:1:{i:0;s:2:\"id\";}}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}s:10:\"attributes\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:3:{i:0;O:27:\"App\\Models\\ProductAttribute\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:18:\"product_attributes\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:9:{s:2:\"id\";i:7;s:10:\"product_id\";i:9;s:7:\"name_en\";s:5:\"space\";s:7:\"name_ar\";s:10:\"مساحه\";s:8:\"value_en\";s:3:\"500\";s:8:\"value_ar\";s:3:\"500\";s:10:\"sort_order\";i:1;s:10:\"created_at\";s:19:\"2026-11-13 19:49:20\";s:10:\"updated_at\";s:19:\"2026-11-13 19:49:20\";}s:11:\"\0*\0original\";a:9:{s:2:\"id\";i:7;s:10:\"product_id\";i:9;s:7:\"name_en\";s:5:\"space\";s:7:\"name_ar\";s:10:\"مساحه\";s:8:\"value_en\";s:3:\"500\";s:8:\"value_ar\";s:3:\"500\";s:10:\"sort_order\";i:1;s:10:\"created_at\";s:19:\"2026-11-13 19:49:20\";s:10:\"updated_at\";s:19:\"2026-11-13 19:49:20\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:1:{s:10:\"sort_order\";s:7:\"integer\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:1:{i:0;s:2:\"id\";}}i:1;O:27:\"App\\Models\\ProductAttribute\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:18:\"product_attributes\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:9:{s:2:\"id\";i:8;s:10:\"product_id\";i:9;s:7:\"name_en\";s:10:\"space test\";s:7:\"name_ar\";s:19:\"مساحه تيست\";s:8:\"value_en\";s:3:\"200\";s:8:\"value_ar\";s:3:\"200\";s:10:\"sort_order\";i:2;s:10:\"created_at\";s:19:\"2026-11-13 19:49:20\";s:10:\"updated_at\";s:19:\"2026-11-13 19:49:20\";}s:11:\"\0*\0original\";a:9:{s:2:\"id\";i:8;s:10:\"product_id\";i:9;s:7:\"name_en\";s:10:\"space test\";s:7:\"name_ar\";s:19:\"مساحه تيست\";s:8:\"value_en\";s:3:\"200\";s:8:\"value_ar\";s:3:\"200\";s:10:\"sort_order\";i:2;s:10:\"created_at\";s:19:\"2026-11-13 19:49:20\";s:10:\"updated_at\";s:19:\"2026-11-13 19:49:20\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:1:{s:10:\"sort_order\";s:7:\"integer\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:1:{i:0;s:2:\"id\";}}i:2;O:27:\"App\\Models\\ProductAttribute\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:18:\"product_attributes\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:9:{s:2:\"id\";i:9;s:10:\"product_id\";i:9;s:7:\"name_en\";s:6:\"length\";s:7:\"name_ar\";s:10:\"مسافه\";s:8:\"value_en\";s:3:\"100\";s:8:\"value_ar\";s:3:\"100\";s:10:\"sort_order\";i:3;s:10:\"created_at\";s:19:\"2026-11-13 19:49:20\";s:10:\"updated_at\";s:19:\"2026-11-13 19:49:20\";}s:11:\"\0*\0original\";a:9:{s:2:\"id\";i:9;s:10:\"product_id\";i:9;s:7:\"name_en\";s:6:\"length\";s:7:\"name_ar\";s:10:\"مسافه\";s:8:\"value_en\";s:3:\"100\";s:8:\"value_ar\";s:3:\"100\";s:10:\"sort_order\";i:3;s:10:\"created_at\";s:19:\"2026-11-13 19:49:20\";s:10:\"updated_at\";s:19:\"2026-11-13 19:49:20\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:1:{s:10:\"sort_order\";s:7:\"integer\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:1:{i:0;s:2:\"id\";}}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}s:6:\"images\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:1:{i:0;s:2:\"id\";}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:8:{i:0;s:9:\"public_id\";i:1;s:5:\"title\";i:2;s:4:\"slug\";i:3;s:11:\"description\";i:4;s:14:\"specifications\";i:5;s:9:\"is_active\";i:6;s:9:\"file_path\";i:7;s:14:\"technical_file\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:2:\"id\";}s:16:\"\0*\0forceDeleting\";b:0;}i:5;O:18:\"App\\Models\\Product\":31:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:8:\"products\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:11:{s:2:\"id\";i:10;s:9:\"public_id\";s:26:\"01M7B86YCT12VR1NDTVY7HA99G\";s:5:\"title\";s:32:\"{\"ar\": \"تيست\", \"en\": \"test\"}\";s:4:\"slug\";s:9:\"testfarid\";s:9:\"file_path\";N;s:11:\"description\";s:92:\"{\"ar\": \"سمنيشتسمينش كي 2منتمنشست ين\", \"en\": \"sdkjas dalkd skjskjasd\"}\";s:14:\"specifications\";s:2:\"[]\";s:9:\"is_active\";i:1;s:10:\"created_at\";s:19:\"2026-11-13 20:05:03\";s:10:\"updated_at\";s:19:\"2026-11-13 20:05:03\";s:10:\"deleted_at\";N;}s:11:\"\0*\0original\";a:11:{s:2:\"id\";i:10;s:9:\"public_id\";s:26:\"01M7B86YCT12VR1NDTVY7HA99G\";s:5:\"title\";s:32:\"{\"ar\": \"تيست\", \"en\": \"test\"}\";s:4:\"slug\";s:9:\"testfarid\";s:9:\"file_path\";N;s:11:\"description\";s:92:\"{\"ar\": \"سمنيشتسمينش كي 2منتمنشست ين\", \"en\": \"sdkjas dalkd skjskjasd\"}\";s:14:\"specifications\";s:2:\"[]\";s:9:\"is_active\";i:1;s:10:\"created_at\";s:19:\"2026-11-13 20:05:03\";s:10:\"updated_at\";s:19:\"2026-11-13 20:05:03\";s:10:\"deleted_at\";N;}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:5:{s:5:\"title\";s:5:\"array\";s:11:\"description\";s:5:\"array\";s:14:\"specifications\";s:5:\"array\";s:9:\"is_active\";s:7:\"boolean\";s:10:\"deleted_at\";s:8:\"datetime\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:3:{s:11:\"attachments\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:1:{i:0;O:21:\"App\\Models\\Attachment\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:11:\"attachments\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:12:{s:2:\"id\";i:4;s:9:\"public_id\";s:26:\"01M7B86YDG72NKYBFPN0QD3MK6\";s:15:\"attachable_type\";s:18:\"App\\Models\\Product\";s:13:\"attachable_id\";i:10;s:9:\"file_path\";s:56:\"uploads/products/technical/test_technical_1794600303.pdf\";s:9:\"file_name\";s:55:\"السيرة الذاتية - يحيى الجندي.pdf\";s:9:\"mime_type\";s:15:\"application/pdf\";s:10:\"size_bytes\";i:132929;s:11:\"scan_status\";s:6:\"passed\";s:11:\"uploaded_at\";s:19:\"2026-11-13 20:05:03\";s:10:\"created_at\";s:19:\"2026-11-13 20:05:03\";s:10:\"updated_at\";s:19:\"2026-11-13 20:05:03\";}s:11:\"\0*\0original\";a:12:{s:2:\"id\";i:4;s:9:\"public_id\";s:26:\"01M7B86YDG72NKYBFPN0QD3MK6\";s:15:\"attachable_type\";s:18:\"App\\Models\\Product\";s:13:\"attachable_id\";i:10;s:9:\"file_path\";s:56:\"uploads/products/technical/test_technical_1794600303.pdf\";s:9:\"file_name\";s:55:\"السيرة الذاتية - يحيى الجندي.pdf\";s:9:\"mime_type\";s:15:\"application/pdf\";s:10:\"size_bytes\";i:132929;s:11:\"scan_status\";s:6:\"passed\";s:11:\"uploaded_at\";s:19:\"2026-11-13 20:05:03\";s:10:\"created_at\";s:19:\"2026-11-13 20:05:03\";s:10:\"updated_at\";s:19:\"2026-11-13 20:05:03\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:2:{s:10:\"size_bytes\";s:7:\"integer\";s:11:\"uploaded_at\";s:8:\"datetime\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:1:{i:0;s:2:\"id\";}}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}s:10:\"attributes\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:3:{i:0;O:27:\"App\\Models\\ProductAttribute\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:18:\"product_attributes\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:9:{s:2:\"id\";i:13;s:10:\"product_id\";i:10;s:7:\"name_en\";s:5:\"space\";s:7:\"name_ar\";s:10:\"مساحه\";s:8:\"value_en\";s:3:\"500\";s:8:\"value_ar\";s:3:\"500\";s:10:\"sort_order\";i:1;s:10:\"created_at\";s:19:\"2026-11-13 20:06:07\";s:10:\"updated_at\";s:19:\"2026-11-13 20:06:07\";}s:11:\"\0*\0original\";a:9:{s:2:\"id\";i:13;s:10:\"product_id\";i:10;s:7:\"name_en\";s:5:\"space\";s:7:\"name_ar\";s:10:\"مساحه\";s:8:\"value_en\";s:3:\"500\";s:8:\"value_ar\";s:3:\"500\";s:10:\"sort_order\";i:1;s:10:\"created_at\";s:19:\"2026-11-13 20:06:07\";s:10:\"updated_at\";s:19:\"2026-11-13 20:06:07\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:1:{s:10:\"sort_order\";s:7:\"integer\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:1:{i:0;s:2:\"id\";}}i:1;O:27:\"App\\Models\\ProductAttribute\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:18:\"product_attributes\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:9:{s:2:\"id\";i:14;s:10:\"product_id\";i:10;s:7:\"name_en\";s:10:\"space test\";s:7:\"name_ar\";s:19:\"مساحه تيست\";s:8:\"value_en\";s:3:\"200\";s:8:\"value_ar\";s:3:\"200\";s:10:\"sort_order\";i:2;s:10:\"created_at\";s:19:\"2026-11-13 20:06:07\";s:10:\"updated_at\";s:19:\"2026-11-13 20:06:07\";}s:11:\"\0*\0original\";a:9:{s:2:\"id\";i:14;s:10:\"product_id\";i:10;s:7:\"name_en\";s:10:\"space test\";s:7:\"name_ar\";s:19:\"مساحه تيست\";s:8:\"value_en\";s:3:\"200\";s:8:\"value_ar\";s:3:\"200\";s:10:\"sort_order\";i:2;s:10:\"created_at\";s:19:\"2026-11-13 20:06:07\";s:10:\"updated_at\";s:19:\"2026-11-13 20:06:07\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:1:{s:10:\"sort_order\";s:7:\"integer\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:1:{i:0;s:2:\"id\";}}i:2;O:27:\"App\\Models\\ProductAttribute\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:18:\"product_attributes\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:9:{s:2:\"id\";i:15;s:10:\"product_id\";i:10;s:7:\"name_en\";s:6:\"length\";s:7:\"name_ar\";s:10:\"مسافه\";s:8:\"value_en\";s:3:\"150\";s:8:\"value_ar\";s:3:\"150\";s:10:\"sort_order\";i:3;s:10:\"created_at\";s:19:\"2026-11-13 20:06:08\";s:10:\"updated_at\";s:19:\"2026-11-13 20:06:08\";}s:11:\"\0*\0original\";a:9:{s:2:\"id\";i:15;s:10:\"product_id\";i:10;s:7:\"name_en\";s:6:\"length\";s:7:\"name_ar\";s:10:\"مسافه\";s:8:\"value_en\";s:3:\"150\";s:8:\"value_ar\";s:3:\"150\";s:10:\"sort_order\";i:3;s:10:\"created_at\";s:19:\"2026-11-13 20:06:08\";s:10:\"updated_at\";s:19:\"2026-11-13 20:06:08\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:1:{s:10:\"sort_order\";s:7:\"integer\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:1:{i:0;s:2:\"id\";}}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}s:6:\"images\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:1:{i:0;s:2:\"id\";}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:8:{i:0;s:9:\"public_id\";i:1;s:5:\"title\";i:2;s:4:\"slug\";i:3;s:11:\"description\";i:4;s:14:\"specifications\";i:5;s:9:\"is_active\";i:6;s:9:\"file_path\";i:7;s:14:\"technical_file\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:2:\"id\";}s:16:\"\0*\0forceDeleting\";b:0;}i:6;O:18:\"App\\Models\\Product\":31:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:8:\"products\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:11:{s:2:\"id\";i:11;s:9:\"public_id\";s:26:\"01M7D41XTE45NSDC7X3WV3T225\";s:5:\"title\";s:29:\"{\"ar\": \"بحر\", \"en\": \"sea\"}\";s:4:\"slug\";s:3:\"sea\";s:9:\"file_path\";N;s:11:\"description\";s:99:\"{\"ar\": \"سشب سشب شس يبص يشسيب 24124 سشي شي\", \"en\": \"sadsd 12 sc1 sg1 vd1  fvv\"}\";s:14:\"specifications\";s:2:\"[]\";s:9:\"is_active\";i:1;s:10:\"created_at\";s:19:\"2026-11-14 13:30:53\";s:10:\"updated_at\";s:19:\"2026-11-14 13:30:53\";s:10:\"deleted_at\";N;}s:11:\"\0*\0original\";a:11:{s:2:\"id\";i:11;s:9:\"public_id\";s:26:\"01M7D41XTE45NSDC7X3WV3T225\";s:5:\"title\";s:29:\"{\"ar\": \"بحر\", \"en\": \"sea\"}\";s:4:\"slug\";s:3:\"sea\";s:9:\"file_path\";N;s:11:\"description\";s:99:\"{\"ar\": \"سشب سشب شس يبص يشسيب 24124 سشي شي\", \"en\": \"sadsd 12 sc1 sg1 vd1  fvv\"}\";s:14:\"specifications\";s:2:\"[]\";s:9:\"is_active\";i:1;s:10:\"created_at\";s:19:\"2026-11-14 13:30:53\";s:10:\"updated_at\";s:19:\"2026-11-14 13:30:53\";s:10:\"deleted_at\";N;}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:5:{s:5:\"title\";s:5:\"array\";s:11:\"description\";s:5:\"array\";s:14:\"specifications\";s:5:\"array\";s:9:\"is_active\";s:7:\"boolean\";s:10:\"deleted_at\";s:8:\"datetime\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:3:{s:11:\"attachments\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:1:{i:0;O:21:\"App\\Models\\Attachment\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:11:\"attachments\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:12:{s:2:\"id\";i:5;s:9:\"public_id\";s:26:\"01M7D41XXSE3NPDF48TE7TH836\";s:15:\"attachable_type\";s:18:\"App\\Models\\Product\";s:13:\"attachable_id\";i:11;s:9:\"file_path\";s:55:\"uploads/products/technical/sea_technical_1794663053.pdf\";s:9:\"file_name\";s:55:\"السيرة الذاتية - يحيى الجندي.pdf\";s:9:\"mime_type\";s:15:\"application/pdf\";s:10:\"size_bytes\";i:132929;s:11:\"scan_status\";s:6:\"passed\";s:11:\"uploaded_at\";s:19:\"2026-11-14 13:30:53\";s:10:\"created_at\";s:19:\"2026-11-14 13:30:53\";s:10:\"updated_at\";s:19:\"2026-11-14 13:30:53\";}s:11:\"\0*\0original\";a:12:{s:2:\"id\";i:5;s:9:\"public_id\";s:26:\"01M7D41XXSE3NPDF48TE7TH836\";s:15:\"attachable_type\";s:18:\"App\\Models\\Product\";s:13:\"attachable_id\";i:11;s:9:\"file_path\";s:55:\"uploads/products/technical/sea_technical_1794663053.pdf\";s:9:\"file_name\";s:55:\"السيرة الذاتية - يحيى الجندي.pdf\";s:9:\"mime_type\";s:15:\"application/pdf\";s:10:\"size_bytes\";i:132929;s:11:\"scan_status\";s:6:\"passed\";s:11:\"uploaded_at\";s:19:\"2026-11-14 13:30:53\";s:10:\"created_at\";s:19:\"2026-11-14 13:30:53\";s:10:\"updated_at\";s:19:\"2026-11-14 13:30:53\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:2:{s:10:\"size_bytes\";s:7:\"integer\";s:11:\"uploaded_at\";s:8:\"datetime\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:1:{i:0;s:2:\"id\";}}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}s:10:\"attributes\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:2:{i:0;O:27:\"App\\Models\\ProductAttribute\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:18:\"product_attributes\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:9:{s:2:\"id\";i:16;s:10:\"product_id\";i:11;s:7:\"name_en\";s:3:\"sea\";s:7:\"name_ar\";s:6:\"بحر\";s:8:\"value_en\";s:3:\"700\";s:8:\"value_ar\";s:3:\"700\";s:10:\"sort_order\";i:1;s:10:\"created_at\";s:19:\"2026-11-14 13:30:53\";s:10:\"updated_at\";s:19:\"2026-11-14 13:30:53\";}s:11:\"\0*\0original\";a:9:{s:2:\"id\";i:16;s:10:\"product_id\";i:11;s:7:\"name_en\";s:3:\"sea\";s:7:\"name_ar\";s:6:\"بحر\";s:8:\"value_en\";s:3:\"700\";s:8:\"value_ar\";s:3:\"700\";s:10:\"sort_order\";i:1;s:10:\"created_at\";s:19:\"2026-11-14 13:30:53\";s:10:\"updated_at\";s:19:\"2026-11-14 13:30:53\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:1:{s:10:\"sort_order\";s:7:\"integer\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:1:{i:0;s:2:\"id\";}}i:1;O:27:\"App\\Models\\ProductAttribute\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:18:\"product_attributes\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:9:{s:2:\"id\";i:17;s:10:\"product_id\";i:11;s:7:\"name_en\";s:6:\"length\";s:7:\"name_ar\";s:10:\"مسافه\";s:8:\"value_en\";s:4:\"1000\";s:8:\"value_ar\";s:4:\"1000\";s:10:\"sort_order\";i:2;s:10:\"created_at\";s:19:\"2026-11-14 13:30:53\";s:10:\"updated_at\";s:19:\"2026-11-14 13:30:53\";}s:11:\"\0*\0original\";a:9:{s:2:\"id\";i:17;s:10:\"product_id\";i:11;s:7:\"name_en\";s:6:\"length\";s:7:\"name_ar\";s:10:\"مسافه\";s:8:\"value_en\";s:4:\"1000\";s:8:\"value_ar\";s:4:\"1000\";s:10:\"sort_order\";i:2;s:10:\"created_at\";s:19:\"2026-11-14 13:30:53\";s:10:\"updated_at\";s:19:\"2026-11-14 13:30:53\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:1:{s:10:\"sort_order\";s:7:\"integer\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:1:{i:0;s:2:\"id\";}}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}s:6:\"images\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:3:{i:0;O:23:\"App\\Models\\ProductImage\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:14:\"product_images\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:6:{s:2:\"id\";i:1;s:10:\"product_id\";i:11;s:10:\"image_path\";s:49:\"uploads/products/sea_1794663053_6af8628d35916.jpg\";s:10:\"sort_order\";i:1;s:10:\"created_at\";s:19:\"2026-11-14 13:30:53\";s:10:\"updated_at\";s:19:\"2026-11-14 13:30:53\";}s:11:\"\0*\0original\";a:6:{s:2:\"id\";i:1;s:10:\"product_id\";i:11;s:10:\"image_path\";s:49:\"uploads/products/sea_1794663053_6af8628d35916.jpg\";s:10:\"sort_order\";i:1;s:10:\"created_at\";s:19:\"2026-11-14 13:30:53\";s:10:\"updated_at\";s:19:\"2026-11-14 13:30:53\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:1:{s:10:\"sort_order\";s:7:\"integer\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:3:{i:0;s:10:\"product_id\";i:1;s:10:\"image_path\";i:2;s:10:\"sort_order\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:2:\"id\";}}i:1;O:23:\"App\\Models\\ProductImage\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:14:\"product_images\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:6:{s:2:\"id\";i:2;s:10:\"product_id\";i:11;s:10:\"image_path\";s:50:\"uploads/products/sea_1794663053_6af8628d37023.jpeg\";s:10:\"sort_order\";i:2;s:10:\"created_at\";s:19:\"2026-11-14 13:30:53\";s:10:\"updated_at\";s:19:\"2026-11-14 13:30:53\";}s:11:\"\0*\0original\";a:6:{s:2:\"id\";i:2;s:10:\"product_id\";i:11;s:10:\"image_path\";s:50:\"uploads/products/sea_1794663053_6af8628d37023.jpeg\";s:10:\"sort_order\";i:2;s:10:\"created_at\";s:19:\"2026-11-14 13:30:53\";s:10:\"updated_at\";s:19:\"2026-11-14 13:30:53\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:1:{s:10:\"sort_order\";s:7:\"integer\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:3:{i:0;s:10:\"product_id\";i:1;s:10:\"image_path\";i:2;s:10:\"sort_order\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:2:\"id\";}}i:2;O:23:\"App\\Models\\ProductImage\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:14:\"product_images\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:6:{s:2:\"id\";i:3;s:10:\"product_id\";i:11;s:10:\"image_path\";s:49:\"uploads/products/sea_1794663053_6af8628d38a28.jpg\";s:10:\"sort_order\";i:3;s:10:\"created_at\";s:19:\"2026-11-14 13:30:53\";s:10:\"updated_at\";s:19:\"2026-11-14 13:30:53\";}s:11:\"\0*\0original\";a:6:{s:2:\"id\";i:3;s:10:\"product_id\";i:11;s:10:\"image_path\";s:49:\"uploads/products/sea_1794663053_6af8628d38a28.jpg\";s:10:\"sort_order\";i:3;s:10:\"created_at\";s:19:\"2026-11-14 13:30:53\";s:10:\"updated_at\";s:19:\"2026-11-14 13:30:53\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:1:{s:10:\"sort_order\";s:7:\"integer\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:3:{i:0;s:10:\"product_id\";i:1;s:10:\"image_path\";i:2;s:10:\"sort_order\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:2:\"id\";}}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:1:{i:0;s:2:\"id\";}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:8:{i:0;s:9:\"public_id\";i:1;s:5:\"title\";i:2;s:4:\"slug\";i:3;s:11:\"description\";i:4;s:14:\"specifications\";i:5;s:9:\"is_active\";i:6;s:9:\"file_path\";i:7;s:14:\"technical_file\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:2:\"id\";}s:16:\"\0*\0forceDeleting\";b:0;}i:7;O:18:\"App\\Models\\Product\":31:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:8:\"products\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:11:{s:2:\"id\";i:12;s:9:\"public_id\";s:26:\"01M7D5WK0FXMRHQM3HMMMDJ35H\";s:5:\"title\";s:33:\"{\"ar\": \"مثلا\", \"en\": \"mslan\"}\";s:4:\"slug\";s:5:\"mslan\";s:9:\"file_path\";s:53:\"uploads/products/files/mslan-datasheet-1794664996.pdf\";s:11:\"description\";s:78:\"{\"ar\": \"سشي س يبش سبشبشس ب2شبس 2\", \"en\": \"sad as da 2sa dfa\"}\";s:14:\"specifications\";s:2:\"[]\";s:9:\"is_active\";i:1;s:10:\"created_at\";s:19:\"2026-11-14 14:02:55\";s:10:\"updated_at\";s:19:\"2026-11-14 14:03:16\";s:10:\"deleted_at\";N;}s:11:\"\0*\0original\";a:11:{s:2:\"id\";i:12;s:9:\"public_id\";s:26:\"01M7D5WK0FXMRHQM3HMMMDJ35H\";s:5:\"title\";s:33:\"{\"ar\": \"مثلا\", \"en\": \"mslan\"}\";s:4:\"slug\";s:5:\"mslan\";s:9:\"file_path\";s:53:\"uploads/products/files/mslan-datasheet-1794664996.pdf\";s:11:\"description\";s:78:\"{\"ar\": \"سشي س يبش سبشبشس ب2شبس 2\", \"en\": \"sad as da 2sa dfa\"}\";s:14:\"specifications\";s:2:\"[]\";s:9:\"is_active\";i:1;s:10:\"created_at\";s:19:\"2026-11-14 14:02:55\";s:10:\"updated_at\";s:19:\"2026-11-14 14:03:16\";s:10:\"deleted_at\";N;}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:5:{s:5:\"title\";s:5:\"array\";s:11:\"description\";s:5:\"array\";s:14:\"specifications\";s:5:\"array\";s:9:\"is_active\";s:7:\"boolean\";s:10:\"deleted_at\";s:8:\"datetime\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:3:{s:11:\"attachments\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}s:10:\"attributes\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:1:{i:0;O:27:\"App\\Models\\ProductAttribute\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:18:\"product_attributes\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:9:{s:2:\"id\";i:19;s:10:\"product_id\";i:12;s:7:\"name_en\";s:6:\"length\";s:7:\"name_ar\";s:10:\"مسافه\";s:8:\"value_en\";s:3:\"100\";s:8:\"value_ar\";s:3:\"700\";s:10:\"sort_order\";i:1;s:10:\"created_at\";s:19:\"2026-11-14 14:03:16\";s:10:\"updated_at\";s:19:\"2026-11-14 14:03:16\";}s:11:\"\0*\0original\";a:9:{s:2:\"id\";i:19;s:10:\"product_id\";i:12;s:7:\"name_en\";s:6:\"length\";s:7:\"name_ar\";s:10:\"مسافه\";s:8:\"value_en\";s:3:\"100\";s:8:\"value_ar\";s:3:\"700\";s:10:\"sort_order\";i:1;s:10:\"created_at\";s:19:\"2026-11-14 14:03:16\";s:10:\"updated_at\";s:19:\"2026-11-14 14:03:16\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:1:{s:10:\"sort_order\";s:7:\"integer\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:1:{i:0;s:2:\"id\";}}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}s:6:\"images\";O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:3:{i:0;O:23:\"App\\Models\\ProductImage\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:14:\"product_images\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:6:{s:2:\"id\";i:4;s:10:\"product_id\";i:12;s:10:\"image_path\";s:51:\"uploads/products/mslan_1794664975_6af86a0f607db.jpg\";s:10:\"sort_order\";i:1;s:10:\"created_at\";s:19:\"2026-11-14 14:02:55\";s:10:\"updated_at\";s:19:\"2026-11-14 14:02:55\";}s:11:\"\0*\0original\";a:6:{s:2:\"id\";i:4;s:10:\"product_id\";i:12;s:10:\"image_path\";s:51:\"uploads/products/mslan_1794664975_6af86a0f607db.jpg\";s:10:\"sort_order\";i:1;s:10:\"created_at\";s:19:\"2026-11-14 14:02:55\";s:10:\"updated_at\";s:19:\"2026-11-14 14:02:55\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:1:{s:10:\"sort_order\";s:7:\"integer\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:3:{i:0;s:10:\"product_id\";i:1;s:10:\"image_path\";i:2;s:10:\"sort_order\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:2:\"id\";}}i:1;O:23:\"App\\Models\\ProductImage\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:14:\"product_images\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:6:{s:2:\"id\";i:5;s:10:\"product_id\";i:12;s:10:\"image_path\";s:52:\"uploads/products/mslan_1794664975_6af86a0f617d4.jpeg\";s:10:\"sort_order\";i:2;s:10:\"created_at\";s:19:\"2026-11-14 14:02:55\";s:10:\"updated_at\";s:19:\"2026-11-14 14:02:55\";}s:11:\"\0*\0original\";a:6:{s:2:\"id\";i:5;s:10:\"product_id\";i:12;s:10:\"image_path\";s:52:\"uploads/products/mslan_1794664975_6af86a0f617d4.jpeg\";s:10:\"sort_order\";i:2;s:10:\"created_at\";s:19:\"2026-11-14 14:02:55\";s:10:\"updated_at\";s:19:\"2026-11-14 14:02:55\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:1:{s:10:\"sort_order\";s:7:\"integer\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:3:{i:0;s:10:\"product_id\";i:1;s:10:\"image_path\";i:2;s:10:\"sort_order\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:2:\"id\";}}i:2;O:23:\"App\\Models\\ProductImage\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:14:\"product_images\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:6:{s:2:\"id\";i:6;s:10:\"product_id\";i:12;s:10:\"image_path\";s:51:\"uploads/products/mslan_1794664975_6af86a0f62a40.jpg\";s:10:\"sort_order\";i:3;s:10:\"created_at\";s:19:\"2026-11-14 14:02:55\";s:10:\"updated_at\";s:19:\"2026-11-14 14:02:55\";}s:11:\"\0*\0original\";a:6:{s:2:\"id\";i:6;s:10:\"product_id\";i:12;s:10:\"image_path\";s:51:\"uploads/products/mslan_1794664975_6af86a0f62a40.jpg\";s:10:\"sort_order\";i:3;s:10:\"created_at\";s:19:\"2026-11-14 14:02:55\";s:10:\"updated_at\";s:19:\"2026-11-14 14:02:55\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:1:{s:10:\"sort_order\";s:7:\"integer\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:3:{i:0;s:10:\"product_id\";i:1;s:10:\"image_path\";i:2;s:10:\"sort_order\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:2:\"id\";}}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:1:{i:0;s:2:\"id\";}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:8:{i:0;s:9:\"public_id\";i:1;s:5:\"title\";i:2;s:4:\"slug\";i:3;s:11:\"description\";i:4;s:14:\"specifications\";i:5;s:9:\"is_active\";i:6;s:9:\"file_path\";i:7;s:14:\"technical_file\";}s:10:\"\0*\0guarded\";a:1:{i:0;s:2:\"id\";}s:16:\"\0*\0forceDeleting\";b:0;}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}', 1794668620);
INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
('public.services.all.ar', 'O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:4:{i:0;O:18:\"App\\Models\\Service\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:8:\"services\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:8:{s:2:\"id\";i:1;s:9:\"public_id\";s:26:\"01M713QQVB8P9030T0J7JZSECG\";s:5:\"title\";s:151:\"{\"ar\": \"التصميم الهندسي والنمذجة ثلاثية الأبعاد (Tekla & BIM)\", \"en\": \"Tekla 3D Detailing & Structural Engineering\"}\";s:4:\"slug\";s:21:\"engineering-tekla-bim\";s:11:\"description\";s:360:\"{\"ar\": \"تصميم المنشآت المعدنية الشامل وهندسة الوصلات وتفصيل نماذج تكلا ثلاثية الأبعاد وفقاً للمواصفات الأمريكية والأوروبية.\", \"en\": \"Complete structural steel design, connection engineering, and Tekla Structures 3D detailing conforming to AISC and Eurocodes.\"}\";s:9:\"is_active\";i:1;s:10:\"created_at\";s:19:\"2026-11-09 21:34:26\";s:10:\"updated_at\";s:19:\"2026-11-09 21:34:26\";}s:11:\"\0*\0original\";a:8:{s:2:\"id\";i:1;s:9:\"public_id\";s:26:\"01M713QQVB8P9030T0J7JZSECG\";s:5:\"title\";s:151:\"{\"ar\": \"التصميم الهندسي والنمذجة ثلاثية الأبعاد (Tekla & BIM)\", \"en\": \"Tekla 3D Detailing & Structural Engineering\"}\";s:4:\"slug\";s:21:\"engineering-tekla-bim\";s:11:\"description\";s:360:\"{\"ar\": \"تصميم المنشآت المعدنية الشامل وهندسة الوصلات وتفصيل نماذج تكلا ثلاثية الأبعاد وفقاً للمواصفات الأمريكية والأوروبية.\", \"en\": \"Complete structural steel design, connection engineering, and Tekla Structures 3D detailing conforming to AISC and Eurocodes.\"}\";s:9:\"is_active\";i:1;s:10:\"created_at\";s:19:\"2026-11-09 21:34:26\";s:10:\"updated_at\";s:19:\"2026-11-09 21:34:26\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:3:{s:5:\"title\";s:5:\"array\";s:11:\"description\";s:5:\"array\";s:9:\"is_active\";s:7:\"boolean\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:1:{i:0;s:2:\"id\";}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:1:{i:0;s:2:\"id\";}}i:1;O:18:\"App\\Models\\Service\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:8:\"services\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:8:{s:2:\"id\";i:2;s:9:\"public_id\";s:26:\"01M713QQX3VE0NGCFQ9GEKMFMH\";s:5:\"title\";s:130:\"{\"ar\": \"تصنيع المنشآت والهياكل الفولاذية الثقيلة\", \"en\": \"Heavy Structural Steel Fabrication\"}\";s:4:\"slug\";s:23:\"heavy-steel-fabrication\";s:11:\"description\";s:359:\"{\"ar\": \"قص وتخريم آلي باستخدام CNC واللحام الآلي بالقوس المغمور وتجميع الأعمدة والكمرات الفولاذية الضخمة بأعلى معايير الدقة.\", \"en\": \"Automated cutting, CNC drilling, submerged arc welding, and assembly of heavy columns, girders, and complex structural members.\"}\";s:9:\"is_active\";i:1;s:10:\"created_at\";s:19:\"2026-11-09 21:34:26\";s:10:\"updated_at\";s:19:\"2026-11-09 21:34:26\";}s:11:\"\0*\0original\";a:8:{s:2:\"id\";i:2;s:9:\"public_id\";s:26:\"01M713QQX3VE0NGCFQ9GEKMFMH\";s:5:\"title\";s:130:\"{\"ar\": \"تصنيع المنشآت والهياكل الفولاذية الثقيلة\", \"en\": \"Heavy Structural Steel Fabrication\"}\";s:4:\"slug\";s:23:\"heavy-steel-fabrication\";s:11:\"description\";s:359:\"{\"ar\": \"قص وتخريم آلي باستخدام CNC واللحام الآلي بالقوس المغمور وتجميع الأعمدة والكمرات الفولاذية الضخمة بأعلى معايير الدقة.\", \"en\": \"Automated cutting, CNC drilling, submerged arc welding, and assembly of heavy columns, girders, and complex structural members.\"}\";s:9:\"is_active\";i:1;s:10:\"created_at\";s:19:\"2026-11-09 21:34:26\";s:10:\"updated_at\";s:19:\"2026-11-09 21:34:26\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:3:{s:5:\"title\";s:5:\"array\";s:11:\"description\";s:5:\"array\";s:9:\"is_active\";s:7:\"boolean\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:1:{i:0;s:2:\"id\";}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:1:{i:0;s:2:\"id\";}}i:2;O:18:\"App\\Models\\Service\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:8:\"services\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:8:{s:2:\"id\";i:3;s:9:\"public_id\";s:26:\"01M713QQXAM3G442WC91GCQ9SH\";s:5:\"title\";s:120:\"{\"ar\": \"معالجة الأسطح والجلفنة على الساخن\", \"en\": \"Surface Blasting & Hot-Dip Galvanizing\"}\";s:4:\"slug\";s:29:\"surface-treatment-galvanizing\";s:11:\"description\";s:345:\"{\"ar\": \"سفح الرمال الميكانيكي بدرجة SA 2.5، وتطبيق دهانات الإيبوكسي والبولي يوريثان، والجلفنة بالغمس الساخن المعتمدة دولياً.\", \"en\": \"SA 2.5 abrasive shot blasting, multi-coat epoxy primer and polyurethane coating, and ISO 1461 hot-dip galvanizing.\"}\";s:9:\"is_active\";i:1;s:10:\"created_at\";s:19:\"2026-11-09 21:34:26\";s:10:\"updated_at\";s:19:\"2026-11-09 21:34:26\";}s:11:\"\0*\0original\";a:8:{s:2:\"id\";i:3;s:9:\"public_id\";s:26:\"01M713QQXAM3G442WC91GCQ9SH\";s:5:\"title\";s:120:\"{\"ar\": \"معالجة الأسطح والجلفنة على الساخن\", \"en\": \"Surface Blasting & Hot-Dip Galvanizing\"}\";s:4:\"slug\";s:29:\"surface-treatment-galvanizing\";s:11:\"description\";s:345:\"{\"ar\": \"سفح الرمال الميكانيكي بدرجة SA 2.5، وتطبيق دهانات الإيبوكسي والبولي يوريثان، والجلفنة بالغمس الساخن المعتمدة دولياً.\", \"en\": \"SA 2.5 abrasive shot blasting, multi-coat epoxy primer and polyurethane coating, and ISO 1461 hot-dip galvanizing.\"}\";s:9:\"is_active\";i:1;s:10:\"created_at\";s:19:\"2026-11-09 21:34:26\";s:10:\"updated_at\";s:19:\"2026-11-09 21:34:26\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:3:{s:5:\"title\";s:5:\"array\";s:11:\"description\";s:5:\"array\";s:9:\"is_active\";s:7:\"boolean\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:1:{i:0;s:2:\"id\";}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:1:{i:0;s:2:\"id\";}}i:3;O:18:\"App\\Models\\Service\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:8:\"services\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:8:{s:2:\"id\";i:4;s:9:\"public_id\";s:26:\"01M713QQXHH65G3QX50JM0GCTD\";s:5:\"title\";s:119:\"{\"ar\": \"التركيب الميداني ورفع الهياكل الثقيلة\", \"en\": \"Site Erection & Heavy Rigging\"}\";s:4:\"slug\";s:27:\"site-erection-heavy-rigging\";s:11:\"description\";s:369:\"{\"ar\": \"تركيب ميداني متكامل بإشراف مهندسين متخصصين ورافعات ثقيلة مع الالتزام التام بأعلى معايير السلامة والصحة المهنية.\", \"en\": \"Turnkey on-site installation by certified erection engineers with precision surveying, heavy mobile cranes, and zero-incident safety protocols.\"}\";s:9:\"is_active\";i:1;s:10:\"created_at\";s:19:\"2026-11-09 21:34:26\";s:10:\"updated_at\";s:19:\"2026-11-09 21:34:26\";}s:11:\"\0*\0original\";a:8:{s:2:\"id\";i:4;s:9:\"public_id\";s:26:\"01M713QQXHH65G3QX50JM0GCTD\";s:5:\"title\";s:119:\"{\"ar\": \"التركيب الميداني ورفع الهياكل الثقيلة\", \"en\": \"Site Erection & Heavy Rigging\"}\";s:4:\"slug\";s:27:\"site-erection-heavy-rigging\";s:11:\"description\";s:369:\"{\"ar\": \"تركيب ميداني متكامل بإشراف مهندسين متخصصين ورافعات ثقيلة مع الالتزام التام بأعلى معايير السلامة والصحة المهنية.\", \"en\": \"Turnkey on-site installation by certified erection engineers with precision surveying, heavy mobile cranes, and zero-incident safety protocols.\"}\";s:9:\"is_active\";i:1;s:10:\"created_at\";s:19:\"2026-11-09 21:34:26\";s:10:\"updated_at\";s:19:\"2026-11-09 21:34:26\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:3:{s:5:\"title\";s:5:\"array\";s:11:\"description\";s:5:\"array\";s:9:\"is_active\";s:7:\"boolean\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:1:{i:0;s:2:\"id\";}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:1:{i:0;s:2:\"id\";}}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}', 1794668676),
('public.services.all.en', 'O:39:\"Illuminate\\Database\\Eloquent\\Collection\":2:{s:8:\"\0*\0items\";a:4:{i:0;O:18:\"App\\Models\\Service\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:8:\"services\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:8:{s:2:\"id\";i:1;s:9:\"public_id\";s:26:\"01M713QQVB8P9030T0J7JZSECG\";s:5:\"title\";s:151:\"{\"ar\": \"التصميم الهندسي والنمذجة ثلاثية الأبعاد (Tekla & BIM)\", \"en\": \"Tekla 3D Detailing & Structural Engineering\"}\";s:4:\"slug\";s:21:\"engineering-tekla-bim\";s:11:\"description\";s:360:\"{\"ar\": \"تصميم المنشآت المعدنية الشامل وهندسة الوصلات وتفصيل نماذج تكلا ثلاثية الأبعاد وفقاً للمواصفات الأمريكية والأوروبية.\", \"en\": \"Complete structural steel design, connection engineering, and Tekla Structures 3D detailing conforming to AISC and Eurocodes.\"}\";s:9:\"is_active\";i:1;s:10:\"created_at\";s:19:\"2026-11-09 21:34:26\";s:10:\"updated_at\";s:19:\"2026-11-09 21:34:26\";}s:11:\"\0*\0original\";a:8:{s:2:\"id\";i:1;s:9:\"public_id\";s:26:\"01M713QQVB8P9030T0J7JZSECG\";s:5:\"title\";s:151:\"{\"ar\": \"التصميم الهندسي والنمذجة ثلاثية الأبعاد (Tekla & BIM)\", \"en\": \"Tekla 3D Detailing & Structural Engineering\"}\";s:4:\"slug\";s:21:\"engineering-tekla-bim\";s:11:\"description\";s:360:\"{\"ar\": \"تصميم المنشآت المعدنية الشامل وهندسة الوصلات وتفصيل نماذج تكلا ثلاثية الأبعاد وفقاً للمواصفات الأمريكية والأوروبية.\", \"en\": \"Complete structural steel design, connection engineering, and Tekla Structures 3D detailing conforming to AISC and Eurocodes.\"}\";s:9:\"is_active\";i:1;s:10:\"created_at\";s:19:\"2026-11-09 21:34:26\";s:10:\"updated_at\";s:19:\"2026-11-09 21:34:26\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:3:{s:5:\"title\";s:5:\"array\";s:11:\"description\";s:5:\"array\";s:9:\"is_active\";s:7:\"boolean\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:1:{i:0;s:2:\"id\";}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:1:{i:0;s:2:\"id\";}}i:1;O:18:\"App\\Models\\Service\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:8:\"services\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:8:{s:2:\"id\";i:2;s:9:\"public_id\";s:26:\"01M713QQX3VE0NGCFQ9GEKMFMH\";s:5:\"title\";s:130:\"{\"ar\": \"تصنيع المنشآت والهياكل الفولاذية الثقيلة\", \"en\": \"Heavy Structural Steel Fabrication\"}\";s:4:\"slug\";s:23:\"heavy-steel-fabrication\";s:11:\"description\";s:359:\"{\"ar\": \"قص وتخريم آلي باستخدام CNC واللحام الآلي بالقوس المغمور وتجميع الأعمدة والكمرات الفولاذية الضخمة بأعلى معايير الدقة.\", \"en\": \"Automated cutting, CNC drilling, submerged arc welding, and assembly of heavy columns, girders, and complex structural members.\"}\";s:9:\"is_active\";i:1;s:10:\"created_at\";s:19:\"2026-11-09 21:34:26\";s:10:\"updated_at\";s:19:\"2026-11-09 21:34:26\";}s:11:\"\0*\0original\";a:8:{s:2:\"id\";i:2;s:9:\"public_id\";s:26:\"01M713QQX3VE0NGCFQ9GEKMFMH\";s:5:\"title\";s:130:\"{\"ar\": \"تصنيع المنشآت والهياكل الفولاذية الثقيلة\", \"en\": \"Heavy Structural Steel Fabrication\"}\";s:4:\"slug\";s:23:\"heavy-steel-fabrication\";s:11:\"description\";s:359:\"{\"ar\": \"قص وتخريم آلي باستخدام CNC واللحام الآلي بالقوس المغمور وتجميع الأعمدة والكمرات الفولاذية الضخمة بأعلى معايير الدقة.\", \"en\": \"Automated cutting, CNC drilling, submerged arc welding, and assembly of heavy columns, girders, and complex structural members.\"}\";s:9:\"is_active\";i:1;s:10:\"created_at\";s:19:\"2026-11-09 21:34:26\";s:10:\"updated_at\";s:19:\"2026-11-09 21:34:26\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:3:{s:5:\"title\";s:5:\"array\";s:11:\"description\";s:5:\"array\";s:9:\"is_active\";s:7:\"boolean\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:1:{i:0;s:2:\"id\";}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:1:{i:0;s:2:\"id\";}}i:2;O:18:\"App\\Models\\Service\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:8:\"services\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:8:{s:2:\"id\";i:3;s:9:\"public_id\";s:26:\"01M713QQXAM3G442WC91GCQ9SH\";s:5:\"title\";s:120:\"{\"ar\": \"معالجة الأسطح والجلفنة على الساخن\", \"en\": \"Surface Blasting & Hot-Dip Galvanizing\"}\";s:4:\"slug\";s:29:\"surface-treatment-galvanizing\";s:11:\"description\";s:345:\"{\"ar\": \"سفح الرمال الميكانيكي بدرجة SA 2.5، وتطبيق دهانات الإيبوكسي والبولي يوريثان، والجلفنة بالغمس الساخن المعتمدة دولياً.\", \"en\": \"SA 2.5 abrasive shot blasting, multi-coat epoxy primer and polyurethane coating, and ISO 1461 hot-dip galvanizing.\"}\";s:9:\"is_active\";i:1;s:10:\"created_at\";s:19:\"2026-11-09 21:34:26\";s:10:\"updated_at\";s:19:\"2026-11-09 21:34:26\";}s:11:\"\0*\0original\";a:8:{s:2:\"id\";i:3;s:9:\"public_id\";s:26:\"01M713QQXAM3G442WC91GCQ9SH\";s:5:\"title\";s:120:\"{\"ar\": \"معالجة الأسطح والجلفنة على الساخن\", \"en\": \"Surface Blasting & Hot-Dip Galvanizing\"}\";s:4:\"slug\";s:29:\"surface-treatment-galvanizing\";s:11:\"description\";s:345:\"{\"ar\": \"سفح الرمال الميكانيكي بدرجة SA 2.5، وتطبيق دهانات الإيبوكسي والبولي يوريثان، والجلفنة بالغمس الساخن المعتمدة دولياً.\", \"en\": \"SA 2.5 abrasive shot blasting, multi-coat epoxy primer and polyurethane coating, and ISO 1461 hot-dip galvanizing.\"}\";s:9:\"is_active\";i:1;s:10:\"created_at\";s:19:\"2026-11-09 21:34:26\";s:10:\"updated_at\";s:19:\"2026-11-09 21:34:26\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:3:{s:5:\"title\";s:5:\"array\";s:11:\"description\";s:5:\"array\";s:9:\"is_active\";s:7:\"boolean\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:1:{i:0;s:2:\"id\";}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:1:{i:0;s:2:\"id\";}}i:3;O:18:\"App\\Models\\Service\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:8:\"services\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:8:{s:2:\"id\";i:4;s:9:\"public_id\";s:26:\"01M713QQXHH65G3QX50JM0GCTD\";s:5:\"title\";s:119:\"{\"ar\": \"التركيب الميداني ورفع الهياكل الثقيلة\", \"en\": \"Site Erection & Heavy Rigging\"}\";s:4:\"slug\";s:27:\"site-erection-heavy-rigging\";s:11:\"description\";s:369:\"{\"ar\": \"تركيب ميداني متكامل بإشراف مهندسين متخصصين ورافعات ثقيلة مع الالتزام التام بأعلى معايير السلامة والصحة المهنية.\", \"en\": \"Turnkey on-site installation by certified erection engineers with precision surveying, heavy mobile cranes, and zero-incident safety protocols.\"}\";s:9:\"is_active\";i:1;s:10:\"created_at\";s:19:\"2026-11-09 21:34:26\";s:10:\"updated_at\";s:19:\"2026-11-09 21:34:26\";}s:11:\"\0*\0original\";a:8:{s:2:\"id\";i:4;s:9:\"public_id\";s:26:\"01M713QQXHH65G3QX50JM0GCTD\";s:5:\"title\";s:119:\"{\"ar\": \"التركيب الميداني ورفع الهياكل الثقيلة\", \"en\": \"Site Erection & Heavy Rigging\"}\";s:4:\"slug\";s:27:\"site-erection-heavy-rigging\";s:11:\"description\";s:369:\"{\"ar\": \"تركيب ميداني متكامل بإشراف مهندسين متخصصين ورافعات ثقيلة مع الالتزام التام بأعلى معايير السلامة والصحة المهنية.\", \"en\": \"Turnkey on-site installation by certified erection engineers with precision surveying, heavy mobile cranes, and zero-incident safety protocols.\"}\";s:9:\"is_active\";i:1;s:10:\"created_at\";s:19:\"2026-11-09 21:34:26\";s:10:\"updated_at\";s:19:\"2026-11-09 21:34:26\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:3:{s:5:\"title\";s:5:\"array\";s:11:\"description\";s:5:\"array\";s:9:\"is_active\";s:7:\"boolean\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:1:{i:0;s:2:\"id\";}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:1:{i:0;s:2:\"id\";}}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}', 1794668620);

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `certificates`
--

CREATE TABLE `certificates` (
  `id` bigint UNSIGNED NOT NULL,
  `title_en` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title_ar` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description_en` text COLLATE utf8mb4_unicode_ci,
  `description_ar` text COLLATE utf8mb4_unicode_ci,
  `preview_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `issuance_date` date DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `sort_order` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `certificates`
--

INSERT INTO `certificates` (`id`, `title_en`, `title_ar`, `description_en`, `description_ar`, `preview_image`, `file_path`, `issuance_date`, `is_active`, `sort_order`, `created_at`, `updated_at`) VALUES
(1, 'test', 'تيست', 'df dfasdc 1sd1 w1', 'ينتبىينتىب سهنتى 1خه خ1ت908تس89تب خ1ؤ ا18', 'downloads/previews/test_1794567753.jpeg', 'downloads/files/test_1794567753.pdf', '2020-10-20', 1, 1, '2026-11-13 09:02:33', '2026-11-13 13:14:48'),
(2, 'test2', 'تيست2', 's af1 kdkfn onjn1 kmxlkn 11', 'سىشتنىؤ 12 12 ىنسنشي', 'downloads/previews/test2_1794567804.jpg', 'downloads/files/test2_1794567804.pdf', '2021-10-20', 1, 2, '2026-11-13 09:03:24', '2026-11-13 13:14:48');

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` bigint UNSIGNED NOT NULL,
  `iso2` char(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_id` bigint UNSIGNED NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `iso2`, `name`, `currency_id`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'EG', 'Egypt', 1, 1, '2026-11-09 19:33:24', '2026-11-09 19:33:24'),
(2, 'SA', 'Saudi Arabia', 2, 1, '2026-11-09 19:33:24', '2026-11-09 19:33:24');

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

CREATE TABLE `currencies` (
  `id` bigint UNSIGNED NOT NULL,
  `code` char(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  `symbol` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `currencies`
--

INSERT INTO `currencies` (`id`, `code`, `symbol`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'EGP', 'EGP', 1, '2026-11-09 19:33:24', '2026-11-09 19:33:24'),
(2, 'SAR', 'SAR', 1, '2026-11-09 19:33:24', '2026-11-09 19:33:24');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

CREATE TABLE `invoices` (
  `id` bigint UNSIGNED NOT NULL,
  `public_id` char(26) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quotation_id` bigint UNSIGNED NOT NULL,
  `invoice_number` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_amount` decimal(15,2) NOT NULL,
  `payment_status` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'unpaid',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_applications`
--

CREATE TABLE `job_applications` (
  `id` bigint UNSIGNED NOT NULL,
  `public_id` char(26) COLLATE utf8mb4_unicode_ci NOT NULL,
  `job_posting_id` bigint UNSIGNED NOT NULL,
  `applicant_name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(254) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rating` tinyint UNSIGNED DEFAULT '0',
  `status` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'new',
  `submitted_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `job_applications`
--

INSERT INTO `job_applications` (`id`, `public_id`, `job_posting_id`, `applicant_name`, `email`, `phone`, `rating`, `status`, `submitted_at`, `created_at`, `updated_at`) VALUES
(1, '01M713QR2J31PEKYFF57P985C5', 1, 'Eng. Mostafa Kamal', 'mostafa.kamal@example.com', '+20 102 334 5566', 5, 'interviewing', '2026-11-06 19:34:26', '2026-11-09 19:34:26', '2026-11-09 19:34:26'),
(2, '01M713QR2PESDT19C1FP40X6FA', 1, 'Eng. Youssef Nabil', 'youssef.n@example.com', '+20 114 778 9900', 4, 'reviewed', '2026-11-08 19:34:26', '2026-11-09 19:34:26', '2026-11-09 19:34:26');

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_postings`
--

CREATE TABLE `job_postings` (
  `id` bigint UNSIGNED NOT NULL,
  `public_id` char(26) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` json NOT NULL,
  `country_id` bigint UNSIGNED DEFAULT NULL,
  `description` json NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `job_postings`
--

INSERT INTO `job_postings` (`id`, `public_id`, `title`, `country_id`, `description`, `is_active`, `created_at`, `updated_at`) VALUES
(1, '01M713QQZ66HNNVY21FHPVFJRA', '{\"ar\": \"مهندس أول نمذجة وتفصيل إنشائي (Tekla Structures)\", \"en\": \"Senior Tekla Structural Detailer / Modeler\"}', 1, '{\"ar\": \"خبرة لا تقل عن 5 سنوات في النمذجة ثلاثية الأبعاد للمنشآت الفولاذية وتفاصيل الوصلات وإصدار المخططات التنفيذية.\", \"en\": \"Minimum 5+ years experience in 3D modeling of heavy industrial structural steel, connection details, and generating shop drawings.\"}', 1, '2026-11-09 19:34:26', '2026-11-09 19:34:26'),
(2, '01M713QQZAECG8ADE6XN7RD0PQ', '{\"ar\": \"مهندس موقع أول - تركيبات هياكل معدنية (الرياض والمنطقة الشرقية)\", \"en\": \"Lead Site Erection Engineer (Riyadh & Eastern Province)\"}', 2, '{\"ar\": \"الإشراف الميداني على تركيب الهياكل المعدنية وحسابات حمولة الرافعات واختبارات العزم وتطبيق معايير السلامة بالمملكة.\", \"en\": \"Hands-on supervision of heavy steel erection, crane rigging calculations, bolt torque verification, and site HSE protocols in KSA.\"}', 1, '2026-11-09 19:34:26', '2026-11-09 19:34:26'),
(3, '01M713QQZD4JMFZQGZBRRDG8EH', '{\"ar\": \"مهندس جودة وتفتيش لحام معتمد (CSWIP 3.1 / CWI)\", \"en\": \"Certified QA/QC Welding Inspector (CSWIP 3.1 / CWI)\"}', 1, '{\"ar\": \"مراقبة جودة اللحامات وإجراء الفحوصات غير الإتلافية ومتابعة اختبارات اللحامين وتجهيز وثائق تسليم الجودة.\", \"en\": \"Perform visual inspection, NDT witnessing (UT, MPI), welder performance qualifications, and documentation for client handover.\"}', 1, '2026-11-09 19:34:26', '2026-11-09 19:34:26');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2026_11_09_000001_add_deleted_at_to_quote_requests_table', 1),
(2, '2026_10_13_000001_create_projects_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint UNSIGNED NOT NULL,
  `public_id` char(26) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` json NOT NULL,
  `slug` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_path` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` json DEFAULT NULL,
  `specifications` json DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `public_id`, `title`, `slug`, `file_path`, `description`, `specifications`, `is_active`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '01M713QQXRXMQ5PP6ZF3WXEZV2', '{\"ar\": \"أعمدة وكمرات الهياكل الإنشائية الثقيلة\", \"en\": \"Heavy Structural Columns & Beams\"}', 'heavy-structural-columns-beams', NULL, '{\"ar\": \"هياكل فولاذية عالية المقاومة طبقا لمواصفات ASTM مخصصة للمصانع الكبرى والمستودعات والمباني متعددة الطوابق.\", \"en\": \"High-yield ASTM steel framing for industrial complexes, mega factories, and multi-story infrastructure.\"}', '{\"finish\": \"Hot-Dip Galvanized / Multi-Coat Epoxy\", \"steel_grade\": \"ASTM A36 / A992 / S355JR\", \"welding_code\": \"AWS D1.1 / EN 1090-2 EXC3\", \"yield_strength\": \"355 MPa min\"}', 1, '2026-11-09 19:34:26', '2026-11-09 19:34:26', NULL),
(2, '01M713QQXX8JHWC5K6JSQVK8MX', '{\"ar\": \"جمالونات الأسقف ذات البحور الواسعة\", \"en\": \"Clear-Span Roof Trusses\"}', 'clear-span-roof-trusses', NULL, '{\"ar\": \"جمالونات فولاذية واسعة البحر مصممة لتوفير مساحات تخزين ومستودعات خالية من الأعمدة الداخلية حتى 60 متراً.\", \"en\": \"Long-span structural trusses designed for column-free distribution warehouses and aircraft hangars up to 60 meters.\"}', '{\"finish\": \"Industrial Protective Polyurethane Coating\", \"span_range\": \"20m - 65m Clear Span\", \"steel_grade\": \"S275 / S355 Structural Hollow Sections\", \"deflection_limit\": \"L / 360 conforming to BS 5950\"}', 1, '2026-11-09 19:34:26', '2026-11-09 19:34:26', NULL),
(3, '01M713QQY2E4S47MA8N35FW7B5', '{\"ar\": \"كمرات الأوناش الملحومة والمسطحات الثقيلة\", \"en\": \"Built-Up Crane Girders & Plate Work\"}', 'built-up-crane-girders', NULL, '{\"ar\": \"كمرات صفائحية ملحومة آلياً مخصصة لمسارات الأوناش العلوية الثقيلة ذات التحمل العالي للأحمال الديناميكية.\", \"en\": \"Custom welded plate girders engineered for heavy industrial overhead cranes with high fatigue resistance.\"}', '{\"testing\": \"100% Ultrasonic & Magnetic Particle NDT\", \"capacity\": \"Supports Overhead Cranes up to 80 Metric Tons\", \"steel_grade\": \"High-Strength Heavy Plate ASTM A572 Gr. 50\", \"welding_process\": \"Automated Submerged Arc Welding (SAW)\"}', 1, '2026-11-09 19:34:26', '2026-11-09 19:34:26', NULL),
(4, '01M713QQY8376NS60BMHJ1WKEX', '{\"ar\": \"المباني الفولاذية سابقة الهندسة (PEB)\", \"en\": \"Pre-Engineered Steel Buildings (PEB)\"}', 'pre-engineered-steel-buildings', NULL, '{\"ar\": \"أنظمة إطارات صلبة متطورة مع ألواح تكسية عازلة (ساندوتش بانل) للتركيب السريع في المشاريع الصناعية والتجارية.\", \"en\": \"Optimized rigid frame steel systems with insulated sandwich panel claddings for rapid commercial deployment.\"}', '{\"cladding\": \"PIR Fire-Rated Insulated Sandwich Panels\", \"primary_framing\": \"Tapered Built-Up I-Sections\", \"secondary_framing\": \"Cold-Formed Galvanized Z & C Purlins\", \"wind_speed_design\": \"Up to 160 km/h regional codes\"}', 1, '2026-11-09 19:34:26', '2026-11-09 19:34:26', NULL),
(9, '01M7B7A5YJS4RVJK7AA17ADX26', '{\"ar\": \"تيست\", \"en\": \"test\"}', 'testing', NULL, '{\"ar\": \"سمنشيسشمين ست يشينتشسي حخشسيكم\", \"en\": \"askjdl aksjd12 ksjdalkjsd\"}', '[]', 1, '2026-11-13 17:49:20', '2026-11-13 17:49:20', NULL),
(10, '01M7B86YCT12VR1NDTVY7HA99G', '{\"ar\": \"تيست\", \"en\": \"test\"}', 'testfarid', NULL, '{\"ar\": \"سمنيشتسمينش كي 2منتمنشست ين\", \"en\": \"sdkjas dalkd skjskjasd\"}', '[]', 1, '2026-11-13 18:05:03', '2026-11-13 18:05:03', NULL),
(11, '01M7D41XTE45NSDC7X3WV3T225', '{\"ar\": \"بحر\", \"en\": \"sea\"}', 'sea', NULL, '{\"ar\": \"سشب سشب شس يبص يشسيب 24124 سشي شي\", \"en\": \"sadsd 12 sc1 sg1 vd1  fvv\"}', '[]', 1, '2026-11-14 11:30:53', '2026-11-14 11:30:53', NULL),
(12, '01M7D5WK0FXMRHQM3HMMMDJ35H', '{\"ar\": \"مثلا\", \"en\": \"mslan\"}', 'mslan', 'uploads/products/files/mslan-datasheet-1794664996.pdf', '{\"ar\": \"سشي س يبش سبشبشس ب2شبس 2\", \"en\": \"sad as da 2sa dfa\"}', '[]', 1, '2026-11-14 12:02:55', '2026-11-14 12:03:16', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product_attributes`
--

CREATE TABLE `product_attributes` (
  `id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `name_en` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_ar` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value_en` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value_ar` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sort_order` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_attributes`
--

INSERT INTO `product_attributes` (`id`, `product_id`, `name_en`, `name_ar`, `value_en`, `value_ar`, `sort_order`, `created_at`, `updated_at`) VALUES
(7, 9, 'space', 'مساحه', '500', '500', 1, '2026-11-13 17:49:20', '2026-11-13 17:49:20'),
(8, 9, 'space test', 'مساحه تيست', '200', '200', 2, '2026-11-13 17:49:20', '2026-11-13 17:49:20'),
(9, 9, 'length', 'مسافه', '100', '100', 3, '2026-11-13 17:49:20', '2026-11-13 17:49:20'),
(13, 10, 'space', 'مساحه', '500', '500', 1, '2026-11-13 18:06:07', '2026-11-13 18:06:07'),
(14, 10, 'space test', 'مساحه تيست', '200', '200', 2, '2026-11-13 18:06:07', '2026-11-13 18:06:07'),
(15, 10, 'length', 'مسافه', '150', '150', 3, '2026-11-13 18:06:08', '2026-11-13 18:06:08'),
(16, 11, 'sea', 'بحر', '700', '700', 1, '2026-11-14 11:30:53', '2026-11-14 11:30:53'),
(17, 11, 'length', 'مسافه', '1000', '1000', 2, '2026-11-14 11:30:53', '2026-11-14 11:30:53'),
(19, 12, 'length', 'مسافه', '100', '700', 1, '2026-11-14 12:03:16', '2026-11-14 12:03:16');

-- --------------------------------------------------------

--
-- Table structure for table `product_images`
--

CREATE TABLE `product_images` (
  `id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `image_path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sort_order` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_images`
--

INSERT INTO `product_images` (`id`, `product_id`, `image_path`, `sort_order`, `created_at`, `updated_at`) VALUES
(1, 11, 'uploads/products/sea_1794663053_6af8628d35916.jpg', 1, '2026-11-14 11:30:53', '2026-11-14 11:30:53'),
(2, 11, 'uploads/products/sea_1794663053_6af8628d37023.jpeg', 2, '2026-11-14 11:30:53', '2026-11-14 11:30:53'),
(3, 11, 'uploads/products/sea_1794663053_6af8628d38a28.jpg', 3, '2026-11-14 11:30:53', '2026-11-14 11:30:53'),
(4, 12, 'uploads/products/mslan_1794664975_6af86a0f607db.jpg', 1, '2026-11-14 12:02:55', '2026-11-14 12:02:55'),
(5, 12, 'uploads/products/mslan_1794664975_6af86a0f617d4.jpeg', 2, '2026-11-14 12:02:55', '2026-11-14 12:02:55'),
(6, 12, 'uploads/products/mslan_1794664975_6af86a0f62a40.jpg', 3, '2026-11-14 12:02:55', '2026-11-14 12:02:55');

-- --------------------------------------------------------

--
-- Table structure for table `projects`
--

CREATE TABLE `projects` (
  `id` bigint UNSIGNED NOT NULL,
  `public_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` json NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `client_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` json NOT NULL,
  `image_path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `completed_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `projects`
--

INSERT INTO `projects` (`id`, `public_id`, `title`, `slug`, `category`, `client_name`, `description`, `image_path`, `is_active`, `completed_at`, `created_at`, `updated_at`) VALUES
(1, '01M713QR24F236096B1BDQ6QVN', '{\"ar\": \"مركز لوجستيات الزامل\", \"en\": \"Al-Zamil Logistics Hub\"}', 'al-zamil-logistics-hub', 'industrial', 'Al-Zamil Group', '{\"ar\": \"مستودع صلب ثقيل بمساحة 10,000 متر مربع مصمم لتحمل الرياح العالية في جدة\", \"en\": \"10,000 sqm heavy steel warehouse facility engineered with high wind-load tolerance in Jeddah, KSA\"}', 'https://images.unsplash.com/photo-1589939705384-5185137a7f0f?auto=format&fit=crop&w=800&q=80', 1, '2026-09-09 18:34:26', '2026-11-09 19:34:26', '2026-11-09 19:34:26'),
(2, '01M713QR24F236096B1BDQ6QVP', '{\"ar\": \"برج القاهرة التنفيذي\", \"en\": \"Cairo Executive Tower\"}', 'cairo-executive-tower', 'commercial', 'Cairo Developments', '{\"ar\": \"ميزانين إنشائي داخلي معقد وإطار صلب Architectural للمقر الرئيسي\", \"en\": \"Complex internal structural mezzanine and architectural steel framing for multi-story headquarters\"}', 'https://images.unsplash.com/photo-1541888087401-443b35f60641?auto=format&fit=crop&w=800&q=80', 1, '2026-10-09 18:34:26', '2026-11-09 19:34:26', '2026-11-09 19:34:26'),
(3, '01M713QR24F236096B1BDQ6QVQ', '{\"ar\": \"كمرات الكباري والطرُق\", \"en\": \"Highway Flyover Beams\"}', 'highway-flyover-beams', 'infra', 'Ministry of Transport', '{\"ar\": \"تصنيع وتصفيح الكمرات اللوحية الثقيلة للبنية التحتية الحيوية للنقل\", \"en\": \"Heavy plate girder fabrication and galvanizing for critical transport infrastructure\"}', 'https://images.unsplash.com/photo-1504917595217-d4dc5ebe6122?auto=format&fit=crop&w=800&q=80', 1, '2026-11-02 19:34:26', '2026-11-09 19:34:26', '2026-11-09 19:34:26');

-- --------------------------------------------------------

--
-- Table structure for table `quotations`
--

CREATE TABLE `quotations` (
  `id` bigint UNSIGNED NOT NULL,
  `public_id` char(26) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quote_request_id` bigint UNSIGNED NOT NULL,
  `admin_user_id` bigint UNSIGNED NOT NULL,
  `currency_id` bigint UNSIGNED NOT NULL,
  `factory_cost` decimal(15,2) NOT NULL DEFAULT '0.00',
  `selling_price` decimal(15,2) NOT NULL DEFAULT '0.00',
  `profit_amount` decimal(15,2) GENERATED ALWAYS AS ((`selling_price` - `factory_cost`)) STORED,
  `status` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'sent_to_client',
  `admin_notes` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `quotations`
--

INSERT INTO `quotations` (`id`, `public_id`, `quote_request_id`, `admin_user_id`, `currency_id`, `factory_cost`, `selling_price`, `status`, `admin_notes`, `created_at`, `updated_at`) VALUES
(1, '01M713QQZP1AX29NAC6RQMTFY4', 1, 1, 1, 38000000.00, 49500000.00, 'accepted', 'Costing breakdown calculated via internal fabrication rate matrix.', '2026-08-09 18:34:26', '2026-11-09 19:34:26'),
(2, '01M713QR11HGT0TR6HT266XXV5', 2, 1, 2, 6200000.00, 8400000.00, 'accepted', 'Costing breakdown calculated via internal fabrication rate matrix.', '2026-09-09 18:34:26', '2026-11-09 19:34:26'),
(3, '01M713QR1FDFNXEPWR2G96H8Z8', 3, 1, 1, 24500000.00, 32000000.00, 'sent_to_client', 'Costing breakdown calculated via internal fabrication rate matrix.', '2026-10-09 18:34:26', '2026-11-09 19:34:26'),
(4, '01M713QR1R15EW39HZ158QNTDN', 4, 1, 2, 3100000.00, 4200000.00, 'sent_to_client', 'Costing breakdown calculated via internal fabrication rate matrix.', '2026-10-30 19:34:26', '2026-11-09 19:34:26');

-- --------------------------------------------------------

--
-- Table structure for table `quote_requests`
--

CREATE TABLE `quote_requests` (
  `id` bigint UNSIGNED NOT NULL,
  `public_id` char(26) COLLATE utf8mb4_unicode_ci NOT NULL,
  `client_name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_name` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(254) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country_id` bigint UNSIGNED DEFAULT NULL,
  `service_id` bigint UNSIGNED DEFAULT NULL,
  `product_id` bigint UNSIGNED DEFAULT NULL,
  `client_message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'new',
  `submitted_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `quote_requests`
--

INSERT INTO `quote_requests` (`id`, `public_id`, `client_name`, `company_name`, `email`, `phone`, `country_id`, `service_id`, `product_id`, `client_message`, `status`, `submitted_at`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '01M713QQZJJ51YGEDTFE2QFPNG', 'Eng. Khaled El-Sayed', 'Arab Contractors JV', 'k.elsayed@arabcontractors.example.com', '+20 100 123 4567', 1, 1, 1, 'Requesting supply and erection of 850 tons of heavy structural steel columns and roof trusses for Suez warehouse.', 'accepted', '2026-08-09 18:34:26', '2026-08-09 18:34:26', '2026-11-09 19:34:26', NULL),
(2, '01M713QR0WZCVD2JC5TJXY20CN', 'Fahad Al-Otaibi', 'Red Sea Infrastructure Co.', 'fahad@redsea-infra.example.com', '+966 50 987 6543', 2, 1, 2, 'Fabrication and supply of 1,200 tons clear-span trusses for logistics park in Jeddah.', 'accepted', '2026-09-09 18:34:26', '2026-09-09 18:34:26', '2026-11-09 19:34:26', NULL),
(3, '01M713QR1CREMRD25ME3G5ATJY', 'Eng. Ahmed Zaki', 'Orascom Construction', 'a.zaki@orascom.example.com', '+20 122 345 6789', 1, 1, 1, 'Built-up crane girders for Ain Sokhna rolling mill expansion.', 'quoted', '2026-10-09 18:34:26', '2026-10-09 18:34:26', '2026-11-09 19:34:26', NULL),
(4, '01M713QR1N3K9GTS264JQCV7KR', 'Sultan Al-Ghamdi', 'Nesma & Partners', 'sultan.g@nesma.example.com', '+966 55 432 1098', 2, 1, 2, 'Supply and galvanizing for 650 tons industrial steel structures near Riyadh.', 'reviewing', '2026-10-30 19:34:26', '2026-10-30 19:34:26', '2026-11-09 19:34:26', NULL),
(5, '01M713QR1Z22NP2GR1TDMAAQVY', 'Dr. Mahmoud Radwan', 'Hassan Allam Holding', 'm.radwan@hassanallam.example.com', '+20 111 888 9999', 1, 1, 1, 'Inquiry for high-yield ASTM A992 structural columns for data center in New Capital.', 'new', '2026-11-07 19:34:26', '2026-11-07 19:34:26', '2026-11-09 19:34:26', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `id` bigint UNSIGNED NOT NULL,
  `public_id` char(26) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` json NOT NULL,
  `slug` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` json DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`id`, `public_id`, `title`, `slug`, `description`, `is_active`, `created_at`, `updated_at`) VALUES
(1, '01M713QQVB8P9030T0J7JZSECG', '{\"ar\": \"التصميم الهندسي والنمذجة ثلاثية الأبعاد (Tekla & BIM)\", \"en\": \"Tekla 3D Detailing & Structural Engineering\"}', 'engineering-tekla-bim', '{\"ar\": \"تصميم المنشآت المعدنية الشامل وهندسة الوصلات وتفصيل نماذج تكلا ثلاثية الأبعاد وفقاً للمواصفات الأمريكية والأوروبية.\", \"en\": \"Complete structural steel design, connection engineering, and Tekla Structures 3D detailing conforming to AISC and Eurocodes.\"}', 1, '2026-11-09 19:34:26', '2026-11-09 19:34:26'),
(2, '01M713QQX3VE0NGCFQ9GEKMFMH', '{\"ar\": \"تصنيع المنشآت والهياكل الفولاذية الثقيلة\", \"en\": \"Heavy Structural Steel Fabrication\"}', 'heavy-steel-fabrication', '{\"ar\": \"قص وتخريم آلي باستخدام CNC واللحام الآلي بالقوس المغمور وتجميع الأعمدة والكمرات الفولاذية الضخمة بأعلى معايير الدقة.\", \"en\": \"Automated cutting, CNC drilling, submerged arc welding, and assembly of heavy columns, girders, and complex structural members.\"}', 1, '2026-11-09 19:34:26', '2026-11-09 19:34:26'),
(3, '01M713QQXAM3G442WC91GCQ9SH', '{\"ar\": \"معالجة الأسطح والجلفنة على الساخن\", \"en\": \"Surface Blasting & Hot-Dip Galvanizing\"}', 'surface-treatment-galvanizing', '{\"ar\": \"سفح الرمال الميكانيكي بدرجة SA 2.5، وتطبيق دهانات الإيبوكسي والبولي يوريثان، والجلفنة بالغمس الساخن المعتمدة دولياً.\", \"en\": \"SA 2.5 abrasive shot blasting, multi-coat epoxy primer and polyurethane coating, and ISO 1461 hot-dip galvanizing.\"}', 1, '2026-11-09 19:34:26', '2026-11-09 19:34:26'),
(4, '01M713QQXHH65G3QX50JM0GCTD', '{\"ar\": \"التركيب الميداني ورفع الهياكل الثقيلة\", \"en\": \"Site Erection & Heavy Rigging\"}', 'site-erection-heavy-rigging', '{\"ar\": \"تركيب ميداني متكامل بإشراف مهندسين متخصصين ورافعات ثقيلة مع الالتزام التام بأعلى معايير السلامة والصحة المهنية.\", \"en\": \"Turnkey on-site installation by certified erection engineers with precision surveying, heavy mobile cranes, and zero-incident safety protocols.\"}', 1, '2026-11-09 19:34:26', '2026-11-09 19:34:26');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('2ynTSCczY8AVILj4ajTSGR6lcU3iTmVgfMDPao0S', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/157.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiSmR0cnZwNlc1UUN1T0NOWjUya3lyZ3B4aWJ6MERCMlRrd1JRM2lZViI7czo2OiJsb2NhbGUiO3M6MjoiZW4iO3M6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjE3OiJodHRwczovL2JldGEudGVzdCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1794661407),
('7oQYxjNm5lgcBxGAK5HYMfmZu1qME0vbsF66DbrC', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/157.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiNktnZVhFaTJuRmM2b0N0MXhLeFRKS1VhY09ZbGtzdmtTMmlsMXFhZiI7czo2OiJsb2NhbGUiO3M6MjoiZW4iO3M6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjMyOiJodHRwczovL2JldGEudGVzdC9wcm9kdWN0cy9tc2xhbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE7fQ==', 1794666442),
('boDVzlAUJi49odHq6rAh3kutgaKW3Iv2YbI401vq', NULL, '127.0.0.1', 'Symfony', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiQTR1ZDZmVWUxdzhId25IRHJ0MGNrZUNtejduQ0RTNkJRUlZQSXJYVSI7czo2OiJsb2NhbGUiO3M6MjoiYXIiO3M6MTk6InNlbGVjdGVkX3Byb2R1Y3RfaWQiO2k6MTtzOjY6Il9mbGFzaCI7YToyOntzOjM6Im5ldyI7YTowOnt9czozOiJvbGQiO2E6MTp7aTowO3M6MTk6InNlbGVjdGVkX3Byb2R1Y3RfaWQiO319fQ==', 1794664435),
('CAhIBpNIBGE87gKQn3yLqeulQiMZSShP7rNyWX8d', NULL, '127.0.0.1', 'Symfony', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoib1d5Q0dYU3loZUc1Y01xNm51RkcxS3FWVHhIcDJxVWVoeHJEeUZtRyI7czo2OiJsb2NhbGUiO3M6MjoiYXIiO3M6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjcwOiJodHRwOi8vbG9jYWxob3N0L3Byb2R1Y3RzL2hlYXZ5LXN0cnVjdHVyYWwtY29sdW1ucy1iZWFtcy9kb3dubG9hZC1maWxlIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1794664451),
('cBDoxpFrSAZGrmaMRnLWeDt2rcrvUepVV0rHqWxX', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/157.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiaWZTbVQ3Nm5qdXlJQzBGWDZCczVCR2dWd2RjWmFjOVlXTHM2SVh1UiI7czo2OiJsb2NhbGUiO3M6MjoiYXIiO3M6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjE4OiJodHRwczovL2JldGFhLnRlc3QiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1794666806),
('jkBOu4iIloz4TEXGUIRBHl6uQNzmioznp10TvUB7', NULL, '127.0.0.1', 'Symfony', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiRmpudFYxTUVjYUFKSXRsWDVNTzlVSHl1aVc2c0VjU244cGNaMFZReCI7czo2OiJsb2NhbGUiO3M6MjoiYXIiO3M6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjcwOiJodHRwOi8vbG9jYWxob3N0L3Byb2R1Y3RzL2hlYXZ5LXN0cnVjdHVyYWwtY29sdW1ucy1iZWFtcy9kb3dubG9hZC1maWxlIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1794664466),
('leETORaQuhc79fbdgdE3CHkc72mI6862I6ZOSEb4', NULL, '127.0.0.1', 'Symfony', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiSXgzY2dDb1lvWE95V2t1a3BGaHVYUjdSTmV0MzhJd0xJZmY1M1JOdyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1794664415),
('TpNjSh6LcqNrH8GhPsopnrgrghVFrPBw0SRiqvaV', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/157.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoicTlLY1pTejhRcUV4NmF0cVE2aE5LcGxNODY1TWROZDN3RGJacElNRyI7czo2OiJsb2NhbGUiO3M6MjoiZW4iO3M6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjE4OiJodHRwczovL2JldGFhLnRlc3QiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1794666813);

-- --------------------------------------------------------

--
-- Table structure for table `technical_downloads`
--

CREATE TABLE `technical_downloads` (
  `id` bigint UNSIGNED NOT NULL,
  `title_en` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title_ar` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description_en` text COLLATE utf8mb4_unicode_ci,
  `description_ar` text COLLATE utf8mb4_unicode_ci,
  `preview_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `issuance_date` date DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `sort_order` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `technical_downloads`
--

INSERT INTO `technical_downloads` (`id`, `title_en`, `title_ar`, `description_en`, `description_ar`, `preview_image`, `file_path`, `issuance_date`, `is_active`, `sort_order`, `created_at`, `updated_at`) VALUES
(1, 'test', 'تيست', 'asdasd as dascaf sfd asd w asd a21 2xac 1 cs1', 'شي شسب شسؤ 1 سؤ1صي س 1 يل ق لىى2 ث', 'downloads/previews/test_1794566693.png', 'downloads/files/test_1794566693.pdf', '2020-01-01', 1, 10, '2026-11-13 08:44:53', '2026-11-13 08:44:53');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `public_id` char(26) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(160) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(254) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'sales',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `public_id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `role`, `is_active`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '01M713QQ9Z1MMDHPW2GS553N4E', 'Super Admin', 'admin@beta.com', NULL, '$2y$12$aZhmXsWzSt0fdEfI1r46GOWIcfWPHFwLiGIJH3mJLGTe/ikAwk2/q', NULL, 'super_admin', 1, '2026-11-09 19:34:25', '2026-11-09 19:34:25', NULL),
(2, '01M713QQKTTD77NS84N5Y7PSKQ', 'Tarek Mansour (Sales Director)', 'sales@beta-industrial.com', NULL, '$2y$12$QXUTOB2S4lznxnqgLtIcdOJcAKA/2hoa2DqKg5VN5.TL4y4Pw8Pdy', NULL, 'sales', 1, '2026-11-09 19:34:26', '2026-11-09 19:34:26', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `announcements`
--
ALTER TABLE `announcements`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `public_id` (`public_id`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- Indexes for table `attachments`
--
ALTER TABLE `attachments`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `public_id` (`public_id`),
  ADD KEY `idx_attachments_polymorphic` (`attachable_type`,`attachable_id`);

--
-- Indexes for table `audit_logs`
--
ALTER TABLE `audit_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_audit_logs_actor` (`actor_user_id`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `certificates`
--
ALTER TABLE `certificates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `iso2` (`iso2`),
  ADD KEY `fk_countries_currency` (`currency_id`);

--
-- Indexes for table `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uuid` (`uuid`);

--
-- Indexes for table `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `public_id` (`public_id`),
  ADD UNIQUE KEY `invoice_number` (`invoice_number`),
  ADD KEY `fk_invoices_quotation` (`quotation_id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_applications`
--
ALTER TABLE `job_applications`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `public_id` (`public_id`),
  ADD KEY `fk_applications_job` (`job_posting_id`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `job_postings`
--
ALTER TABLE `job_postings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `public_id` (`public_id`),
  ADD KEY `fk_job_postings_country` (`country_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `token` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `public_id` (`public_id`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- Indexes for table `product_attributes`
--
ALTER TABLE `product_attributes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_attributes_product_id_index` (`product_id`);

--
-- Indexes for table `product_images`
--
ALTER TABLE `product_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_images_product_id_index` (`product_id`);

--
-- Indexes for table `projects`
--
ALTER TABLE `projects`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `projects_public_id_unique` (`public_id`),
  ADD UNIQUE KEY `projects_slug_unique` (`slug`);

--
-- Indexes for table `quotations`
--
ALTER TABLE `quotations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `public_id` (`public_id`),
  ADD KEY `fk_quotations_request` (`quote_request_id`),
  ADD KEY `fk_quotations_admin` (`admin_user_id`),
  ADD KEY `fk_quotations_currency` (`currency_id`);

--
-- Indexes for table `quote_requests`
--
ALTER TABLE `quote_requests`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `public_id` (`public_id`),
  ADD KEY `fk_quote_requests_country` (`country_id`),
  ADD KEY `fk_quote_requests_service` (`service_id`),
  ADD KEY `fk_quote_requests_product` (`product_id`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `public_id` (`public_id`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `technical_downloads`
--
ALTER TABLE `technical_downloads`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `public_id` (`public_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `announcements`
--
ALTER TABLE `announcements`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `attachments`
--
ALTER TABLE `attachments`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `audit_logs`
--
ALTER TABLE `audit_logs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `certificates`
--
ALTER TABLE `certificates`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `invoices`
--
ALTER TABLE `invoices`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `job_applications`
--
ALTER TABLE `job_applications`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `job_postings`
--
ALTER TABLE `job_postings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `product_attributes`
--
ALTER TABLE `product_attributes`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `product_images`
--
ALTER TABLE `product_images`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `projects`
--
ALTER TABLE `projects`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `quotations`
--
ALTER TABLE `quotations`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `quote_requests`
--
ALTER TABLE `quote_requests`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `technical_downloads`
--
ALTER TABLE `technical_downloads`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `audit_logs`
--
ALTER TABLE `audit_logs`
  ADD CONSTRAINT `fk_audit_logs_actor` FOREIGN KEY (`actor_user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `countries`
--
ALTER TABLE `countries`
  ADD CONSTRAINT `fk_countries_currency` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`) ON DELETE RESTRICT;

--
-- Constraints for table `invoices`
--
ALTER TABLE `invoices`
  ADD CONSTRAINT `fk_invoices_quotation` FOREIGN KEY (`quotation_id`) REFERENCES `quotations` (`id`) ON DELETE RESTRICT;

--
-- Constraints for table `job_applications`
--
ALTER TABLE `job_applications`
  ADD CONSTRAINT `fk_applications_job` FOREIGN KEY (`job_posting_id`) REFERENCES `job_postings` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `job_postings`
--
ALTER TABLE `job_postings`
  ADD CONSTRAINT `fk_job_postings_country` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `product_attributes`
--
ALTER TABLE `product_attributes`
  ADD CONSTRAINT `product_attributes_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_images`
--
ALTER TABLE `product_images`
  ADD CONSTRAINT `product_images_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `quotations`
--
ALTER TABLE `quotations`
  ADD CONSTRAINT `fk_quotations_admin` FOREIGN KEY (`admin_user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT,
  ADD CONSTRAINT `fk_quotations_currency` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`) ON DELETE RESTRICT,
  ADD CONSTRAINT `fk_quotations_request` FOREIGN KEY (`quote_request_id`) REFERENCES `quote_requests` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `quote_requests`
--
ALTER TABLE `quote_requests`
  ADD CONSTRAINT `fk_quote_requests_country` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_quote_requests_product` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_quote_requests_service` FOREIGN KEY (`service_id`) REFERENCES `services` (`id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
