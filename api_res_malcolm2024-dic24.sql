-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:8889
-- Tiempo de generación: 25-12-2023 a las 02:14:09
-- Versión del servidor: 5.7.34
-- Versión de PHP: 8.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `api_res_malcolm2024`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `blogs`
--

CREATE TABLE `blogs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `isFeatured` tinyint(1) DEFAULT '0',
  `popup` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `youtubeurl` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `imagen` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `status` enum('PUBLISHED','PENDING','REJECTED') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'PENDING',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `blogs`
--

INSERT INTO `blogs` (`id`, `title`, `description`, `slug`, `isFeatured`, `popup`, `url`, `youtubeurl`, `imagen`, `user_id`, `category_id`, `status`, `created_at`, `updated_at`) VALUES
(2, 'prueba actualizado', '<p>Hello World!</p>', 'prueba-actualizado', 1, 'prueba-post', 'null', 'null', 'blogs/5pG2dss7xy23VdRIDtHsLAd2wm0gBpEj4WOg7yMX.jpg', 1, 15, 'PUBLISHED', '2023-11-19 23:50:29', '2023-11-24 22:22:20'),
(3, 'blog 2', '<p>Hello World!</p>', 'blog-2', 0, 'blgo-ds', 'null', 'null', 'blogs/sf4JrKjmAjPr3EJMlO9OysaGrCp0OpqCKjZ9Chk7.jpg', 1, 1, 'PUBLISHED', '2023-11-24 22:45:13', '2023-11-24 22:45:27');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carts`
--

CREATE TABLE `carts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `course_id` bigint(20) UNSIGNED DEFAULT NULL,
  `product_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `type_discount` tinyint(1) DEFAULT NULL COMMENT '1:% 2:monto',
  `discount` double DEFAULT NULL,
  `type_campaing` tinyint(1) DEFAULT NULL COMMENT '1:c normal, 2:flash, 3:banner,',
  `code_cupon` varchar(155) DEFAULT NULL,
  `code_discount` varchar(150) DEFAULT NULL,
  `precio_unitario` double DEFAULT NULL,
  `total` double DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `carts`
--

INSERT INTO `carts` (`id`, `course_id`, `product_id`, `user_id`, `type_discount`, `discount`, `type_campaing`, `code_cupon`, `code_discount`, `precio_unitario`, `total`, `created_at`, `updated_at`) VALUES
(2, 5, NULL, 1, NULL, NULL, NULL, NULL, NULL, 20, 20, '2023-12-24 04:10:36', '2023-12-24 04:10:36');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('PUBLISHED','PENDING') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'PENDING',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id`, `name`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Blog', 'PENDING', '2023-10-09 07:45:33', '2023-10-09 07:54:14'),
(2, 'Diseño Gráfico', 'PUBLISHED', '2023-10-09 07:53:22', '2023-11-19 07:15:12'),
(3, 'Web Design', 'PUBLISHED', '2023-10-09 07:53:31', '2023-10-09 07:54:24'),
(4, 'Movil Design', 'PENDING', '2023-10-09 07:53:41', '2023-10-09 07:53:41'),
(5, 'Desarrollo Web', 'PENDING', '2023-10-09 07:53:59', '2023-11-18 02:29:53'),
(6, 'Desarrollo Movil', 'PENDING', '2023-10-09 07:54:08', '2023-11-19 02:03:40'),
(7, 'Producción Audio Visual', 'PENDING', '2023-10-09 07:54:36', '2023-11-19 01:46:32'),
(8, 'Redes Sociales', 'PENDING', '2023-10-09 07:55:02', '2023-11-19 01:46:29'),
(9, 'Diseño y Desarrollo Web', 'PUBLISHED', '2023-10-09 18:56:31', '2023-11-18 22:59:49'),
(11, 'Landing Page', 'PUBLISHED', '2023-11-19 00:20:34', '2023-11-19 00:20:34'),
(12, 'Diseño y desarrollo Full Stack', 'PUBLISHED', '2023-11-19 02:45:26', '2023-11-19 04:28:08');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria_ventas`
--

CREATE TABLE `categoria_ventas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(150) DEFAULT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `course_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `categoria_ventas`
--

INSERT INTO `categoria_ventas` (`id`, `name`, `product_id`, `course_id`, `created_at`, `updated_at`) VALUES
(1, 'Phisical Godness', 0, 0, NULL, NULL),
(2, 'Digital Godness', 0, 0, NULL, NULL),
(3, 'Service Godness', 0, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `nombre` varchar(250) DEFAULT NULL,
  `imagen` varchar(250) DEFAULT NULL,
  `state` tinyint(1) UNSIGNED NOT NULL DEFAULT '1' COMMENT '1:activo 2:inactivo',
  `category_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `categories`
--

INSERT INTO `categories` (`id`, `created_at`, `updated_at`, `deleted_at`, `nombre`, `imagen`, `state`, `category_id`) VALUES
(1, '2023-10-15 22:55:10', '2023-12-20 03:29:23', NULL, 'Web Design', 'categories/rWczwpkCcmdwOcx0dvLRwViz2ZiIkblWPOOlWebk.png', 1, NULL),
(2, '2023-10-15 22:55:35', '2023-10-15 22:55:35', NULL, 'Diseño', 'categories/veCfCPRDZ3mxQiCqggvvlYMG3CJVVZDnLQ9bIKuz.png', 1, NULL),
(3, '2023-10-15 22:55:58', '2023-10-15 22:55:58', NULL, 'Sevidores', 'categories/SwVZjDLc5Jtj6Ok4j9HGNdEaHngU9HDwdviZu81Z.png', 1, NULL),
(4, '2023-10-15 22:56:26', '2023-10-15 22:56:26', NULL, 'Frontend Development', NULL, 1, 1),
(5, '2023-10-15 22:57:00', '2023-10-15 22:57:00', NULL, 'UX/UI', NULL, 1, 1),
(6, '2023-10-15 22:57:16', '2023-10-15 22:57:16', NULL, 'VPS', NULL, 1, 3),
(7, '2023-10-15 22:57:38', '2023-10-15 22:57:38', NULL, 'Flyers', NULL, 1, 2),
(8, '2023-10-25 19:34:42', '2023-10-25 19:34:42', NULL, 'Personal Development', 'categories/LTST7aBMTiukv50KteQhg2Scj1bgR5BVFHEcV56H.png', 1, NULL),
(9, '2023-10-25 19:35:14', '2023-10-25 19:35:14', NULL, 'Idiomas', NULL, 1, 8),
(10, '2023-10-25 19:35:39', '2023-10-25 19:35:39', NULL, 'Con las manos', NULL, 1, 8),
(11, '2023-10-25 19:36:20', '2023-10-25 19:36:20', NULL, 'Movil', 'categories/zahasH5sGgUNRm0G4ndiVLdKqfhjyqBifgCKeEdH.png', 1, NULL),
(12, '2023-10-25 19:36:42', '2023-10-25 19:36:42', NULL, 'Desarrollo de Apps', NULL, 1, 11),
(13, '2023-10-25 19:37:03', '2023-10-25 19:37:03', NULL, 'Reparación de Telefonos', NULL, 1, 11),
(14, '2023-10-25 19:37:25', '2023-10-25 19:37:25', NULL, 'Accesorios para tu movil', NULL, 1, 11),
(15, '2023-10-25 19:38:12', '2023-10-25 19:38:12', NULL, 'Marketing', 'categories/da7k9ehGjFHLBVnUnS5K1ohknsIdGoV6Nf9uIgKS.png', 1, NULL),
(16, '2023-10-25 19:41:17', '2023-10-25 19:41:17', NULL, 'Ventas', NULL, 1, 15),
(17, '2023-10-25 19:41:32', '2023-10-25 19:41:32', NULL, 'Redes Sociales', NULL, 1, 15),
(18, '2023-10-25 19:43:14', '2023-10-25 19:43:14', NULL, 'Finanzas', NULL, 1, 8),
(19, '2023-10-25 19:46:42', '2023-10-25 19:46:42', NULL, 'Redes Sociales', NULL, 1, 2),
(20, '2023-10-25 19:47:00', '2023-10-25 19:47:00', NULL, 'Publicidad', NULL, 1, 2),
(21, '2023-10-25 19:47:13', '2023-10-25 19:47:13', NULL, 'Para video', NULL, 1, 2),
(22, '2023-10-25 19:47:28', '2023-10-25 19:47:28', NULL, 'Diseño 3D', NULL, 1, 2),
(32, '2023-12-20 04:02:25', '2023-12-20 05:21:22', '2023-12-20 05:21:22', 'Alimentos y Bebidas', 'categories/2P4UryxQGOmhJjil0kDay8IQ9PmkdCiSsaXLGHzD.jpg', 1, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `category_products`
--

CREATE TABLE `category_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `nombre` varchar(250) DEFAULT NULL,
  `imagen` varchar(250) DEFAULT NULL,
  `state` tinyint(1) UNSIGNED NOT NULL DEFAULT '1' COMMENT '1:activo 2:inactivo',
  `category_product_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `category_products`
--

INSERT INTO `category_products` (`id`, `created_at`, `updated_at`, `deleted_at`, `nombre`, `imagen`, `state`, `category_product_id`) VALUES
(1, '2023-12-20 04:11:03', '2023-12-20 04:11:03', NULL, 'Alimentos y Bebidas', 'categories_products/tAjmA0BIi9ox2d2BpynsZ8KnTEcxEFi3x3mkwmkn.jpg', 1, NULL),
(2, '2023-12-20 04:11:16', '2023-12-20 04:27:39', NULL, 'Ropa Femenina', 'categories_products/RWjeCaJ4pj4nbXJGskb25nQbUNy6P2Ot1Hzu8XPg.jpg', 1, NULL),
(3, '2023-12-20 04:22:21', '2023-12-20 04:22:21', NULL, 'Ropa Masculina', 'categories_products/aVsz57OQdfh8bjYC8D0pxC1uNXW8S3X2kKzsPTEE.jpg', 1, NULL),
(4, '2023-12-20 04:36:10', '2023-12-20 04:38:54', '2023-12-20 04:38:54', 'Ropa Interior', NULL, 1, NULL),
(5, '2023-12-20 04:36:28', '2023-12-20 04:37:00', NULL, 'Calzado', 'categories_products/1JiiOhTQmmgBw2Zydo5B6iEZxPbFEIgxbSlZQ501.jpg', 1, NULL),
(6, '2023-12-20 04:37:27', '2023-12-20 04:42:54', '2023-12-20 04:42:54', 'Calzado Deportivo', NULL, 1, NULL),
(7, '2023-12-20 04:39:17', '2023-12-20 04:39:39', '2023-12-20 04:39:39', 'Ropa Interior', NULL, 1, NULL),
(8, '2023-12-20 04:39:57', '2023-12-20 04:46:13', '2023-12-20 04:46:13', 'interior', NULL, 1, 3),
(9, '2023-12-20 04:46:29', '2023-12-20 04:46:29', NULL, 'Ropa interior', NULL, 1, 3),
(10, '2023-12-20 04:47:03', '2023-12-20 04:47:03', NULL, 'Camisas', NULL, 1, 3),
(11, '2023-12-20 04:47:25', '2023-12-20 04:47:25', NULL, 'Medicinas', 'categories_products/yL7B2v2s6nB0qQnanY1iSNtWIJRom8zzPMLyxa09.jpg', 1, NULL),
(12, '2023-12-20 04:47:38', '2023-12-20 04:47:38', NULL, 'Pastillas', NULL, 1, 11),
(13, '2023-12-20 04:47:56', '2023-12-20 04:47:56', NULL, 'Carnes', 'categories_products/g8XZodAIMHgBNJQDxyL10X6AcUqxTm9WnljYdYws.jpg', 1, NULL),
(14, '2023-12-20 04:48:09', '2023-12-20 04:48:09', NULL, 'Milanesas', NULL, 1, 13),
(15, '2023-12-20 04:49:11', '2023-12-20 04:49:11', NULL, 'Piezas', NULL, 1, 13),
(16, '2023-12-20 05:01:50', '2023-12-20 05:01:50', NULL, 'Frutas y Hortalizas', NULL, 1, 1),
(17, '2023-12-20 05:02:05', '2023-12-20 05:02:05', NULL, 'Bebidas', NULL, 1, 1),
(18, '2023-12-20 05:45:04', '2023-12-20 05:45:04', NULL, 'Ropa interior', NULL, 1, 2),
(19, '2023-12-20 05:50:07', '2023-12-20 05:50:07', NULL, 'Papeleria', 'categories_products/9iwOiBtoq8zGlrFwIKUwXSN9cQOOYrcGxHaDfV34.jpg', 1, NULL),
(20, '2023-12-20 05:50:23', '2023-12-20 05:50:23', NULL, 'Materiales Papel', NULL, 1, 19),
(21, '2023-12-20 05:55:29', '2023-12-20 05:55:29', NULL, 'Consolas', 'categories_products/ZctLKySikhCwh2dS27MLhuSKeTtdRyydHI4ujOUA.jpg', 1, NULL),
(22, '2023-12-20 05:55:45', '2023-12-20 05:55:45', NULL, 'Consolas Caseras', NULL, 1, 21),
(23, '2023-12-20 05:56:14', '2023-12-20 05:56:14', NULL, 'Video Juegos', NULL, 1, 21),
(24, '2023-12-20 05:56:26', '2023-12-20 05:56:26', NULL, 'Controles', NULL, 1, 21);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contacts`
--

CREATE TABLE `contacts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `whatsapp` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('PUBLISHED','PENDING') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `contacts`
--

INSERT INTO `contacts` (`id`, `name`, `lastname`, `phone`, `whatsapp`, `email`, `subject`, `comment`, `status`, `created_at`, `updated_at`) VALUES
(1, 'malcolm', 'cordova', '1234567890', '+584241874370', 'mercadocreativo@gmail.com', 'hola este es un tema', 'saddasdsjndajsndskajdaskjdsa', 'PENDING', '2023-11-20 04:00:58', '2023-11-20 04:00:58'),
(2, 'malcolm', 'cordova', '1234567890', NULL, 'mercadocreativo@gmail.com', 'hola este es un tema', 'saddasdsjndajsndskajdaskjdsa', 'PENDING', '2023-11-20 04:01:22', '2023-11-20 04:01:22'),
(3, 'malcolm', 'cordova', '1234567890', NULL, 'mercadocreativo@gmail.com', 'hola este es un tema', 'saddasdsjndajsndskajdaskjdsa', 'PENDING', '2023-11-20 04:01:45', '2023-11-20 04:01:45');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `coupons`
--

CREATE TABLE `coupons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(250) NOT NULL,
  `type_discount` tinyint(1) UNSIGNED NOT NULL DEFAULT '1' COMMENT '1 es porcentaje y 2 es por monto fijo',
  `discount` double NOT NULL DEFAULT '0',
  `type_count` tinyint(1) UNSIGNED NOT NULL DEFAULT '1' COMMENT '1 es ilimitado y 2 es limitado',
  `num_use` double DEFAULT NULL,
  `type_coupon` tinyint(1) UNSIGNED DEFAULT NULL COMMENT '1 es por curso y 2 es por categoria',
  `state` tinyint(1) UNSIGNED NOT NULL DEFAULT '1' COMMENT '1Activo, 2 Inactivo',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `coupons`
--

INSERT INTO `coupons` (`id`, `code`, `type_discount`, `discount`, `type_count`, `num_use`, `type_coupon`, `state`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'pruebnueva50', 1, 50, 1, 0, 1, 1, '2023-10-25 04:15:22', '2023-10-31 19:48:17', NULL),
(2, 'pruebnuevaC', 2, 30, 2, 100, 2, 1, '2023-10-25 04:16:21', '2023-10-25 04:16:21', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `coupon_categories`
--

CREATE TABLE `coupon_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `coupon_id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `coupon_categories`
--

INSERT INTO `coupon_categories` (`id`, `coupon_id`, `category_id`, `created_at`, `updated_at`) VALUES
(1, 2, 2, '2023-10-25 04:16:21', '2023-10-25 04:16:21'),
(2, 2, 1, '2023-10-25 04:16:21', '2023-10-25 04:16:21');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `coupon_categories_products`
--

CREATE TABLE `coupon_categories_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `coupon_id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `coupon_categories_products`
--

INSERT INTO `coupon_categories_products` (`id`, `coupon_id`, `category_id`, `created_at`, `updated_at`) VALUES
(1, 2, 2, '2023-10-25 04:16:21', '2023-10-25 04:16:21'),
(2, 2, 1, '2023-10-25 04:16:21', '2023-10-25 04:16:21');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `coupon_courses`
--

CREATE TABLE `coupon_courses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `coupon_id` bigint(20) UNSIGNED DEFAULT NULL,
  `course_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `coupon_courses`
--

INSERT INTO `coupon_courses` (`id`, `coupon_id`, `course_id`, `created_at`, `updated_at`) VALUES
(12, 1, 16, '2023-10-31 20:00:22', '2023-10-31 20:00:22');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `coupon_products`
--

CREATE TABLE `coupon_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `coupon_id` bigint(20) UNSIGNED DEFAULT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `coupon_products`
--

INSERT INTO `coupon_products` (`id`, `coupon_id`, `product_id`, `created_at`, `updated_at`) VALUES
(12, 1, 16, '2023-10-31 20:00:22', '2023-10-31 20:00:22');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `courses`
--

CREATE TABLE `courses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(250) NOT NULL,
  `slug` text NOT NULL,
  `subtitle` text NOT NULL,
  `imagen` varchar(250) DEFAULT NULL,
  `price_usd` double NOT NULL DEFAULT '0',
  `price_bves` double NOT NULL DEFAULT '0',
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `sub_category_id` bigint(20) UNSIGNED NOT NULL,
  `category_sale_id` bigint(20) UNSIGNED NOT NULL,
  `level` varchar(120) NOT NULL,
  `idioma` varchar(150) NOT NULL,
  `vimeo_id` varchar(50) DEFAULT NULL,
  `time` varchar(50) DEFAULT NULL,
  `description` longtext CHARACTER SET utf8 NOT NULL,
  `requirements` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `who_is_it_for` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `state` tinyint(1) UNSIGNED NOT NULL DEFAULT '1' COMMENT '1:prueba 2:publico',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `courses`
--

INSERT INTO `courses` (`id`, `title`, `slug`, `subtitle`, `imagen`, `price_usd`, `price_bves`, `user_id`, `category_id`, `sub_category_id`, `category_sale_id`, `level`, `idioma`, `vimeo_id`, `time`, `description`, `requirements`, `who_is_it_for`, `state`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Diseño en Ingles', 'diseno-en-ingles', 'dasds', 'courses/Up3ivvnaZlOCcocUEgxwULv4D6OmdI0RbdtQIH0K.jpg', 10, 370, 1, 1, 2, 0, 'Básico', 'Español', NULL, '00:00:30', '<p>dasdas</p>', '[\"das\",\"dasdas\"]', '[\"dasdas\",\"dasdsads\"]', 2, '2023-10-15 23:39:03', '2023-10-16 23:48:43', NULL),
(2, 'Web Design Courses', 'web-design-courses', 'Like this histudy, vulputate at sapien sit amet, auctor iaculis lorem. In vel hend rerit nisi.', 'courses/Dqpj2zCrsipijeuANe9lmsRiXJ9K1rVQGzCMnDYT.jpg', 50, 200, 1, 1, 4, 2, 'Intermedio', 'Español', '304972220', '00:00:30', '<p>Are you new to PHP or need a refresher? Then this course will help you get all the fundamentals of Procedural PHP, Object Oriented PHP, MYSQLi and ending the course by building a CMS system similar to WordPress, Joomla or Drupal. Knowing PHP has allowed me to make enough money to stay home and make courses like this one for students all over the world.</p>\r\n\r\n<ul>\r\n	<li>Become an advanced, confident, and modern JavaScript developer from scratch.</li>\r\n	<li>Have an intermediate skill level of Python programming.</li>\r\n	<li>Have a portfolio of various data analysis projects.</li>\r\n	<li>Use the numpy library to create and manipulate arrays.</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>Use the Jupyter Notebook Environment. JavaScript developer from scratch.</li>\r\n	<li>Use the pandas module with Python to create and structure data.</li>\r\n	<li>Have a portfolio of various data analysis projects.</li>\r\n	<li>Create data visualizations using matplotlib and the seaborn.</li>\r\n</ul>', '[\"JAVASCRIPT BASICO\",\"HTML BASICO\",\"CSS BASICO\"]', '[\"DESARROLADORES\",\"PROGRAMADORES\",\"INGENIERO DE SOFTWARE\"]', 2, '2023-05-04 00:27:19', '2023-12-24 01:09:49', NULL),
(3, 'Ways to learn education effectively', 'ways-to-learn-education-effectively', 'It is a long established fact that a reader.', 'courses/nZur2atIsGT5agEzFuaIPnRTxChvUPgBHCHd5rGN.jpg', 25, 150, 1, 8, 10, 0, 'Intermedio', 'Español', '410448352', '00:00:29', '<p>Are you new to PHP or need a refresher? Then this course will help you get all the fundamentals of Procedural PHP, Object Oriented PHP, MYSQLi and ending the course by building a CMS system similar to WordPress, Joomla or Drupal. Knowing PHP has allowed me to make enough money to stay home and make courses like this one for students all over the world.</p>\r\n\r\n<ul>\r\n	<li>Become an advanced, confident, and modern JavaScript developer from scratch.</li>\r\n	<li>Have an intermediate skill level of Python programming.</li>\r\n	<li>Have a portfolio of various data analysis projects.</li>\r\n	<li>Use the numpy library to create and manipulate arrays.</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>Use the Jupyter Notebook Environment. JavaScript developer from scratch.</li>\r\n	<li>Use the pandas module with Python to create and structure data.</li>\r\n	<li>Have a portfolio of various data analysis projects.</li>\r\n	<li>Create data visualizations using matplotlib and the seaborn.</li>\r\n</ul>', '[\"JAVASCRIPT BASICO\",\"LARAVEL BASICO\"]', '[\"DESARROLLADORES\",\"EMPRESAS DE SOFTWARE\",\"INGENIERO DE SOFTWARE\"]', 2, '2023-05-04 00:33:21', '2023-10-25 19:50:14', NULL),
(4, 'Vue Jquery Courses', 'vue-jquery-courses', 'Histudy The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested.', 'courses/11I4w9ocpohwbwc5h5rdjzJ4JleBL9nypZcX6aUQ.jpg', 30, 112, 1, 1, 4, 0, 'Intermedio', 'Español', '409634075', '00:00:30', '<p>&nbsp;</p>\r\n\r\n<p>Lorem ipsum dolor sit amet consectetur, adipisicing elit. Omnis, aliquam voluptas laudantium incidunt architecto nam excepturi provident rem laborum repellendus placeat neque aut doloremque ut ullam, veritatis nesciunt iusto officia alias, non est vitae. Eius repudiandae optio quam alias aperiam nemo nam tempora, dignissimos dicta excepturi&nbsp;</p>', '[\"JAVASCRIPT BASICO\"]', '[\"FRELANCE\"]', 2, '2023-05-09 02:19:51', '2023-10-25 19:49:52', NULL),
(5, 'Difficult Things About Education', 'difficult-things-about-education', 'Learn how to have a natural conversation FAST from a native English speaker!', 'courses/67NsuJJABmMeBawo5KJW0jhpVM80ksj1Ph1V8rb5.jpg', 65, 250, 1, 8, 9, 0, 'Intermedio', 'Ingles', '404815489', '00:00:30', '<ul>\r\n	<li>Become an advanced, confident, and modern JavaScript developer from scratch.</li>\r\n	<li>Have an intermediate skill level of Python programming.</li>\r\n	<li>Have a portfolio of various data analysis projects.</li>\r\n	<li>Use the numpy library to create and manipulate arrays.</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>Use the Jupyter Notebook Environment. JavaScript developer from scratch.</li>\r\n	<li>Use the pandas module with Python to create and structure data.</li>\r\n	<li>Have a portfolio of various data analysis projects.</li>\r\n	<li>Create data visualizations using matplotlib and the seaborn.</li>\r\n</ul>\r\n\r\n<p>Lorem ipsum dolor sit amet consectetur, adipisicing elit. Omnis, aliquam voluptas laudantium incidunt architecto nam excepturi provident rem laborum repellendus placeat neque aut doloremque ut ullam, veritatis nesciunt iusto officia alias, non est vitae.</p>', '[\"Creer en ti\"]', '[\"Personal con capacidades intrapersonales\"]', 2, '2023-05-12 05:35:59', '2023-10-25 19:49:33', NULL),
(6, 'Ilts English Courses', 'ilts-english-courses', 'The Complete English Language Course: English grammar, English speaking, and writing. British and American English.', 'courses/kP0Mp5ChlG8NNyRFWpOdQ1kDC5nBNZiqIkLwenac.jpg', 65, 350, 1, 8, 9, 2, 'Avanzado', 'Ingles', '304972220', '00:00:30', '<p>Are you new to PHP or need a refresher? Then this course will help you get all the fundamentals of Procedural PHP, Object Oriented PHP, MYSQLi and ending the course by building a CMS system similar to WordPress, Joomla or Drupal. Knowing PHP has allowed me to make enough money to stay home and make courses like this one for students all over the world.</p>\r\n\r\n<ul>\r\n	<li>Become an advanced, confident, and modern JavaScript developer from scratch.</li>\r\n	<li>Have an intermediate skill level of Python programming.</li>\r\n	<li>Have a portfolio of various data analysis projects.</li>\r\n	<li>Use the numpy library to create and manipulate arrays.</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>Use the Jupyter Notebook Environment. JavaScript developer from scratch.</li>\r\n	<li>Use the pandas module with Python to create and structure data.</li>\r\n	<li>Have a portfolio of various data analysis projects.</li>\r\n	<li>Create data visualizations using matplotlib and the seaborn.</li>\r\n</ul>\r\n\r\n<p>Lorem ipsum dolor sit amet consectetur, adipisicing elit. Omnis, aliquam voluptas laudantium incidunt architecto nam excepturi provident rem laborum repellendus placeat neque aut</p>', '[\"Ingles basico\"]', '[\"Personas autodidactas\"]', 2, '2023-05-12 05:38:30', '2023-12-24 01:11:28', NULL),
(7, 'Graphic design Courses', 'graphic-design-courses', 'The Ultimate Graphic Design Course Which Covers Photoshop, Illustrator, InDesign,Design Theory, Branding and Logo Design', 'courses/LEV6bTFo2M3kQpMyGXoOWTVQLLJl8WoMk2OUuikf.jpg', 75, 340, 1, 2, 19, 0, 'Intermedio', 'Español', '410448352', '00:00:30', '<p><em>As you can see, this course is updated</em><strong><em>&nbsp;frequently</em></strong><em>&nbsp;with new lessons, projects and resources!</em></p>\r\n\r\n<p><em>January 2023 -&nbsp;</em><strong><em>NEW Resources!&nbsp;</em></strong>Design&nbsp;Book&nbsp;Recommendations and Resource on Graphic&nbsp;Design Pay<br />\r\n<em>November 2022 -&nbsp;</em><strong><em>NEW Section!&nbsp;</em></strong>The History of Graphic&nbsp;Design&nbsp;Styles!&nbsp;<br />\r\n<em>August 2022 -&nbsp;</em><strong><em>NEW Section!&nbsp;</em></strong>Learn to Create a Custom&nbsp;Brand Presentation&nbsp;Mockup in&nbsp;Adobe Photoshop<br />\r\n<em>January 2022 -&nbsp;</em><strong><em>NEW Section!&nbsp;</em></strong>Design&nbsp;Trends 2022!<strong><em>&nbsp;</em></strong>We will figure out how to predict future design trends and create three projects! &nbsp;<br />\r\n<em>November 2021 -&nbsp;</em><strong><em>NEW Sections!&nbsp;</em></strong>Adobe Photoshop and Illustrator 2022 update lessons and Adobe Illustrator 3D class Project!&nbsp;<br />\r\n<em>June 2021 -&nbsp;</em><strong><em>NEW Lesson!&nbsp;</em></strong>How to properly give and receive critiques and feedback<br />\r\n<em>April 2021 -</em><strong><em>&nbsp;NEW!</em></strong>&nbsp;Section on how to create&nbsp;YouTube Thumbnails!&nbsp;<br />\r\n<em>March 2021 -</em><strong><em>&nbsp;NEW!</em></strong>&nbsp;Video on How to Encourage and Spark Creativity<br />\r\n<em>March 2021 -&nbsp;</em><strong><em>NEW!&nbsp;</em></strong>&nbsp;Section on&nbsp;The Double Exposure&nbsp;Effect in&nbsp;Adobe Photoshop 2021!<br />\r\n<em>March 2021 -&nbsp;</em><strong><em>NEW!&nbsp;</em></strong>&nbsp;Section creating vector art in&nbsp;Adobe Illustrator 2021 using the new repeat tool and the blend tool.<br />\r\n<em>February 2021 -&nbsp;</em><strong><em>NEW!&nbsp;</em></strong>&nbsp;Detailed section on Adobe Photoshop Photo editing basics - New projects added!&nbsp;<br />\r\n<em>January 2021 -&nbsp;</em><strong><em>NEW!&nbsp;</em></strong>&nbsp;2021 Design&nbsp;Trends Section with three new student projects!&nbsp;<br />\r\n<em>November 2020 -&nbsp;</em><strong><em>NEW!&nbsp;</em></strong>&nbsp;16 page History of Typography Guide, 16 Page Color Theory Guide and 8 Page Font&nbsp;Pairing&nbsp;Guide!<br />\r\n<em>October 2020 -&nbsp;</em><strong><em>Updated Lessons!&nbsp;</em></strong>&nbsp;Photoshop 2021 Neural Filter and Liquify Tools<br />\r\n<em>August 2020 -&nbsp;</em><strong><em>Updated Lessons!&nbsp;&nbsp;</em></strong>Logo Design and Branding Project<br />\r\n<em>July 2020 -&nbsp;</em><strong><em>NEW!&nbsp;&nbsp;</em></strong>How to work with Photoshop&nbsp;Mockups!&nbsp;</p>', '[\"If you use Adobe products\",\" I highly suggest using versions CS6 or higher to have a more smooth experience with the course\",\" but not a requirement.\",\"Software not Included\"]', '[\"Have a deep understanding of typography\",\" color theory\",\" photos\",\" layout\",\"\",\" blocking and other design theory and skills\"]', 2, '2023-05-12 05:44:42', '2023-10-25 19:48:50', NULL),
(8, 'English for Beginners: Intensive Spoken English Course', 'english-for-beginners-intensive-spoken-english-course', 'English speaking course. 77 Hours of English language speaking, English listening practice. 1000 English language words', 'courses/YJ9hKwXcvlbkSqICOhxoGxnW5o0yAGLqoGw1k0AU.jpg', 65, 276, 1, 8, 9, 2, 'Intermedio', 'Ingles', '823436612', '00:00:30', '<h2>Lo que aprender&aacute;s</h2>\r\n\r\n<ul>\r\n	<li>\r\n	<p>You will learn over 1000 vital English words, expressions and idioms, and how to use them in real life.</p>\r\n	</li>\r\n	<li>\r\n	<p>You will learn the most important English grammar with tons of English-speaking practice.</p>\r\n	</li>\r\n	<li>\r\n	<p>You will learn to think in English and to speak English fluently. (in Intermediate level)</p>\r\n	</li>\r\n	<li>\r\n	<p>You will learn to read in English and to spell English words intuitively</p>\r\n	</li>\r\n	<li>\r\n	<p>You will learn to understand movies and TV shows in English.</p>\r\n	</li>\r\n	<li>\r\n	<p>After the course, you can travel the world freely, without a language barrier</p>\r\n	</li>\r\n	<li>\r\n	<p>After the course, you can start preparing for English language tests like TOEFL, IELTS, GMAT etc.</p>\r\n	</li>\r\n</ul>', '[\"A computer\",\" or a tablet\",\" or a phone with good speakers or headphones. (So you can hear the pronunciation very clearly).\",\"Absolutely no previous knowledge of English is necessary.\"]', '[\"It is a must-have English course for complete beginners\",\" who want to reach the intermediate level of spoken English in the shortest time possible.\"]', 2, '2023-05-12 05:47:11', '2023-12-24 01:11:01', NULL),
(9, 'Graphic Design Masterclass Intermediate: The NEXT Level', 'graphic-design-masterclass-intermediate-the-next-level', 'Up Your Graphic Design Skills: Logo Design, Photo Manipulation, Package Design, Infographics, Portfolio Building, Grids!', 'courses/kzoMUGnGqfsQYgbuQsyZ1NmvkkTp1mWhVn8DivYN.jpg', 95, 450, 1, 2, 20, 0, 'Intermedio', 'Ingles', '410448352', '00:00:30', '<h2>Lo que aprender&aacute;s</h2>\r\n\r\n<ul>\r\n	<li>\r\n	<p>You will be able to create polished and practical Logo designs and brand assets</p>\r\n	</li>\r\n	<li>\r\n	<p>Be able to create images for a full digital marketing campaign, including Facebook and Instagram</p>\r\n	</li>\r\n	<li>\r\n	<p>Produce complex photo manipulations for the use of ad design and understand solid layout and design principles</p>\r\n	</li>\r\n	<li>\r\n	<p>Sketch logo design and concepts with ease and understand the golden ratio and how to incorporate that in your design process</p>\r\n	</li>\r\n	<li>\r\n	<p>Create and build a strong graphic design portfolio both in pdf and online</p>\r\n	</li>\r\n	<li>\r\n	<p>Understand some of the many ways of making money by selling creative content and resources</p>\r\n	</li>\r\n	<li>\r\n	<p>Understand how to use more intermediate tools in Adobe Illustrator and Photoshop</p>\r\n	</li>\r\n	<li>\r\n	<p>Study the Golden Ratio and create a graphic illustration with it</p>\r\n	</li>\r\n	<li>\r\n	<p>Go through the entire package design process for a chocolate bar wrapper</p>\r\n	</li>\r\n	<li>\r\n	<p>Create a typography only poster</p>\r\n	</li>\r\n</ul>', '[\"This is an intermediate level course: Basic working knowledge of Adobe Photoshop\",\" Illustrator and InDesign\",\"Some familiarity with basic tools and functionality\"]', '[\"Those who are ready for an intermediate level design course and may already know the very basic tools of Adobe Photoshop and Illustrator\",\"Those who enjoy learning by producing practical real world projects that are based on common projects seen in the industry\"]', 2, '2023-05-12 05:50:04', '2023-10-25 19:48:02', NULL),
(10, 'Let\'s Learn Laravel: A Guided Path For Beginners', 'lets-learn-laravel-a-guided-path-for-beginners', 'Learn The Essential Concepts of PHP, Laravel & Linux To Launch A New Career!', 'courses/VQVbUcnmYXZRvh5XQFlCkOQPonKcfZA7kj3Qd98v.jpg', 70, 345, 1, 1, 4, 0, 'Intermedio', 'Portuges', '823057735', '00:00:30', '<h2>Lo que aprender&aacute;s</h2>\r\n\r\n<ul>\r\n	<li>\r\n	<p>The PHP language itself</p>\r\n	</li>\r\n	<li>\r\n	<p>How to setup your personal computer for Laravel practice</p>\r\n	</li>\r\n	<li>\r\n	<p>How to keep your code organized (we actually take the time to understand the MVC pattern)</p>\r\n	</li>\r\n	<li>\r\n	<p>How to deploy your app up to the web (both local Docker practice, and a real public Linux VPS)</p>\r\n	</li>\r\n</ul>', '[\"No programming experience is required\",\" but a basic understanding of HTML will be helpful.\",\"A computer that you are allowed to install software on\",\" and an internet connection.\"]', '[\"Anyone who wants to begin creating web applications using Laravel & PHP.\"]', 2, '2023-05-12 05:52:32', '2023-10-25 19:46:04', NULL),
(11, 'Web Design for Beginners: Real World Coding in HTML & CSS', 'web-design-for-beginners-real-world-coding-in-html-css', 'Launch a career as a web designer by learning HTML5, CSS3, responsive design, Sass and more!', 'courses/Y0erESJY4c9yMxjbUcoFwOkslwN2fAuG1YKHsQ4R.jpg', 80, 250, 1, 1, 4, 0, 'Intermedio', 'Ingles', '404497663', '00:00:30', '<h2>Lo que aprender&aacute;s</h2>\r\n\r\n<ul>\r\n	<li>\r\n	<p>Create any website layout you can imagine</p>\r\n	</li>\r\n	<li>\r\n	<p>Support any device size with Responsive (mobile-friendly) Design</p>\r\n	</li>\r\n	<li>\r\n	<p>Add tasteful animations and effects with CSS3</p>\r\n	</li>\r\n	<li>\r\n	<p>Use common vocabulary from the design industry</p>\r\n	</li>\r\n</ul>', '[\"No prerequisite knowledge required\",\"No special ($$$) software required\"]', '[\"Anyone who wants to build websites the \\\"professional\\\" way\",\"Anyone who has practiced web design as a hobby but is not confident about their skillset in a professional arena\"]', 2, '2023-05-12 05:54:58', '2023-10-25 19:45:32', NULL),
(12, 'Personal Finance Masterclass - Easy Guide to Better Finances', 'personal-finance-masterclass-easy-guide-to-better-finances', 'Your complete personal finance guide to understanding finances. Save more, invest smarter, reduce loans, retire earlier!', 'courses/73UbHUmRrMLHmQNooSV4veDy01DKIXVEgZXghbUl.jpg', 250, 700, 1, 8, 18, 0, 'Avanzado', 'Portuges', '409634075', '00:00:30', '<h2>Lo que aprender&aacute;s</h2>\r\n\r\n<ul>\r\n	<li>\r\n	<p>You&#39;ll be the master of your own finances.</p>\r\n	</li>\r\n	<li>\r\n	<p>You&#39;ll know how to create a smart budget that helps you increase savings and reduce expenses.</p>\r\n	</li>\r\n	<li>\r\n	<p>You&#39;ll increase your income with a promotion, new job, side hustle, and online income.</p>\r\n	</li>\r\n	<li>\r\n	<p>You&#39;ll have a step-by-step process for reducing your loan and/or credit card debt.</p>\r\n	</li>\r\n	<li>\r\n	<p>You&#39;ll know the process for buying a house and saving up for a down payment.</p>\r\n	</li>\r\n	<li>\r\n	<p>You&#39;ll know how retirement works, how to save and invest for retirement, and how much you&#39;ll need to save and invest for a worry-free retirement.</p>\r\n	</li>\r\n	<li>\r\n	<p>You&#39;ll learn how to retire early and achieve financial freedom!</p>\r\n	</li>\r\n</ul>', '[\"Students should be open to being challenged in their preconceived financial beliefs\",\"Students should get together their finances: know how much money they have in savings\",\" checking\",\" and investment accounts.\",\"Students should know how much debt they have: credit card\",\" student loan\",\" mortgage\",\" car loans\",\" or any other personal debt.\"]', '[\"This course is for you if you want to improve your financial life\",\"This course is for you if you need help handling your money.\",\"This course is for you if you want to make more money.\",\"This course is for you if you want to learn how to invest the smart way.\"]', 2, '2023-05-12 05:57:46', '2023-10-25 19:44:19', NULL),
(13, 'The Complete Personal Development Course - 22 Courses in 1', 'the-complete-personal-development-course-22-courses-in-1', 'The Most Comprehensive Masterclass in Personal Development - Start Growing Today!', 'courses/8sM5oZ8xaHJAOiRsX9Hwef3avDnNmuKllv95kkDl.jpg', 125, 345, 1, 8, 10, 0, 'Intermedio', 'Ingles', '404538296', '00:00:30', '<h2>Lo que aprender&aacute;s</h2>\r\n\r\n<ul>\r\n	<li>\r\n	<p>Release Yourself From Emotional Pain And Frustration By Discovering How Emotions Really Work And How You Can Gain Greater Mastery</p>\r\n	</li>\r\n	<li>\r\n	<p>Breakthrough Personal Illusions And Unleash Your Hidden Potential</p>\r\n	</li>\r\n	<li>\r\n	<p>Gain Hidden Knowledge Of What Drives Motivation - The Master Key To Success</p>\r\n	</li>\r\n	<li>\r\n	<p>Discover How The &ldquo;Imprint Period&rdquo; Has Literally Programmed You For Life &hellip; And How To Reprogram It</p>\r\n	</li>\r\n	<li>\r\n	<p>How False Personas Drive The Habits And Behaviors Of Yourself And Others &hellip; Take Back Control And Free Yourself</p>\r\n	</li>\r\n	<li>\r\n	<p>Discover How Pain &amp; Pleasure Rule Your Life &hellip; And The Secret Of How To Make This Work For You Instead Of Against You</p>\r\n	</li>\r\n	<li>\r\n	<p>Learn How Self-Image Determines What You Will And Won&rsquo;t Do</p>\r\n	</li>\r\n	<li>\r\n	<p>And Much, Much More...! This Is Just The First Section Of The Training!</p>\r\n	</li>\r\n</ul>', '[\"No experience required\",\"Suitable for everyone!\"]', '[\"People Who Want More Control Over Themselves & Their Lives\",\"People Who Want to Boost Their Self-esteem\",\"People Who Want Freedom From Old Pain & Hurts\"]', 2, '2023-05-12 06:02:01', '2023-10-25 19:43:59', NULL),
(14, 'Personal Finance: Financial Security Thinking & Principles', 'personal-finance-financial-security-thinking-principles', 'How to secure your financial future the fun & easy way! Personal Finance: Financial Security Thinking & Principles', 'courses/AwGdC23vneptYXDl5UdAN5VQabfxMDl8fpVqnnxn.jpg', 155, 245, 1, 8, 18, 0, 'Avanzado', 'Español', '405900491', '00:00:30', '<h2>Lo que aprender&aacute;s</h2>\r\n\r\n<ul>\r\n	<li>\r\n	<p>How your mind keeps you from having better control over your finances</p>\r\n	</li>\r\n	<li>\r\n	<p>The time-tested wealth principles that the financially successful use</p>\r\n	</li>\r\n	<li>\r\n	<p>How to reduce spending without reducing fun</p>\r\n	</li>\r\n	<li>\r\n	<p>How to increase your value and increase your income</p>\r\n	</li>\r\n	<li>\r\n	<p>Action plan to change your financial life for good!</p>\r\n	</li>\r\n</ul>', '[\"An open mind and enthusiasm for improving your financial circumstances\",\"An eagerness to manage your money more effectively\",\"A desire to take control of your finances\"]', '[\"How to maximize your time so that your money is working for you\",\"The 10 money paradigms; which one you are and which one you want\",\"Why we have a problem with our perspective on money and how you can change it\"]', 2, '2023-05-12 06:04:00', '2023-10-25 19:43:35', NULL),
(15, 'Software Testing desde cero : MasterClass todo en 1 (2023)', 'software-testing-desde-cero-masterclass-todo-en-1-2023', 'For new joiners in IT industry: learn basics of APIs, testing, Cloud, GIT, deployment, environments, SDLC, Scrum & more', 'courses/WP5j5ayOdx2U88wcFUIqAoUnQfnnMLKl9s3S2meN.jpg', 89, 345, 1, 11, 13, 0, 'Avanzado', 'Ingles', '404815489', '00:00:30', '<p>Are you an&nbsp;<strong>intern in IT</strong>,&nbsp;<strong>junior IT engineer</strong>&nbsp;or have been an engineer for a while but worked in your own silo? Or maybe you&#39;re a&nbsp;<strong>non-technical professional</strong>&nbsp;<strong>working in IT like PM or BA</strong>&nbsp;that would like to better understand software development projects?</p>\r\n\r\n<p>This course is for you!</p>\r\n\r\n<p>But wait, what if&nbsp;<strong>you don&#39;t work in IT yet</strong>&nbsp;but would like to get into the industry as either technical or non-technical professional? This course is perfect for you too!</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Sometimes the most important problem is&nbsp;<strong><em>WHAT</em></strong>&nbsp;we should learn. If we don&#39;t know the key problems and concepts, then how can we learn about them? More importantly, how can we effectively prepare for conversations about topics we have got no idea about? Time for some answers!</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>This course is the one-stop-shop for learning about all the different areas of software development. It is packed with key concepts and knowledge. Everything is visualised with animations. No time is wasted for excessive details or talking too broadly. The information you&#39;ll find here is useful to understand different kinds of IT projects and what is going on around them. Not least, to understand who is doing what.</p>', '[\"No IT or programming experience needed. You will learn from scratch about all the concepts\"]', '[\"People considering a career move into IT without the knowledge about software development\",\"Beginner Python developers\",\"Beginner Frontend developers\"]', 2, '2023-05-12 06:07:09', '2023-10-25 19:42:55', NULL),
(16, 'The Complete Digital Marketing Guide - 24 Courses in 1', 'the-complete-digital-marketing-guide-24-courses-in-1', 'Digital Marketing & Social Media, ChatGPT, Prompt Engineering, Google Ads, Facebook, SEO, WordPress, Instagram, YouTube.', 'courses/3zIUobMNzoGIpYxLdP1TwmDThDQ5BWDhBsUzNyZt.jpg', 95, 245, 1, 15, 17, 0, 'Avanzado', 'Portuges', '304972220', '00:00:30', '<h2>Lo que aprender&aacute;s</h2>\r\n\r\n<ul>\r\n	<li>\r\n	<p>Build a Digital Marketing Strategy.</p>\r\n	</li>\r\n	<li>\r\n	<p>Master ChatGPT with Prompt Engineering.</p>\r\n	</li>\r\n	<li>\r\n	<p>Find Your Online Audience.</p>\r\n	</li>\r\n	<li>\r\n	<p>Create a Website in 24 Hours.</p>\r\n	</li>\r\n	<li>\r\n	<p>Drive Targeted Traffic.</p>\r\n	</li>\r\n	<li>\r\n	<p>Build an Email List.</p>\r\n	</li>\r\n	<li>\r\n	<p>Analyze Website Data.</p>\r\n	</li>\r\n	<li>\r\n	<p>Create Converting Google Ads.</p>\r\n	</li>\r\n	<li>\r\n	<p>Create Converting Facebook Ads.</p>\r\n	</li>\r\n	<li>\r\n	<p>Create a Content Strategy Plan.</p>\r\n	</li>\r\n	<li>\r\n	<p>Build a Community</p>\r\n	</li>\r\n	<li>\r\n	<p>Organic Facebook Marketing</p>\r\n	</li>\r\n</ul>', '[\"No Knowledge Required.\",\"A Computer with Internet Connection.\"]', '[\"Website Owners.\",\"Digital Marketers.\",\"Social Media Marketers.\"]', 2, '2023-05-12 06:09:51', '2023-10-25 19:42:36', NULL),
(17, 'The Complete Digital Marketing Course - 12 Courses in 1', 'the-complete-digital-marketing-course-12-courses-in-1', 'Master Digital Marketing Strategy, Social Media Marketing, SEO, YouTube, Email, Facebook Marketing, Analytics & More!', 'courses/u4DXBS1v0L1qT7Kge6Lif15pAWjp6A2xXkJsz4bX.jpg', 175, 365, 1, 15, 16, 2, 'Intermedio', 'Ingles', '409634075', '00:00:30', '<h2>Lo que aprender&aacute;s</h2>\r\n\r\n<ul>\r\n	<li>\r\n	<p>Grow a Business Online From Scratch</p>\r\n	</li>\r\n	<li>\r\n	<p>Make Money as an Affiliate Marketer</p>\r\n	</li>\r\n	<li>\r\n	<p>Get Hired as a Digital Marketing Expert</p>\r\n	</li>\r\n	<li>\r\n	<p>Work From Home as a Freelance Marketer</p>\r\n	</li>\r\n</ul>', '[\"No experience required\",\"Suitable for all types of businesses (digital product\",\" physical product\",\" service\",\" B2B\",\" B2C).\"]', '[\"Pre launch business owners who don\'t know where to get started\",\"Website owners who are struggling to get traffic and sales\"]', 2, '2023-05-12 06:24:42', '2023-12-24 00:55:40', NULL),
(18, 'Mega Digital Marketing Course A-Z: 12 Courses in 1 + Updates', 'mega-digital-marketing-course-a-z-12-courses-in-1-updates', 'Digital Marketing Strategy, Social Media Marketing, WordPress, SEO, Digital Sale, Email, Instagram, Facebook, ads ..', 'courses/qaSBcM1qFZUHwVkVORkrsiXPMVuX4ioycxH7lcKE.jpg', 125, 356, 4, 15, 17, 2, 'Intermedio', 'Ingles', '404815489', '00:00:30', '<h2>Lo que aprender&aacute;s</h2>\r\n\r\n<ul>\r\n	<li>\r\n	<p>Find your target audience, easily convince them to become your customer and buy your products.</p>\r\n	</li>\r\n	<li>\r\n	<p>Build a effective website for marketing and sale from scratch (no coding!)</p>\r\n	</li>\r\n	<li>\r\n	<p>Increase your conversion rate by building advanced landing pages, write powerful copies and sell more</p>\r\n	</li>\r\n	<li>\r\n	<p>Earn extremely powerful knowledge of digital marketing strategies to use in any online platform to get results</p>\r\n	</li>\r\n	<li>\r\n	<p>Grow your sales by doing successful email marketing, following step by step instructions to get results</p>\r\n	</li>\r\n	<li>\r\n	<p>Inject constant traffic into your website &amp; business with SEO, rank in the first page of Google &amp; other search engines</p>\r\n	</li>\r\n	<li>\r\n	<p>Become a master of social media marketing, grow your business on Facebook &amp; Instagram and bring traffic to your website</p>\r\n	</li>\r\n	<li>\r\n	<p>Get more customers by doing successful advertisement campaigns on different social media platforms</p>\r\n	</li>\r\n	<li>\r\n	<p>Bring back the people who already visited your site by advanced retargeting</p>\r\n	</li>\r\n	<li>\r\n	<p>Fix your buisiness problems before they even happen using Google analytics, to avoid expensive problems in your business</p>\r\n	</li>\r\n</ul>', '[\"No previous knowledge required\",\"Open with an open mind\",\" hungry to learn amazing stuff!\",\"angular\",\" react\"]', '[\"Busineses who are strugling bringing traffic to their site or selling products\",\"People who want to start a digital marketing agancy\",\"People who want to work as a freelancer in digital marketing niche\"]', 2, '2023-05-12 06:26:13', '2023-12-24 00:54:57', NULL),
(19, 'prueba actualizado', 'prueba-actualizado', 'esto es una prueba', 'courses/N3rwFP6fNSwmyJatADKj3AbV0kj0nGZagEsWifI6.jpg', 5, 5, 1, 15, 16, 0, 'Intermedio', 'Español', NULL, '00:00:30', '<p>hola!!!</p>', '[\"dasdsa\"]', '[\"dasdsa\"]', 1, '2023-10-25 20:49:07', '2023-11-22 22:34:36', '2023-11-22 22:34:36'),
(20, 'prueba', 'prueba', 'esto es una prueba', NULL, 10, 22, 1, 15, 16, 0, 'Básico', 'Español', NULL, NULL, '<p>Hello World!</p>', '[\"saddsa\"]', '[\"dasdsa\"]', 1, '2023-12-20 05:26:12', '2023-12-20 07:14:27', '2023-12-20 07:14:27');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `courses_students`
--

CREATE TABLE `courses_students` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `course_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `clases_checkeds` text,
  `state` tinyint(1) UNSIGNED DEFAULT NULL COMMENT '1:iniciado 2:terminado',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `courses_students`
--

INSERT INTO `courses_students` (`id`, `course_id`, `user_id`, `clases_checkeds`, `state`, `created_at`, `updated_at`) VALUES
(1, 1, 9, NULL, NULL, '2023-11-04 03:23:04', '2023-11-04 03:23:04'),
(2, 1, 10, NULL, NULL, '2023-11-04 03:28:28', '2023-11-04 03:28:28'),
(3, 2, 10, NULL, NULL, '2023-11-04 03:31:17', '2023-11-04 03:31:17'),
(4, 12, 10, NULL, NULL, '2023-11-04 03:32:48', '2023-11-04 03:32:48'),
(5, 6, 10, NULL, NULL, '2023-11-04 03:36:06', '2023-11-04 03:36:06'),
(6, 2, 12, NULL, NULL, '2023-11-06 18:22:03', '2023-11-06 18:22:03');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `course_classes`
--

CREATE TABLE `course_classes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `course_section_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(250) NOT NULL,
  `description` longtext NOT NULL,
  `state` tinyint(1) UNSIGNED NOT NULL DEFAULT '1' COMMENT '1 es activo',
  `vimeo_id` varchar(50) DEFAULT NULL,
  `time` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `course_classes`
--

INSERT INTO `course_classes` (`id`, `course_section_id`, `name`, `description`, `state`, `vimeo_id`, `time`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'Introducción', '<p><em>Do you want to Learn&nbsp;</em><strong><em>Web Designing</em></strong><em>&nbsp;from Scratch ?</em></p>\r\n\r\n<p><em>Do you want to&nbsp;</em><strong><em>Master Your Web Design Skill&nbsp;</em></strong><em>to Advanced Professional Level ?</em></p>\r\n\r\n<p><em>Welcome to One of the&nbsp;</em><strong><em>Biggest Web Designing Course !!!</em></strong></p>\r\n\r\n<p>This Course includes :</p>\r\n\r\n<ul>\r\n	<li>\r\n	<p><strong><em>14 Courses</em></strong></p>\r\n	</li>\r\n	<li>\r\n	<p><strong><em>400+ Video Lectures</em></strong></p>\r\n	</li>\r\n	<li>\r\n	<p><strong><em>4 Bonus Courses&nbsp;</em></strong>(all in all&nbsp;<strong><em>18 Courses in 1</em></strong>)</p>\r\n	</li>\r\n</ul>\r\n\r\n<p>Topics Covered in this Course :</p>\r\n\r\n<ul>\r\n	<li>\r\n	<p><strong><em>HTML&nbsp;</em></strong>Crash Course</p>\r\n	</li>\r\n	<li>\r\n	<p><strong><em>CSS Concepts</em></strong></p>\r\n	</li>\r\n	<li>\r\n	<p><strong><em>Javascript</em></strong></p>\r\n	</li>\r\n	<li>\r\n	<p><strong><em>Jquery</em></strong></p>\r\n	</li>\r\n	<li>\r\n	<p><strong><em>Ajax</em></strong></p>\r\n	</li>\r\n	<li>\r\n	<p><strong><em>Bootstrap</em></strong>&nbsp;(for Responsive Design)</p>\r\n	</li>\r\n</ul>', 1, '341090511', '00:10:36', '2023-05-13 05:54:26', '2023-05-13 05:54:26', NULL),
(2, 2, 'What is HTML ?', '<p><em>o you want to Learn&nbsp;</em><strong><em>Web Designing</em></strong><em>&nbsp;from Scratch ?</em></p>\r\n\r\n<p><em>Do you want to&nbsp;</em><strong><em>Master Your Web Design Skill&nbsp;</em></strong><em>to Advanced Professional Level ?</em></p>\r\n\r\n<p><em>Welcome to One of the&nbsp;</em><strong><em>Biggest Web Designing Course !!!</em></strong></p>\r\n\r\n<p>This Course includes :</p>\r\n\r\n<ul>\r\n	<li>\r\n	<p><strong><em>14 Courses</em></strong></p>\r\n	</li>\r\n	<li>\r\n	<p><strong><em>400+ Video Lectures</em></strong></p>\r\n	</li>\r\n	<li>\r\n	<p><strong><em>4 Bonus Courses&nbsp;</em></strong>(all in all&nbsp;<strong><em>18 Courses in 1</em></strong>)</p>\r\n	</li>\r\n</ul>', 1, '343467421', '00:07:36', '2023-05-13 05:56:43', '2023-05-13 05:56:43', NULL),
(3, 2, 'Creating a Basic HTML Document', '<p>Each and everything is explained in detail. Also if you need any help , I am always here to Clear your concept.</p>\r\n\r\n<p>So , what are you waiting for ?&nbsp;<strong><em>Enroll Now !!!&nbsp;</em></strong>and&nbsp;<strong><em>take your first step in Designing Awesome Professional Websites</em></strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li>\r\n	<p><strong><em>3 Mega PSD to Responsive Web Design Projects</em></strong></p>\r\n	</li>\r\n	<li>\r\n	<p>Creating websites with cool features like&nbsp;<strong><em>Ajax Contact Form</em></strong>&nbsp;,&nbsp;<strong><em>CSS Animations</em></strong>&nbsp;,<strong><em>&nbsp;Parallax Designs</em></strong></p>\r\n	</li>\r\n	<li>\r\n	<p>Creating&nbsp;<strong><em>Animated Sliders&nbsp;</em></strong><em>without any Jquery Plugin</em>&nbsp;(no need to pay for paid plugins when you can do it on your own !!!)</p>\r\n	</li>\r\n	<li>\r\n	<p><em>Many More important tips ,tricks,techniques are shared</em></p>\r\n	</li>\r\n</ul>', 1, '344610920', '00:06:36', '2023-05-13 05:57:34', '2023-05-13 05:57:34', NULL),
(4, 2, 'HTML Styles', '<p>Hi ,</p>\r\n\r\n<p><strong><em>Do you want to want to Learn Web Development from Scratch ?</em></strong></p>\r\n\r\n<p><em><strong>Do you want to become an Awesome Web Developer ?</strong></em></p>\r\n\r\n<p><em><strong>Do you want to Build Amazing Websites ?</strong></em></p>\r\n\r\n<p>If your answer to any of these questions is&nbsp;<strong>YES</strong>&nbsp;, then this course is definitely for you .</p>\r\n\r\n<p>Welcome to this&nbsp;<em><strong>Mega and Most Comprehensive Web Development Course</strong></em>&nbsp;, where you will learn everything starting from&nbsp;<em><strong>HTML, CSS, Javascript, Jquery, Ajax, Bootstrap, PHP, MYSQL, Wordpress</strong></em>.</p>\r\n\r\n<p><em>Each and every little concept and code is explained in detail</em></p>\r\n\r\n<p>You will also learn creating&nbsp;<em><strong>Amazing Unique Hover Effects</strong></em></p>', 1, '341631029', '00:10:36', '2023-05-13 05:58:24', '2023-05-13 05:58:24', NULL),
(5, 3, 'CSS Syntax', '<p>Hi ,</p>\r\n\r\n<p><strong><em>Do you want to want to Learn Web Development from Scratch ?</em></strong></p>\r\n\r\n<p><em><strong>Do you want to become an Awesome Web Developer ?</strong></em></p>\r\n\r\n<p><em><strong>Do you want to Build Amazing Websites ?</strong></em></p>\r\n\r\n<p>If your answer to any of these questions is&nbsp;<strong>YES</strong>&nbsp;, then this course is definitely for you .</p>\r\n\r\n<p>Welcome to this&nbsp;<em><strong>Mega and Most Comprehensive Web Development Course</strong></em>&nbsp;, where you will learn everything starting from&nbsp;<em><strong>HTML, CSS, Javascript, Jquery, Ajax, Bootstrap, PHP, MYSQL, Wordpress</strong></em>.</p>\r\n\r\n<p><em>Each and every little concept and code is explained in detail</em></p>\r\n\r\n<p>You will also learn creating&nbsp;<em><strong>Amazing Unique Hover Effects</strong></em></p>', 1, '332748369', '00:05:00', '2023-05-13 06:00:08', '2023-05-13 06:00:08', NULL),
(6, 3, 'Understanding children selectors using examples', '<p>Hi ,</p>\r\n\r\n<p><strong><em>Do you want to want to Learn Web Development from Scratch ?</em></strong></p>\r\n\r\n<p><em><strong>Do you want to become an Awesome Web Developer ?</strong></em></p>\r\n\r\n<p><em><strong>Do you want to Build Amazing Websites ?</strong></em></p>\r\n\r\n<p>If your answer to any of these questions is&nbsp;<strong>YES</strong>&nbsp;, then this course is definitely for you .</p>\r\n\r\n<p>Welcome to this&nbsp;<em><strong>Mega and Most Comprehensive Web Development Course</strong></em>&nbsp;, where you will learn everything starting from&nbsp;<em><strong>HTML, CSS, Javascript, Jquery, Ajax, Bootstrap, PHP, MYSQL, Wordpress</strong></em>.</p>\r\n\r\n<p><em>Each and every little concept and code is explained in detail</em></p>\r\n\r\n<p>You will also learn creating&nbsp;<em><strong>Amazing Unique Hover Effects</strong></em></p>', 1, '346943885', '00:05:00', '2023-05-13 06:00:39', '2023-05-13 06:00:39', NULL),
(7, 3, 'Border , Border Radius and Outline', '<p>ou will also Learn Building&nbsp;<em><strong>Awesome Modern Looking Professional Websites</strong></em>&nbsp;with&nbsp;<em><strong>Cool Features</strong></em></p>\r\n\r\n<p>Some of the Website Projects that we have in this Course are as follows :</p>\r\n\r\n<ul>\r\n	<li><em>Project Spark :</em>&nbsp;<strong>Features :</strong>&nbsp;<em><strong>Modern Professional Look , Water Ripple Background, Awesome Unique Hover Effect</strong></em></li>\r\n	<li><em>Wordpress Project1 : Multipage Corporate Site :</em>&nbsp;<strong>Features :</strong>&nbsp;<em><strong>Cool Slider , Modern Look , Portfolio Filter Feature and contain all the required sections required for a&nbsp;Corporate Site</strong></em></li>\r\n	<li><em>Wordpress Project2 :</em>&nbsp;<em><strong>Multipage Portfolio Site</strong></em></li>\r\n	<li><em>Our Mega Project : PHP Multiuser Photogallery Site :</em>&nbsp;<em><strong>Features : Awesome Hover Effects, Pagination Feature in Gallery Page , Profile Image Feature / Avatar Image Feature handled with Ajax , Ajax Image Upload , Ajax Image Approval by Admin , Recent Uploads Feature , Tracking Number of Uploads by each User , Top Uploaders</strong></em></li>\r\n</ul>', 1, '346627381', '00:05:00', '2023-05-13 06:01:10', '2023-05-13 06:01:10', NULL),
(8, 4, 'What is Javascript and Why it is used ?', '<p>ou will also Learn Building&nbsp;<em><strong>Awesome Modern Looking Professional Websites</strong></em>&nbsp;with&nbsp;<em><strong>Cool Features</strong></em></p>\r\n\r\n<p>Some of the Website Projects that we have in this Course are as follows :</p>\r\n\r\n<ul>\r\n	<li><em>Project Spark :</em>&nbsp;<strong>Features :</strong>&nbsp;<em><strong>Modern Professional Look , Water Ripple Background, Awesome Unique Hover Effect</strong></em></li>\r\n	<li><em>Wordpress Project1 : Multipage Corporate Site :</em>&nbsp;<strong>Features :</strong>&nbsp;<em><strong>Cool Slider , Modern Look , Portfolio Filter Feature and contain all the required sections required for a&nbsp;Corporate Site</strong></em></li>\r\n	<li><em>Wordpress Project2 :</em>&nbsp;<em><strong>Multipage Portfolio Site</strong></em></li>\r\n	<li><em>Our Mega Project : PHP Multiuser Photogallery Site :</em>&nbsp;<em><strong>Features : Awesome Hover Effects, Pagination Feature in Gallery Page , Profile Image Feature / Avatar Image Feature handled with Ajax , Ajax Image Upload , Ajax Image Approval by Admin , Recent Uploads Feature , Tracking Number of Uploads by each User , Top Uploaders</strong></em></li>\r\n</ul>', 1, '348304224', '00:06:40', '2023-05-13 06:02:17', '2023-05-13 06:02:17', NULL),
(9, 4, 'Javascript Syntax', '<p>You will also Learn Building&nbsp;<em><strong>Awesome Modern Looking Professional Websites</strong></em>&nbsp;with&nbsp;<em><strong>Cool Features</strong></em></p>\r\n\r\n<p>Some of the Website Projects that we have in this Course are as follows :</p>\r\n\r\n<ul>\r\n	<li><em>Project Spark :</em>&nbsp;<strong>Features :</strong>&nbsp;<em><strong>Modern Professional Look , Water Ripple Background, Awesome Unique Hover Effect</strong></em></li>\r\n	<li><em>Wordpress Project1 : Multipage Corporate Site :</em>&nbsp;<strong>Features :</strong>&nbsp;<em><strong>Cool Slider , Modern Look , Portfolio Filter Feature and contain all the required sections required for a&nbsp;Corporate Site</strong></em></li>\r\n	<li><em>Wordpress Project2 :</em>&nbsp;<em><strong>Multipage Portfolio Site</strong></em></li>\r\n	<li><em>Our Mega Project : PHP Multiuser Photogallery Site :</em>&nbsp;<em><strong>Features : Awesome Hover Effects, Pagination Feature in Gallery Page , Profile Image Feature / Avatar Image Feature handled with Ajax , Ajax Image Upload , Ajax Image Approval by Admin , Recent Uploads Feature , Tracking Number of Uploads by each User , Top Uploaders</strong></em></li>\r\n</ul>\r\n\r\n<p><em><strong>After Completing this course along with these projects, you will have great knowledge about Web Development and enormous confidence&nbsp;in yourself , that you can also create Amazing Websites</strong></em></p>\r\n\r\n<p><em><strong>So why waiting , Enroll Now and take your first step to become an Awesome Web Developer</strong></em></p>', 1, '313045749', '00:06:40', '2023-05-13 06:02:37', '2023-05-13 06:02:37', NULL),
(10, 4, 'Interesting Concept : Adding Strings and Numbers', '<p>You will also Learn Building&nbsp;<em><strong>Awesome Modern Looking Professional Websites</strong></em>&nbsp;with&nbsp;<em><strong>Cool Features</strong></em></p>\r\n\r\n<p>Some of the Website Projects that we have in this Course are as follows :</p>\r\n\r\n<ul>\r\n	<li><em>Project Spark :</em>&nbsp;<strong>Features :</strong>&nbsp;<em><strong>Modern Professional Look , Water Ripple Background, Awesome Unique Hover Effect</strong></em></li>\r\n	<li><em>Wordpress Project1 : Multipage Corporate Site :</em>&nbsp;<strong>Features :</strong>&nbsp;<em><strong>Cool Slider , Modern Look , Portfolio Filter Feature and contain all the required sections required for a&nbsp;Corporate Site</strong></em></li>\r\n	<li><em>Wordpress Project2 :</em>&nbsp;<em><strong>Multipage Portfolio Site</strong></em></li>\r\n	<li><em>Our Mega Project : PHP Multiuser Photogallery Site :</em>&nbsp;<em><strong>Features : Awesome Hover Effects, Pagination Feature in Gallery Page , Profile Image Feature / Avatar Image Feature handled with Ajax , Ajax Image Upload , Ajax Image Approval by Admin , Recent Uploads Feature , Tracking Number of Uploads by each User , Top Uploaders</strong></em></li>\r\n</ul>\r\n\r\n<p><em><strong>After Completing this course along with these projects, you will have great knowledge about Web Development and enormous confidence&nbsp;in yourself , that you can also create Amazing Websites</strong></em></p>\r\n\r\n<p><em><strong>So why waiting , Enroll Now and take your first step to become an Awesome Web Developer</strong></em></p>', 1, '344610920', '00:06:36', '2023-05-13 06:02:56', '2023-05-13 06:02:56', NULL),
(11, 5, 'What is Jquery and why we use it ?', '<p>You will also Learn Building&nbsp;<em><strong>Awesome Modern Looking Professional Websites</strong></em>&nbsp;with&nbsp;<em><strong>Cool Features</strong></em></p>\r\n\r\n<p>Some of the Website Projects that we have in this Course are as follows :</p>\r\n\r\n<ul>\r\n	<li><em>Project Spark :</em>&nbsp;<strong>Features :</strong>&nbsp;<em><strong>Modern Professional Look , Water Ripple Background, Awesome Unique Hover Effect</strong></em></li>\r\n	<li><em>Wordpress Project1 : Multipage Corporate Site :</em>&nbsp;<strong>Features :</strong>&nbsp;<em><strong>Cool Slider , Modern Look , Portfolio Filter Feature and contain all the required sections required for a&nbsp;Corporate Site</strong></em></li>\r\n	<li><em>Wordpress Project2 :</em>&nbsp;<em><strong>Multipage Portfolio Site</strong></em></li>\r\n	<li><em>Our Mega Project : PHP Multiuser Photogallery Site :</em>&nbsp;<em><strong>Features : Awesome Hover Effects, Pagination Feature in Gallery Page , Profile Image Feature / Avatar Image Feature handled with Ajax , Ajax Image Upload , Ajax Image Approval by Admin , Recent Uploads Feature , Tracking Number of Uploads by each User , Top Uploaders</strong></em></li>\r\n</ul>\r\n\r\n<p><em><strong>After Completing this course along with these projects, you will have great knowledge about Web Development and enormous confidence&nbsp;in yourself , that you can also create Amazing Websites</strong></em></p>\r\n\r\n<p><em><strong>So why waiting , Enroll Now and take your first step to become an Awesome Web Developer</strong></em></p>', 1, '341090511', '00:10:36', '2023-05-13 06:03:40', '2023-05-13 06:03:40', NULL),
(12, 5, 'Using Jquery in Website', '<p>You will also Learn Building&nbsp;<em><strong>Awesome Modern Looking Professional Websites</strong></em>&nbsp;with&nbsp;<em><strong>Cool Features</strong></em></p>\r\n\r\n<p>Some of the Website Projects that we have in this Course are as follows :</p>\r\n\r\n<ul>\r\n	<li><em>Project Spark :</em>&nbsp;<strong>Features :</strong>&nbsp;<em><strong>Modern Professional Look , Water Ripple Background, Awesome Unique Hover Effect</strong></em></li>\r\n	<li><em>Wordpress Project1 : Multipage Corporate Site :</em>&nbsp;<strong>Features :</strong>&nbsp;<em><strong>Cool Slider , Modern Look , Portfolio Filter Feature and contain all the required sections required for a&nbsp;Corporate Site</strong></em></li>\r\n	<li><em>Wordpress Project2 :</em>&nbsp;<em><strong>Multipage Portfolio Site</strong></em></li>\r\n	<li><em>Our Mega Project : PHP Multiuser Photogallery Site :</em>&nbsp;<em><strong>Features : Awesome Hover Effects, Pagination Feature in Gallery Page , Profile Image Feature / Avatar Image Feature handled with Ajax , Ajax Image Upload , Ajax Image Approval by Admin , Recent Uploads Feature , Tracking Number of Uploads by each User , Top Uploaders</strong></em></li>\r\n</ul>\r\n\r\n<p><em><strong>After Completing this course along with these projects, you will have great knowledge about Web Development and enormous confidence&nbsp;in yourself , that you can also create Amazing Websites</strong></em></p>\r\n\r\n<p><em><strong>So why waiting , Enroll Now and take your first step to become an Awesome Web Developer</strong></em></p>', 1, '344610920', '00:05:00', '2023-05-13 06:03:55', '2023-05-13 06:03:55', NULL),
(13, 5, 'Removing HTML Content using Jquery', '<p>You will also Learn Building&nbsp;<em><strong>Awesome Modern Looking Professional Websites</strong></em>&nbsp;with&nbsp;<em><strong>Cool Features</strong></em></p>\r\n\r\n<p>Some of the Website Projects that we have in this Course are as follows :</p>\r\n\r\n<ul>\r\n	<li><em>Project Spark :</em>&nbsp;<strong>Features :</strong>&nbsp;<em><strong>Modern Professional Look , Water Ripple Background, Awesome Unique Hover Effect</strong></em></li>\r\n	<li><em>Wordpress Project1 : Multipage Corporate Site :</em>&nbsp;<strong>Features :</strong>&nbsp;<em><strong>Cool Slider , Modern Look , Portfolio Filter Feature and contain all the required sections required for a&nbsp;Corporate Site</strong></em></li>\r\n	<li><em>Wordpress Project2 :</em>&nbsp;<em><strong>Multipage Portfolio Site</strong></em></li>\r\n	<li><em>Our Mega Project : PHP Multiuser Photogallery Site :</em>&nbsp;<em><strong>Features : Awesome Hover Effects, Pagination Feature in Gallery Page , Profile Image Feature / Avatar Image Feature handled with Ajax , Ajax Image Upload , Ajax Image Approval by Admin , Recent Uploads Feature , Tracking Number of Uploads by each User , Top Uploaders</strong></em></li>\r\n</ul>\r\n\r\n<p><em><strong>After Completing this course along with these projects, you will have great knowledge about Web Development and enormous confidence&nbsp;in yourself , that you can also create Amazing Websites</strong></em></p>\r\n\r\n<p><em><strong>So why waiting , Enroll Now and take your first step to become an Awesome Web Developer</strong></em></p>', 1, '346943885', '00:05:30', '2023-05-13 06:04:11', '2023-05-13 06:04:11', NULL),
(14, 6, 'Introducción', '<p><em>Do you want to Learn&nbsp;</em><strong><em>Web Designing</em></strong><em>&nbsp;from Scratch ?</em></p>\r\n\r\n<p><em>Do you want to&nbsp;</em><strong><em>Master Your Web Design Skill&nbsp;</em></strong><em>to Advanced Professional Level ?</em></p>\r\n\r\n<p><em>Welcome to One of the&nbsp;</em><strong><em>Biggest Web Designing Course !!!</em></strong></p>\r\n\r\n<p>This Course includes :</p>\r\n\r\n<ul>\r\n	<li>\r\n	<p><strong><em>14 Courses</em></strong></p>\r\n	</li>\r\n	<li>\r\n	<p><strong><em>400+ Video Lectures</em></strong></p>\r\n	</li>\r\n	<li>\r\n	<p><strong><em>4 Bonus Courses&nbsp;</em></strong>(all in all&nbsp;<strong><em>18 Courses in 1</em></strong>)</p>\r\n	</li>\r\n</ul>\r\n\r\n<p>Topics Covered in this Course :</p>\r\n\r\n<ul>\r\n	<li>\r\n	<p><strong><em>HTML&nbsp;</em></strong>Crash Course</p>\r\n	</li>\r\n	<li>\r\n	<p><strong><em>CSS Concepts</em></strong></p>\r\n	</li>\r\n	<li>\r\n	<p><strong><em>Javascript</em></strong></p>\r\n	</li>\r\n	<li>\r\n	<p><strong><em>Jquery</em></strong></p>\r\n	</li>\r\n	<li>\r\n	<p><strong><em>Ajax</em></strong></p>\r\n	</li>\r\n	<li>\r\n	<p><strong><em>Bootstrap</em></strong>&nbsp;(for Responsive Design)</p>\r\n	</li>\r\n</ul>', 1, '341090511', '00:10:36', '2023-05-13 10:54:26', '2023-05-13 10:54:26', NULL),
(15, 7, 'What is HTML ?', '<p><em>o you want to Learn&nbsp;</em><strong><em>Web Designing</em></strong><em>&nbsp;from Scratch ?</em></p>\r\n\r\n<p><em>Do you want to&nbsp;</em><strong><em>Master Your Web Design Skill&nbsp;</em></strong><em>to Advanced Professional Level ?</em></p>\r\n\r\n<p><em>Welcome to One of the&nbsp;</em><strong><em>Biggest Web Designing Course !!!</em></strong></p>\r\n\r\n<p>This Course includes :</p>\r\n\r\n<ul>\r\n	<li>\r\n	<p><strong><em>14 Courses</em></strong></p>\r\n	</li>\r\n	<li>\r\n	<p><strong><em>400+ Video Lectures</em></strong></p>\r\n	</li>\r\n	<li>\r\n	<p><strong><em>4 Bonus Courses&nbsp;</em></strong>(all in all&nbsp;<strong><em>18 Courses in 1</em></strong>)</p>\r\n	</li>\r\n</ul>', 1, '343467421', '00:07:36', '2023-05-13 10:56:43', '2023-05-13 10:56:43', NULL),
(16, 7, 'Creating a Basic HTML Document', '<p>Each and everything is explained in detail. Also if you need any help , I am always here to Clear your concept.</p>\r\n\r\n<p>So , what are you waiting for ?&nbsp;<strong><em>Enroll Now !!!&nbsp;</em></strong>and&nbsp;<strong><em>take your first step in Designing Awesome Professional Websites</em></strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li>\r\n	<p><strong><em>3 Mega PSD to Responsive Web Design Projects</em></strong></p>\r\n	</li>\r\n	<li>\r\n	<p>Creating websites with cool features like&nbsp;<strong><em>Ajax Contact Form</em></strong>&nbsp;,&nbsp;<strong><em>CSS Animations</em></strong>&nbsp;,<strong><em>&nbsp;Parallax Designs</em></strong></p>\r\n	</li>\r\n	<li>\r\n	<p>Creating&nbsp;<strong><em>Animated Sliders&nbsp;</em></strong><em>without any Jquery Plugin</em>&nbsp;(no need to pay for paid plugins when you can do it on your own !!!)</p>\r\n	</li>\r\n	<li>\r\n	<p><em>Many More important tips ,tricks,techniques are shared</em></p>\r\n	</li>\r\n</ul>', 1, '344610920', '00:06:36', '2023-05-13 10:57:34', '2023-05-13 10:57:34', NULL),
(17, 7, 'HTML Styles', '<p>Hi ,</p>\r\n\r\n<p><strong><em>Do you want to want to Learn Web Development from Scratch ?</em></strong></p>\r\n\r\n<p><em><strong>Do you want to become an Awesome Web Developer ?</strong></em></p>\r\n\r\n<p><em><strong>Do you want to Build Amazing Websites ?</strong></em></p>\r\n\r\n<p>If your answer to any of these questions is&nbsp;<strong>YES</strong>&nbsp;, then this course is definitely for you .</p>\r\n\r\n<p>Welcome to this&nbsp;<em><strong>Mega and Most Comprehensive Web Development Course</strong></em>&nbsp;, where you will learn everything starting from&nbsp;<em><strong>HTML, CSS, Javascript, Jquery, Ajax, Bootstrap, PHP, MYSQL, Wordpress</strong></em>.</p>\r\n\r\n<p><em>Each and every little concept and code is explained in detail</em></p>\r\n\r\n<p>You will also learn creating&nbsp;<em><strong>Amazing Unique Hover Effects</strong></em></p>', 1, '341631029', '00:10:36', '2023-05-13 10:58:24', '2023-05-13 10:58:24', NULL),
(18, 8, 'CSS Syntax', '<p>Hi ,</p>\r\n\r\n<p><strong><em>Do you want to want to Learn Web Development from Scratch ?</em></strong></p>\r\n\r\n<p><em><strong>Do you want to become an Awesome Web Developer ?</strong></em></p>\r\n\r\n<p><em><strong>Do you want to Build Amazing Websites ?</strong></em></p>\r\n\r\n<p>If your answer to any of these questions is&nbsp;<strong>YES</strong>&nbsp;, then this course is definitely for you .</p>\r\n\r\n<p>Welcome to this&nbsp;<em><strong>Mega and Most Comprehensive Web Development Course</strong></em>&nbsp;, where you will learn everything starting from&nbsp;<em><strong>HTML, CSS, Javascript, Jquery, Ajax, Bootstrap, PHP, MYSQL, Wordpress</strong></em>.</p>\r\n\r\n<p><em>Each and every little concept and code is explained in detail</em></p>\r\n\r\n<p>You will also learn creating&nbsp;<em><strong>Amazing Unique Hover Effects</strong></em></p>', 1, '332748369', '00:05:00', '2023-05-13 11:00:08', '2023-05-13 11:00:08', NULL),
(19, 8, 'Understanding children selectors using examples', '<p>Hi ,</p>\r\n\r\n<p><strong><em>Do you want to want to Learn Web Development from Scratch ?</em></strong></p>\r\n\r\n<p><em><strong>Do you want to become an Awesome Web Developer ?</strong></em></p>\r\n\r\n<p><em><strong>Do you want to Build Amazing Websites ?</strong></em></p>\r\n\r\n<p>If your answer to any of these questions is&nbsp;<strong>YES</strong>&nbsp;, then this course is definitely for you .</p>\r\n\r\n<p>Welcome to this&nbsp;<em><strong>Mega and Most Comprehensive Web Development Course</strong></em>&nbsp;, where you will learn everything starting from&nbsp;<em><strong>HTML, CSS, Javascript, Jquery, Ajax, Bootstrap, PHP, MYSQL, Wordpress</strong></em>.</p>\r\n\r\n<p><em>Each and every little concept and code is explained in detail</em></p>\r\n\r\n<p>You will also learn creating&nbsp;<em><strong>Amazing Unique Hover Effects</strong></em></p>', 1, '346943885', '00:05:00', '2023-05-13 11:00:39', '2023-05-13 11:00:39', NULL),
(20, 8, 'Border , Border Radius and Outline', '<p>ou will also Learn Building&nbsp;<em><strong>Awesome Modern Looking Professional Websites</strong></em>&nbsp;with&nbsp;<em><strong>Cool Features</strong></em></p>\r\n\r\n<p>Some of the Website Projects that we have in this Course are as follows :</p>\r\n\r\n<ul>\r\n	<li><em>Project Spark :</em>&nbsp;<strong>Features :</strong>&nbsp;<em><strong>Modern Professional Look , Water Ripple Background, Awesome Unique Hover Effect</strong></em></li>\r\n	<li><em>Wordpress Project1 : Multipage Corporate Site :</em>&nbsp;<strong>Features :</strong>&nbsp;<em><strong>Cool Slider , Modern Look , Portfolio Filter Feature and contain all the required sections required for a&nbsp;Corporate Site</strong></em></li>\r\n	<li><em>Wordpress Project2 :</em>&nbsp;<em><strong>Multipage Portfolio Site</strong></em></li>\r\n	<li><em>Our Mega Project : PHP Multiuser Photogallery Site :</em>&nbsp;<em><strong>Features : Awesome Hover Effects, Pagination Feature in Gallery Page , Profile Image Feature / Avatar Image Feature handled with Ajax , Ajax Image Upload , Ajax Image Approval by Admin , Recent Uploads Feature , Tracking Number of Uploads by each User , Top Uploaders</strong></em></li>\r\n</ul>', 1, '346627381', '00:05:00', '2023-05-13 11:01:10', '2023-05-13 11:01:10', NULL),
(21, 9, 'What is Javascript and Why it is used ?', '<p>ou will also Learn Building&nbsp;<em><strong>Awesome Modern Looking Professional Websites</strong></em>&nbsp;with&nbsp;<em><strong>Cool Features</strong></em></p>\r\n\r\n<p>Some of the Website Projects that we have in this Course are as follows :</p>\r\n\r\n<ul>\r\n	<li><em>Project Spark :</em>&nbsp;<strong>Features :</strong>&nbsp;<em><strong>Modern Professional Look , Water Ripple Background, Awesome Unique Hover Effect</strong></em></li>\r\n	<li><em>Wordpress Project1 : Multipage Corporate Site :</em>&nbsp;<strong>Features :</strong>&nbsp;<em><strong>Cool Slider , Modern Look , Portfolio Filter Feature and contain all the required sections required for a&nbsp;Corporate Site</strong></em></li>\r\n	<li><em>Wordpress Project2 :</em>&nbsp;<em><strong>Multipage Portfolio Site</strong></em></li>\r\n	<li><em>Our Mega Project : PHP Multiuser Photogallery Site :</em>&nbsp;<em><strong>Features : Awesome Hover Effects, Pagination Feature in Gallery Page , Profile Image Feature / Avatar Image Feature handled with Ajax , Ajax Image Upload , Ajax Image Approval by Admin , Recent Uploads Feature , Tracking Number of Uploads by each User , Top Uploaders</strong></em></li>\r\n</ul>', 1, '348304224', '00:06:40', '2023-05-13 11:02:17', '2023-05-13 11:02:17', NULL),
(22, 9, 'Javascript Syntax', '<p>You will also Learn Building&nbsp;<em><strong>Awesome Modern Looking Professional Websites</strong></em>&nbsp;with&nbsp;<em><strong>Cool Features</strong></em></p>\r\n\r\n<p>Some of the Website Projects that we have in this Course are as follows :</p>\r\n\r\n<ul>\r\n	<li><em>Project Spark :</em>&nbsp;<strong>Features :</strong>&nbsp;<em><strong>Modern Professional Look , Water Ripple Background, Awesome Unique Hover Effect</strong></em></li>\r\n	<li><em>Wordpress Project1 : Multipage Corporate Site :</em>&nbsp;<strong>Features :</strong>&nbsp;<em><strong>Cool Slider , Modern Look , Portfolio Filter Feature and contain all the required sections required for a&nbsp;Corporate Site</strong></em></li>\r\n	<li><em>Wordpress Project2 :</em>&nbsp;<em><strong>Multipage Portfolio Site</strong></em></li>\r\n	<li><em>Our Mega Project : PHP Multiuser Photogallery Site :</em>&nbsp;<em><strong>Features : Awesome Hover Effects, Pagination Feature in Gallery Page , Profile Image Feature / Avatar Image Feature handled with Ajax , Ajax Image Upload , Ajax Image Approval by Admin , Recent Uploads Feature , Tracking Number of Uploads by each User , Top Uploaders</strong></em></li>\r\n</ul>\r\n\r\n<p><em><strong>After Completing this course along with these projects, you will have great knowledge about Web Development and enormous confidence&nbsp;in yourself , that you can also create Amazing Websites</strong></em></p>\r\n\r\n<p><em><strong>So why waiting , Enroll Now and take your first step to become an Awesome Web Developer</strong></em></p>', 1, '313045749', '00:06:40', '2023-05-13 11:02:37', '2023-05-13 11:02:37', NULL),
(23, 9, 'Interesting Concept : Adding Strings and Numbers', '<p>You will also Learn Building&nbsp;<em><strong>Awesome Modern Looking Professional Websites</strong></em>&nbsp;with&nbsp;<em><strong>Cool Features</strong></em></p>\r\n\r\n<p>Some of the Website Projects that we have in this Course are as follows :</p>\r\n\r\n<ul>\r\n	<li><em>Project Spark :</em>&nbsp;<strong>Features :</strong>&nbsp;<em><strong>Modern Professional Look , Water Ripple Background, Awesome Unique Hover Effect</strong></em></li>\r\n	<li><em>Wordpress Project1 : Multipage Corporate Site :</em>&nbsp;<strong>Features :</strong>&nbsp;<em><strong>Cool Slider , Modern Look , Portfolio Filter Feature and contain all the required sections required for a&nbsp;Corporate Site</strong></em></li>\r\n	<li><em>Wordpress Project2 :</em>&nbsp;<em><strong>Multipage Portfolio Site</strong></em></li>\r\n	<li><em>Our Mega Project : PHP Multiuser Photogallery Site :</em>&nbsp;<em><strong>Features : Awesome Hover Effects, Pagination Feature in Gallery Page , Profile Image Feature / Avatar Image Feature handled with Ajax , Ajax Image Upload , Ajax Image Approval by Admin , Recent Uploads Feature , Tracking Number of Uploads by each User , Top Uploaders</strong></em></li>\r\n</ul>\r\n\r\n<p><em><strong>After Completing this course along with these projects, you will have great knowledge about Web Development and enormous confidence&nbsp;in yourself , that you can also create Amazing Websites</strong></em></p>\r\n\r\n<p><em><strong>So why waiting , Enroll Now and take your first step to become an Awesome Web Developer</strong></em></p>', 1, '344610920', '00:06:36', '2023-05-13 11:02:56', '2023-05-13 11:02:56', NULL),
(24, 10, 'What is Jquery and why we use it ?', '<p>You will also Learn Building&nbsp;<em><strong>Awesome Modern Looking Professional Websites</strong></em>&nbsp;with&nbsp;<em><strong>Cool Features</strong></em></p>\r\n\r\n<p>Some of the Website Projects that we have in this Course are as follows :</p>\r\n\r\n<ul>\r\n	<li><em>Project Spark :</em>&nbsp;<strong>Features :</strong>&nbsp;<em><strong>Modern Professional Look , Water Ripple Background, Awesome Unique Hover Effect</strong></em></li>\r\n	<li><em>Wordpress Project1 : Multipage Corporate Site :</em>&nbsp;<strong>Features :</strong>&nbsp;<em><strong>Cool Slider , Modern Look , Portfolio Filter Feature and contain all the required sections required for a&nbsp;Corporate Site</strong></em></li>\r\n	<li><em>Wordpress Project2 :</em>&nbsp;<em><strong>Multipage Portfolio Site</strong></em></li>\r\n	<li><em>Our Mega Project : PHP Multiuser Photogallery Site :</em>&nbsp;<em><strong>Features : Awesome Hover Effects, Pagination Feature in Gallery Page , Profile Image Feature / Avatar Image Feature handled with Ajax , Ajax Image Upload , Ajax Image Approval by Admin , Recent Uploads Feature , Tracking Number of Uploads by each User , Top Uploaders</strong></em></li>\r\n</ul>\r\n\r\n<p><em><strong>After Completing this course along with these projects, you will have great knowledge about Web Development and enormous confidence&nbsp;in yourself , that you can also create Amazing Websites</strong></em></p>\r\n\r\n<p><em><strong>So why waiting , Enroll Now and take your first step to become an Awesome Web Developer</strong></em></p>', 1, '341090511', '00:10:36', '2023-05-13 11:03:40', '2023-05-13 11:03:40', NULL),
(25, 10, 'Using Jquery in Website', '<p>You will also Learn Building&nbsp;<em><strong>Awesome Modern Looking Professional Websites</strong></em>&nbsp;with&nbsp;<em><strong>Cool Features</strong></em></p>\r\n\r\n<p>Some of the Website Projects that we have in this Course are as follows :</p>\r\n\r\n<ul>\r\n	<li><em>Project Spark :</em>&nbsp;<strong>Features :</strong>&nbsp;<em><strong>Modern Professional Look , Water Ripple Background, Awesome Unique Hover Effect</strong></em></li>\r\n	<li><em>Wordpress Project1 : Multipage Corporate Site :</em>&nbsp;<strong>Features :</strong>&nbsp;<em><strong>Cool Slider , Modern Look , Portfolio Filter Feature and contain all the required sections required for a&nbsp;Corporate Site</strong></em></li>\r\n	<li><em>Wordpress Project2 :</em>&nbsp;<em><strong>Multipage Portfolio Site</strong></em></li>\r\n	<li><em>Our Mega Project : PHP Multiuser Photogallery Site :</em>&nbsp;<em><strong>Features : Awesome Hover Effects, Pagination Feature in Gallery Page , Profile Image Feature / Avatar Image Feature handled with Ajax , Ajax Image Upload , Ajax Image Approval by Admin , Recent Uploads Feature , Tracking Number of Uploads by each User , Top Uploaders</strong></em></li>\r\n</ul>\r\n\r\n<p><em><strong>After Completing this course along with these projects, you will have great knowledge about Web Development and enormous confidence&nbsp;in yourself , that you can also create Amazing Websites</strong></em></p>\r\n\r\n<p><em><strong>So why waiting , Enroll Now and take your first step to become an Awesome Web Developer</strong></em></p>', 1, '344610920', '00:05:00', '2023-05-13 11:03:55', '2023-05-13 11:03:55', NULL),
(26, 10, 'Removing HTML Content using Jquery', '<p>You will also Learn Building&nbsp;<em><strong>Awesome Modern Looking Professional Websites</strong></em>&nbsp;with&nbsp;<em><strong>Cool Features</strong></em></p>\r\n\r\n<p>Some of the Website Projects that we have in this Course are as follows :</p>\r\n\r\n<ul>\r\n	<li><em>Project Spark :</em>&nbsp;<strong>Features :</strong>&nbsp;<em><strong>Modern Professional Look , Water Ripple Background, Awesome Unique Hover Effect</strong></em></li>\r\n	<li><em>Wordpress Project1 : Multipage Corporate Site :</em>&nbsp;<strong>Features :</strong>&nbsp;<em><strong>Cool Slider , Modern Look , Portfolio Filter Feature and contain all the required sections required for a&nbsp;Corporate Site</strong></em></li>\r\n	<li><em>Wordpress Project2 :</em>&nbsp;<em><strong>Multipage Portfolio Site</strong></em></li>\r\n	<li><em>Our Mega Project : PHP Multiuser Photogallery Site :</em>&nbsp;<em><strong>Features : Awesome Hover Effects, Pagination Feature in Gallery Page , Profile Image Feature / Avatar Image Feature handled with Ajax , Ajax Image Upload , Ajax Image Approval by Admin , Recent Uploads Feature , Tracking Number of Uploads by each User , Top Uploaders</strong></em></li>\r\n</ul>\r\n\r\n<p><em><strong>After Completing this course along with these projects, you will have great knowledge about Web Development and enormous confidence&nbsp;in yourself , that you can also create Amazing Websites</strong></em></p>\r\n\r\n<p><em><strong>So why waiting , Enroll Now and take your first step to become an Awesome Web Developer</strong></em></p>', 1, '346943885', '00:05:30', '2023-05-13 11:04:11', '2023-05-13 11:04:11', NULL),
(27, 11, 'Introducción', '<p><em>Do you want to Learn&nbsp;</em><strong><em>Web Designing</em></strong><em>&nbsp;from Scratch ?</em></p>\r\n\r\n<p><em>Do you want to&nbsp;</em><strong><em>Master Your Web Design Skill&nbsp;</em></strong><em>to Advanced Professional Level ?</em></p>\r\n\r\n<p><em>Welcome to One of the&nbsp;</em><strong><em>Biggest Web Designing Course !!!</em></strong></p>\r\n\r\n<p>This Course includes :</p>\r\n\r\n<ul>\r\n	<li>\r\n	<p><strong><em>14 Courses</em></strong></p>\r\n	</li>\r\n	<li>\r\n	<p><strong><em>400+ Video Lectures</em></strong></p>\r\n	</li>\r\n	<li>\r\n	<p><strong><em>4 Bonus Courses&nbsp;</em></strong>(all in all&nbsp;<strong><em>18 Courses in 1</em></strong>)</p>\r\n	</li>\r\n</ul>\r\n\r\n<p>Topics Covered in this Course :</p>\r\n\r\n<ul>\r\n	<li>\r\n	<p><strong><em>HTML&nbsp;</em></strong>Crash Course</p>\r\n	</li>\r\n	<li>\r\n	<p><strong><em>CSS Concepts</em></strong></p>\r\n	</li>\r\n	<li>\r\n	<p><strong><em>Javascript</em></strong></p>\r\n	</li>\r\n	<li>\r\n	<p><strong><em>Jquery</em></strong></p>\r\n	</li>\r\n	<li>\r\n	<p><strong><em>Ajax</em></strong></p>\r\n	</li>\r\n	<li>\r\n	<p><strong><em>Bootstrap</em></strong>&nbsp;(for Responsive Design)</p>\r\n	</li>\r\n</ul>', 1, '341090511', '00:10:36', '2023-05-13 10:54:26', '2023-05-13 10:54:26', NULL),
(28, 12, 'What is HTML ?', '<p><em>o you want to Learn&nbsp;</em><strong><em>Web Designing</em></strong><em>&nbsp;from Scratch ?</em></p>\r\n\r\n<p><em>Do you want to&nbsp;</em><strong><em>Master Your Web Design Skill&nbsp;</em></strong><em>to Advanced Professional Level ?</em></p>\r\n\r\n<p><em>Welcome to One of the&nbsp;</em><strong><em>Biggest Web Designing Course !!!</em></strong></p>\r\n\r\n<p>This Course includes :</p>\r\n\r\n<ul>\r\n	<li>\r\n	<p><strong><em>14 Courses</em></strong></p>\r\n	</li>\r\n	<li>\r\n	<p><strong><em>400+ Video Lectures</em></strong></p>\r\n	</li>\r\n	<li>\r\n	<p><strong><em>4 Bonus Courses&nbsp;</em></strong>(all in all&nbsp;<strong><em>18 Courses in 1</em></strong>)</p>\r\n	</li>\r\n</ul>', 1, '343467421', '00:07:36', '2023-05-13 10:56:43', '2023-05-13 10:56:43', NULL),
(29, 12, 'Creating a Basic HTML Document', '<p>Each and everything is explained in detail. Also if you need any help , I am always here to Clear your concept.</p>\r\n\r\n<p>So , what are you waiting for ?&nbsp;<strong><em>Enroll Now !!!&nbsp;</em></strong>and&nbsp;<strong><em>take your first step in Designing Awesome Professional Websites</em></strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li>\r\n	<p><strong><em>3 Mega PSD to Responsive Web Design Projects</em></strong></p>\r\n	</li>\r\n	<li>\r\n	<p>Creating websites with cool features like&nbsp;<strong><em>Ajax Contact Form</em></strong>&nbsp;,&nbsp;<strong><em>CSS Animations</em></strong>&nbsp;,<strong><em>&nbsp;Parallax Designs</em></strong></p>\r\n	</li>\r\n	<li>\r\n	<p>Creating&nbsp;<strong><em>Animated Sliders&nbsp;</em></strong><em>without any Jquery Plugin</em>&nbsp;(no need to pay for paid plugins when you can do it on your own !!!)</p>\r\n	</li>\r\n	<li>\r\n	<p><em>Many More important tips ,tricks,techniques are shared</em></p>\r\n	</li>\r\n</ul>', 1, '344610920', '00:06:36', '2023-05-13 10:57:34', '2023-05-13 10:57:34', NULL),
(30, 12, 'HTML Styles', '<p>Hi ,</p>\r\n\r\n<p><strong><em>Do you want to want to Learn Web Development from Scratch ?</em></strong></p>\r\n\r\n<p><em><strong>Do you want to become an Awesome Web Developer ?</strong></em></p>\r\n\r\n<p><em><strong>Do you want to Build Amazing Websites ?</strong></em></p>\r\n\r\n<p>If your answer to any of these questions is&nbsp;<strong>YES</strong>&nbsp;, then this course is definitely for you .</p>\r\n\r\n<p>Welcome to this&nbsp;<em><strong>Mega and Most Comprehensive Web Development Course</strong></em>&nbsp;, where you will learn everything starting from&nbsp;<em><strong>HTML, CSS, Javascript, Jquery, Ajax, Bootstrap, PHP, MYSQL, Wordpress</strong></em>.</p>\r\n\r\n<p><em>Each and every little concept and code is explained in detail</em></p>\r\n\r\n<p>You will also learn creating&nbsp;<em><strong>Amazing Unique Hover Effects</strong></em></p>', 1, '341631029', '00:10:36', '2023-05-13 10:58:24', '2023-05-13 10:58:24', NULL),
(31, 13, 'CSS Syntax', '<p>Hi ,</p>\r\n\r\n<p><strong><em>Do you want to want to Learn Web Development from Scratch ?</em></strong></p>\r\n\r\n<p><em><strong>Do you want to become an Awesome Web Developer ?</strong></em></p>\r\n\r\n<p><em><strong>Do you want to Build Amazing Websites ?</strong></em></p>\r\n\r\n<p>If your answer to any of these questions is&nbsp;<strong>YES</strong>&nbsp;, then this course is definitely for you .</p>\r\n\r\n<p>Welcome to this&nbsp;<em><strong>Mega and Most Comprehensive Web Development Course</strong></em>&nbsp;, where you will learn everything starting from&nbsp;<em><strong>HTML, CSS, Javascript, Jquery, Ajax, Bootstrap, PHP, MYSQL, Wordpress</strong></em>.</p>\r\n\r\n<p><em>Each and every little concept and code is explained in detail</em></p>\r\n\r\n<p>You will also learn creating&nbsp;<em><strong>Amazing Unique Hover Effects</strong></em></p>', 1, '332748369', '00:05:00', '2023-05-13 11:00:08', '2023-05-13 11:00:08', NULL),
(32, 13, 'Understanding children selectors using examples', '<p>Hi ,</p>\r\n\r\n<p><strong><em>Do you want to want to Learn Web Development from Scratch ?</em></strong></p>\r\n\r\n<p><em><strong>Do you want to become an Awesome Web Developer ?</strong></em></p>\r\n\r\n<p><em><strong>Do you want to Build Amazing Websites ?</strong></em></p>\r\n\r\n<p>If your answer to any of these questions is&nbsp;<strong>YES</strong>&nbsp;, then this course is definitely for you .</p>\r\n\r\n<p>Welcome to this&nbsp;<em><strong>Mega and Most Comprehensive Web Development Course</strong></em>&nbsp;, where you will learn everything starting from&nbsp;<em><strong>HTML, CSS, Javascript, Jquery, Ajax, Bootstrap, PHP, MYSQL, Wordpress</strong></em>.</p>\r\n\r\n<p><em>Each and every little concept and code is explained in detail</em></p>\r\n\r\n<p>You will also learn creating&nbsp;<em><strong>Amazing Unique Hover Effects</strong></em></p>', 1, '346943885', '00:05:00', '2023-05-13 11:00:39', '2023-05-13 11:00:39', NULL),
(33, 13, 'Border , Border Radius and Outline', '<p>ou will also Learn Building&nbsp;<em><strong>Awesome Modern Looking Professional Websites</strong></em>&nbsp;with&nbsp;<em><strong>Cool Features</strong></em></p>\r\n\r\n<p>Some of the Website Projects that we have in this Course are as follows :</p>\r\n\r\n<ul>\r\n	<li><em>Project Spark :</em>&nbsp;<strong>Features :</strong>&nbsp;<em><strong>Modern Professional Look , Water Ripple Background, Awesome Unique Hover Effect</strong></em></li>\r\n	<li><em>Wordpress Project1 : Multipage Corporate Site :</em>&nbsp;<strong>Features :</strong>&nbsp;<em><strong>Cool Slider , Modern Look , Portfolio Filter Feature and contain all the required sections required for a&nbsp;Corporate Site</strong></em></li>\r\n	<li><em>Wordpress Project2 :</em>&nbsp;<em><strong>Multipage Portfolio Site</strong></em></li>\r\n	<li><em>Our Mega Project : PHP Multiuser Photogallery Site :</em>&nbsp;<em><strong>Features : Awesome Hover Effects, Pagination Feature in Gallery Page , Profile Image Feature / Avatar Image Feature handled with Ajax , Ajax Image Upload , Ajax Image Approval by Admin , Recent Uploads Feature , Tracking Number of Uploads by each User , Top Uploaders</strong></em></li>\r\n</ul>', 1, '346627381', '00:05:00', '2023-05-13 11:01:10', '2023-05-13 11:01:10', NULL),
(34, 14, 'What is Javascript and Why it is used ?', '<p>ou will also Learn Building&nbsp;<em><strong>Awesome Modern Looking Professional Websites</strong></em>&nbsp;with&nbsp;<em><strong>Cool Features</strong></em></p>\r\n\r\n<p>Some of the Website Projects that we have in this Course are as follows :</p>\r\n\r\n<ul>\r\n	<li><em>Project Spark :</em>&nbsp;<strong>Features :</strong>&nbsp;<em><strong>Modern Professional Look , Water Ripple Background, Awesome Unique Hover Effect</strong></em></li>\r\n	<li><em>Wordpress Project1 : Multipage Corporate Site :</em>&nbsp;<strong>Features :</strong>&nbsp;<em><strong>Cool Slider , Modern Look , Portfolio Filter Feature and contain all the required sections required for a&nbsp;Corporate Site</strong></em></li>\r\n	<li><em>Wordpress Project2 :</em>&nbsp;<em><strong>Multipage Portfolio Site</strong></em></li>\r\n	<li><em>Our Mega Project : PHP Multiuser Photogallery Site :</em>&nbsp;<em><strong>Features : Awesome Hover Effects, Pagination Feature in Gallery Page , Profile Image Feature / Avatar Image Feature handled with Ajax , Ajax Image Upload , Ajax Image Approval by Admin , Recent Uploads Feature , Tracking Number of Uploads by each User , Top Uploaders</strong></em></li>\r\n</ul>', 1, '348304224', '00:06:40', '2023-05-13 11:02:17', '2023-05-13 11:02:17', NULL),
(35, 14, 'Javascript Syntax', '<p>You will also Learn Building&nbsp;<em><strong>Awesome Modern Looking Professional Websites</strong></em>&nbsp;with&nbsp;<em><strong>Cool Features</strong></em></p>\r\n\r\n<p>Some of the Website Projects that we have in this Course are as follows :</p>\r\n\r\n<ul>\r\n	<li><em>Project Spark :</em>&nbsp;<strong>Features :</strong>&nbsp;<em><strong>Modern Professional Look , Water Ripple Background, Awesome Unique Hover Effect</strong></em></li>\r\n	<li><em>Wordpress Project1 : Multipage Corporate Site :</em>&nbsp;<strong>Features :</strong>&nbsp;<em><strong>Cool Slider , Modern Look , Portfolio Filter Feature and contain all the required sections required for a&nbsp;Corporate Site</strong></em></li>\r\n	<li><em>Wordpress Project2 :</em>&nbsp;<em><strong>Multipage Portfolio Site</strong></em></li>\r\n	<li><em>Our Mega Project : PHP Multiuser Photogallery Site :</em>&nbsp;<em><strong>Features : Awesome Hover Effects, Pagination Feature in Gallery Page , Profile Image Feature / Avatar Image Feature handled with Ajax , Ajax Image Upload , Ajax Image Approval by Admin , Recent Uploads Feature , Tracking Number of Uploads by each User , Top Uploaders</strong></em></li>\r\n</ul>\r\n\r\n<p><em><strong>After Completing this course along with these projects, you will have great knowledge about Web Development and enormous confidence&nbsp;in yourself , that you can also create Amazing Websites</strong></em></p>\r\n\r\n<p><em><strong>So why waiting , Enroll Now and take your first step to become an Awesome Web Developer</strong></em></p>', 1, '313045749', '00:06:40', '2023-05-13 11:02:37', '2023-05-13 11:02:37', NULL),
(36, 14, 'Interesting Concept : Adding Strings and Numbers', '<p>You will also Learn Building&nbsp;<em><strong>Awesome Modern Looking Professional Websites</strong></em>&nbsp;with&nbsp;<em><strong>Cool Features</strong></em></p>\r\n\r\n<p>Some of the Website Projects that we have in this Course are as follows :</p>\r\n\r\n<ul>\r\n	<li><em>Project Spark :</em>&nbsp;<strong>Features :</strong>&nbsp;<em><strong>Modern Professional Look , Water Ripple Background, Awesome Unique Hover Effect</strong></em></li>\r\n	<li><em>Wordpress Project1 : Multipage Corporate Site :</em>&nbsp;<strong>Features :</strong>&nbsp;<em><strong>Cool Slider , Modern Look , Portfolio Filter Feature and contain all the required sections required for a&nbsp;Corporate Site</strong></em></li>\r\n	<li><em>Wordpress Project2 :</em>&nbsp;<em><strong>Multipage Portfolio Site</strong></em></li>\r\n	<li><em>Our Mega Project : PHP Multiuser Photogallery Site :</em>&nbsp;<em><strong>Features : Awesome Hover Effects, Pagination Feature in Gallery Page , Profile Image Feature / Avatar Image Feature handled with Ajax , Ajax Image Upload , Ajax Image Approval by Admin , Recent Uploads Feature , Tracking Number of Uploads by each User , Top Uploaders</strong></em></li>\r\n</ul>\r\n\r\n<p><em><strong>After Completing this course along with these projects, you will have great knowledge about Web Development and enormous confidence&nbsp;in yourself , that you can also create Amazing Websites</strong></em></p>\r\n\r\n<p><em><strong>So why waiting , Enroll Now and take your first step to become an Awesome Web Developer</strong></em></p>', 1, '344610920', '00:06:36', '2023-05-13 11:02:56', '2023-05-13 11:02:56', NULL),
(37, 15, 'What is Jquery and why we use it ?', '<p>You will also Learn Building&nbsp;<em><strong>Awesome Modern Looking Professional Websites</strong></em>&nbsp;with&nbsp;<em><strong>Cool Features</strong></em></p>\r\n\r\n<p>Some of the Website Projects that we have in this Course are as follows :</p>\r\n\r\n<ul>\r\n	<li><em>Project Spark :</em>&nbsp;<strong>Features :</strong>&nbsp;<em><strong>Modern Professional Look , Water Ripple Background, Awesome Unique Hover Effect</strong></em></li>\r\n	<li><em>Wordpress Project1 : Multipage Corporate Site :</em>&nbsp;<strong>Features :</strong>&nbsp;<em><strong>Cool Slider , Modern Look , Portfolio Filter Feature and contain all the required sections required for a&nbsp;Corporate Site</strong></em></li>\r\n	<li><em>Wordpress Project2 :</em>&nbsp;<em><strong>Multipage Portfolio Site</strong></em></li>\r\n	<li><em>Our Mega Project : PHP Multiuser Photogallery Site :</em>&nbsp;<em><strong>Features : Awesome Hover Effects, Pagination Feature in Gallery Page , Profile Image Feature / Avatar Image Feature handled with Ajax , Ajax Image Upload , Ajax Image Approval by Admin , Recent Uploads Feature , Tracking Number of Uploads by each User , Top Uploaders</strong></em></li>\r\n</ul>\r\n\r\n<p><em><strong>After Completing this course along with these projects, you will have great knowledge about Web Development and enormous confidence&nbsp;in yourself , that you can also create Amazing Websites</strong></em></p>\r\n\r\n<p><em><strong>So why waiting , Enroll Now and take your first step to become an Awesome Web Developer</strong></em></p>', 1, '341090511', '00:10:36', '2023-05-13 11:03:40', '2023-05-13 11:03:40', NULL);
INSERT INTO `course_classes` (`id`, `course_section_id`, `name`, `description`, `state`, `vimeo_id`, `time`, `created_at`, `updated_at`, `deleted_at`) VALUES
(38, 15, 'Using Jquery in Website', '<p>You will also Learn Building&nbsp;<em><strong>Awesome Modern Looking Professional Websites</strong></em>&nbsp;with&nbsp;<em><strong>Cool Features</strong></em></p>\r\n\r\n<p>Some of the Website Projects that we have in this Course are as follows :</p>\r\n\r\n<ul>\r\n	<li><em>Project Spark :</em>&nbsp;<strong>Features :</strong>&nbsp;<em><strong>Modern Professional Look , Water Ripple Background, Awesome Unique Hover Effect</strong></em></li>\r\n	<li><em>Wordpress Project1 : Multipage Corporate Site :</em>&nbsp;<strong>Features :</strong>&nbsp;<em><strong>Cool Slider , Modern Look , Portfolio Filter Feature and contain all the required sections required for a&nbsp;Corporate Site</strong></em></li>\r\n	<li><em>Wordpress Project2 :</em>&nbsp;<em><strong>Multipage Portfolio Site</strong></em></li>\r\n	<li><em>Our Mega Project : PHP Multiuser Photogallery Site :</em>&nbsp;<em><strong>Features : Awesome Hover Effects, Pagination Feature in Gallery Page , Profile Image Feature / Avatar Image Feature handled with Ajax , Ajax Image Upload , Ajax Image Approval by Admin , Recent Uploads Feature , Tracking Number of Uploads by each User , Top Uploaders</strong></em></li>\r\n</ul>\r\n\r\n<p><em><strong>After Completing this course along with these projects, you will have great knowledge about Web Development and enormous confidence&nbsp;in yourself , that you can also create Amazing Websites</strong></em></p>\r\n\r\n<p><em><strong>So why waiting , Enroll Now and take your first step to become an Awesome Web Developer</strong></em></p>', 1, '344610920', '00:05:00', '2023-05-13 11:03:55', '2023-05-13 11:03:55', NULL),
(39, 15, 'Removing HTML Content using Jquery', '<p>You will also Learn Building&nbsp;<em><strong>Awesome Modern Looking Professional Websites</strong></em>&nbsp;with&nbsp;<em><strong>Cool Features</strong></em></p>\r\n\r\n<p>Some of the Website Projects that we have in this Course are as follows :</p>\r\n\r\n<ul>\r\n	<li><em>Project Spark :</em>&nbsp;<strong>Features :</strong>&nbsp;<em><strong>Modern Professional Look , Water Ripple Background, Awesome Unique Hover Effect</strong></em></li>\r\n	<li><em>Wordpress Project1 : Multipage Corporate Site :</em>&nbsp;<strong>Features :</strong>&nbsp;<em><strong>Cool Slider , Modern Look , Portfolio Filter Feature and contain all the required sections required for a&nbsp;Corporate Site</strong></em></li>\r\n	<li><em>Wordpress Project2 :</em>&nbsp;<em><strong>Multipage Portfolio Site</strong></em></li>\r\n	<li><em>Our Mega Project : PHP Multiuser Photogallery Site :</em>&nbsp;<em><strong>Features : Awesome Hover Effects, Pagination Feature in Gallery Page , Profile Image Feature / Avatar Image Feature handled with Ajax , Ajax Image Upload , Ajax Image Approval by Admin , Recent Uploads Feature , Tracking Number of Uploads by each User , Top Uploaders</strong></em></li>\r\n</ul>\r\n\r\n<p><em><strong>After Completing this course along with these projects, you will have great knowledge about Web Development and enormous confidence&nbsp;in yourself , that you can also create Amazing Websites</strong></em></p>\r\n\r\n<p><em><strong>So why waiting , Enroll Now and take your first step to become an Awesome Web Developer</strong></em></p>', 1, '346943885', '00:05:30', '2023-05-13 11:04:11', '2023-05-13 11:04:11', NULL),
(40, 16, 'Quick Win Make an Ad for Yourself', '<p><strong>Personal Development, Personal Transformation</strong>, and Finding Your&nbsp;<strong>Life Purpose</strong>&nbsp;- All humans grapple with these topics, but only some create a meaningful process for living life to its full potential. This is the longest, most thorough, and detailed&nbsp;<strong>Personal Development and Personal Transformation&nbsp;</strong>course available on this platform!</p>\r\n\r\n<p>TJ Walker has been leading&nbsp;<strong>personal development</strong>&nbsp;seminars around the globe for more than 30 years. His unique approach to becoming a creative and fulfilled human being takes the best of the traditional&nbsp;<strong>self-development world&nbsp;</strong>and fuses it with 2020s realities and unique technology solutions using your cell phone in a liberating rather than enslaving manner.</p>\r\n\r\n<p>We live in a modern world of overabundance everywhere. We face an overabundance of stimulation and content coming at us from our cell phones and screens. We are drowning in an overabundance of stuff, junk, and possessions that arrive cheaply and near-instantly from Amazon and your favorite superstore. And we are overwhelmed with giant portions of fat and sugar-filled food and snacks made avail to use every waking moment.</p>', 1, '313045749', '00:00:40', '2023-05-14 01:51:58', '2023-05-14 01:51:58', NULL),
(41, 16, 'Another Quick Win  Create Something', '<p><strong>Personal Development, Personal Transformation</strong>, and Finding Your&nbsp;<strong>Life Purpose</strong>&nbsp;- All humans grapple with these topics, but only some create a meaningful process for living life to its full potential. This is the longest, most thorough, and detailed&nbsp;<strong>Personal Development and Personal Transformation&nbsp;</strong>course available on this platform!</p>\r\n\r\n<p>TJ Walker has been leading&nbsp;<strong>personal development</strong>&nbsp;seminars around the globe for more than 30 years. His unique approach to becoming a creative and fulfilled human being takes the best of the traditional&nbsp;<strong>self-development world&nbsp;</strong>and fuses it with 2020s realities and unique technology solutions using your cell phone in a liberating rather than enslaving manner.</p>\r\n\r\n<p>We live in a modern world of overabundance everywhere. We face an overabundance of stimulation and content coming at us from our cell phones and screens. We are drowning in an overabundance of stuff, junk, and possessions that arrive cheaply and near-instantly from Amazon and your favorite superstore. And we are overwhelmed with giant portions of fat and sugar-filled food and snacks made avail to use every waking moment.</p>', 1, '348304224', '00:05:30', '2023-05-14 01:52:55', '2023-05-14 01:52:55', NULL),
(42, 16, 'Determine Your Highest Potential', '<p>Modern overabundance is fueled by a digital delivery system that makes traditional&nbsp;<strong>self-help techniques</strong>&nbsp;impotent. In the modern, attention-driven economy, everybody is fighting for our mind space. This course will teach you how to aggressively take back control of your own mind, your own&nbsp;<strong>habits,</strong>&nbsp;and your own creativity by counter-programming your brain with your own wipes, dreams and goals.</p>\r\n\r\n<p>The world is splitting into two groups at greater acceleration: The creators versus the consumers, those who take action versus those who are passive, the haves versus the have-nots, the fulfilled versus the empty, the ones who create a lasting legacy and those who are soon forgotten.</p>\r\n\r\n<p>Which group do you want to be a part of?</p>\r\n\r\n<p>You can take 100% control over your present and future. You have the ability to condition your thoughts, actions, and methods of living life for more fulfilling results.</p>\r\n\r\n<p>TJ Walker is the founder of Createocracy and the developer of Selfie-Speaking Programming audios, a system where you create your own audio &quot;infomercial&quot; to rewire your brain.</p>\r\n\r\n<p>If you are ready to live a more active life, develop your own creative projects and live a healthier and more meaningful life, then sign up today for this&nbsp;<strong>Complete Personal Development Personal Transformation&nbsp;</strong>Course on Createocracy.</p>', 1, '348304224', '00:06:36', '2023-05-14 01:53:16', '2023-05-14 01:53:16', NULL),
(43, 17, 'Solving the Problem of Overabundance', '<p>The world is splitting into two groups at greater acceleration: The creators versus the consumers, those who take action versus those who are passive, the haves versus the have-nots, the fulfilled versus the empty, the ones who create a lasting legacy and those who are soon forgotten.</p>\r\n\r\n<p>Which group do you want to be a part of?</p>\r\n\r\n<p>You can take 100% control over your present and future. You have the ability to condition your thoughts, actions, and methods of living life for more fulfilling results.</p>\r\n\r\n<p>TJ Walker is the founder of Createocracy and the developer of Selfie-Speaking Programming audios, a system where you create your own audio &quot;infomercial&quot; to rewire your brain.</p>\r\n\r\n<p>If you are ready to live a more active life, develop your own creative projects and live a healthier and more meaningful life, then sign up today for this&nbsp;<strong>Complete Personal Development Personal Transformation&nbsp;</strong>Course on Createocracy.</p>\r\n\r\n<p>TJ Walker has conducted personal development workshops in more than 30 countries around the globe. He is the author of 6 books on personal development and is one of Udemy&#39;s most popular&nbsp;<strong>personal development</strong>&nbsp;instructors with more than 200,000 students here.</p>', 1, '346627381', '00:05:00', '2023-05-14 01:53:48', '2023-05-14 01:53:48', NULL),
(44, 17, 'Time to Find Specific Solutions for You', '<p><strong>Personal Development, Personal Transformation</strong>, and Finding Your&nbsp;<strong>Life Purpose</strong>&nbsp;- All humans grapple with these topics, but only some create a meaningful process for living life to its full potential. This is the longest, most thorough, and detailed&nbsp;<strong>Personal Development and Personal Transformation&nbsp;</strong>course available on this platform!</p>\r\n\r\n<p>TJ Walker has been leading&nbsp;<strong>personal development</strong>&nbsp;seminars around the globe for more than 30 years. His unique approach to becoming a creative and fulfilled human being takes the best of the traditional&nbsp;<strong>self-development world&nbsp;</strong>and fuses it with 2020s realities and unique technology solutions using your cell phone in a liberating rather than enslaving manner.</p>\r\n\r\n<p>We live in a modern world of overabundance everywhere. We face an overabundance of stimulation and content coming at us from our cell phones and screens. We are drowning in an overabundance of stuff, junk, and possessions that arrive cheaply and near-instantly from Amazon and your favorite superstore. And we are overwhelmed with giant portions of fat and sugar-filled food and snacks made avail to use every waking moment.</p>', 1, '344610920', '00:01:22', '2023-05-14 01:54:08', '2023-05-14 01:54:08', NULL),
(45, 17, 'Creativity Is a Habit, Not a Lottery Ticket', '<p>Here is what Udemy students say about this course:</p>\r\n\r\n<p><em>&quot;great course TJ it helped me discover more personal aspects, thank you so much.&quot;</em>&nbsp;Mina Freig</p>\r\n\r\n<p><em>&quot;You are so authentic and I am humbled to take this course. Thank you.&quot;</em>&nbsp;Arshia Khan</p>\r\n\r\n<p><em>&quot;Get to understand better how to develop myself in an ideal way. Thank you so much TJ Walker Expert!&quot;</em>&nbsp;Jo Yi Tan</p>\r\n\r\n<p><em>&quot;Really motivating and positive to watch!&quot;&nbsp;</em>Kailey Kivlehan</p>\r\n\r\n<p><em>&quot;This course has several golden nugget points that will help your personal and work life. I highly recommend this course!!! JT, thank you for your service to help others improve and succeed!!!!&quot;</em>&nbsp;Beth Kay</p>\r\n\r\n<p><em>&quot;I have already taken a course on Leadership from him and this is the reason I have enrolled for the second one. TJ is an amazing mentor and a great speaker. He is my personal benchmark and standard, especially for speaking skills. Keep up the good work.&quot;</em>&nbsp;Zafar Iqbal Ahmed</p>\r\n\r\n<p><em>&quot;There is no Real good structure in this course. A strange combination of two courses so far, with mixed topics. No definitely not recommended, I will finish it just to know what to avoid.&quot;&nbsp;</em>Malgorzata Cybulska Dusson</p>\r\n\r\n<p><em>&quot;Yes, it&#39;s a good match. It tells us to think of the personality, the way we communicate, things we do; and guides us / give tips to change certain ways/habits.&quot;</em>&nbsp;Swapnil</p>\r\n\r\n<p><em>&quot;Yes, I need to develop myself as a leader. For that to happen I must equip myself with content related to personal development and apply the knowledge in my life.&quot;&nbsp;</em>Mojau Mokone</p>\r\n\r\n<p><em>&quot;I like the fact that I can rewire my brain and I also believe that social media most of the time misleading and negative information spread but the government usually do the same as social media; therefore it is good to follow your own gut feelings and focus on positive ways of thinking.&quot;&nbsp;</em>&nbsp;Francois Venter</p>\r\n\r\n<p>Enroll now to Complete&nbsp;<strong>Personal Development Personal Transformation</strong>&nbsp;Course! Sign up today to take advantage of this limited offer.</p>', 1, '343467421', '00:07:36', '2023-05-14 01:55:12', '2023-05-14 01:55:12', NULL),
(46, 18, 'You Are Massively Creative', '<p><strong>Personal Development, Personal Transformation</strong>, and Finding Your&nbsp;<strong>Life Purpose</strong>&nbsp;- All humans grapple with these topics, but only some create a meaningful process for living life to its full potential. This is the longest, most thorough, and detailed&nbsp;<strong>Personal Development and Personal Transformation&nbsp;</strong>course available on this platform!</p>\r\n\r\n<p>TJ Walker has been leading&nbsp;<strong>personal development</strong>&nbsp;seminars around the globe for more than 30 years. His unique approach to becoming a creative and fulfilled human being takes the best of the traditional&nbsp;<strong>self-development world&nbsp;</strong>and fuses it with 2020s realities and unique technology solutions using your cell phone in a liberating rather than enslaving manner.</p>\r\n\r\n<p>We live in a modern world of overabundance everywhere. We face an overabundance of stimulation and content coming at us from our cell phones and screens. We are drowning in an overabundance of stuff, junk, and possessions that arrive cheaply and near-instantly from Amazon and your favorite superstore. And we are overwhelmed with giant portions of fat and sugar-filled food and snacks made avail to use every waking moment.</p>', 1, '348304224', '00:07:36', '2023-05-14 01:56:07', '2023-05-14 01:56:07', NULL),
(47, 18, 'The Best Way to Be Special is...', '<p>Here is what Udemy students say about this course:</p>\r\n\r\n<p><em>&quot;great course TJ it helped me discover more personal aspects, thank you so much.&quot;</em>&nbsp;Mina Freig</p>\r\n\r\n<p><em>&quot;You are so authentic and I am humbled to take this course. Thank you.&quot;</em>&nbsp;Arshia Khan</p>\r\n\r\n<p><em>&quot;Get to understand better how to develop myself in an ideal way. Thank you so much TJ Walker Expert!&quot;</em>&nbsp;Jo Yi Tan</p>\r\n\r\n<p><em>&quot;Really motivating and positive to watch!&quot;&nbsp;</em>Kailey Kivlehan</p>\r\n\r\n<p><em>&quot;This course has several golden nugget points that will help your personal and work life. I highly recommend this course!!! JT, thank you for your service to help others improve and succeed!!!!&quot;</em>&nbsp;Beth Kay</p>\r\n\r\n<p><em>&quot;I have already taken a course on Leadership from him and this is the reason I have enrolled for the second one. TJ is an amazing mentor and a great speaker. He is my personal benchmark and standard, e</em></p>', 1, '341631029', '00:00:40', '2023-05-14 01:56:37', '2023-05-14 01:56:37', NULL),
(48, 18, 'You Were born with the Desire to Create', '<p><strong>Personal Development, Personal Transformation</strong>, and Finding Your&nbsp;<strong>Life Purpose</strong>&nbsp;- All humans grapple with these topics, but only some create a meaningful process for living life to its full potential. This is the longest, most thorough, and detailed&nbsp;<strong>Personal Development and Personal Transformation&nbsp;</strong>course available on this platform!</p>\r\n\r\n<p>TJ Walker has been leading&nbsp;<strong>personal development</strong>&nbsp;seminars around the globe for more than 30 years. His unique approach to becoming a creative and fulfilled human being takes the best of the traditional&nbsp;<strong>self-development world&nbsp;</strong>and fuses it with 2020s realities and unique technology solutions using your cell phone in a liberating rather than enslaving manner.</p>\r\n\r\n<p>We live in a modern world of overabundance everywhere. We face an overabundance of stimulation and content coming at us from our cell phones and screens. We are drowning in an overabundance of stuff, junk, and possessions that arrive cheaply and near-instantly from Amazon and your favorite superstore. And we are overwhelmed with giant portions of fat and sugar-filled food and snacks made avail to use every waking moment.</p>', 1, '313045749', '00:05:34', '2023-05-14 01:57:02', '2023-05-14 01:57:02', NULL),
(49, 19, 'Life Is the Sum of Your Daily Habits', '<p>The world is splitting into two groups at greater acceleration: The creators versus the consumers, those who take action versus those who are passive, the haves versus the have-nots, the fulfilled versus the empty, the ones who create a lasting legacy and those who are soon forgotten.</p>\r\n\r\n<p>Which group do you want to be a part of?</p>\r\n\r\n<p>You can take 100% control over your present and future. You have the ability to condition your thoughts, actions, and methods of living life for more fulfilling results.</p>\r\n\r\n<p>TJ Walker is the founder of Createocracy and the developer of Selfie-Speaking Programming audios, a system where you create your own audio &quot;infomercial&quot; to rewire your brain.</p>\r\n\r\n<p>If you are ready to live a more active life, develop your own creative projects and live a healthier and more meaningful life, then sign up today for this&nbsp;<strong>Complete Personal Development Personal Transformation&nbsp;</strong>Course on Createocracy.</p>\r\n\r\n<p>TJ Walker has conducted personal development workshops in more than 30 countries around the globe. He is the author of 6 books on personal development and is one of Udemy&#39;s most popular&nbsp;<strong>personal development</strong>&nbsp;instructors with more than 200,000 students here.</p>', 1, '346627381', '00:06:36', '2023-05-14 01:57:35', '2023-05-14 01:57:35', NULL),
(50, 20, 'This is Creativity', '<p><strong>Personal Development, Personal Transformation</strong>, and Finding Your&nbsp;<strong>Life Purpose</strong>&nbsp;- All humans grapple with these topics, but only some create a meaningful process for living life to its full potential. This is the longest, most thorough, and detailed&nbsp;<strong>Personal Development and Personal Transformation&nbsp;</strong>course available on this platform!</p>\r\n\r\n<p>TJ Walker has been leading&nbsp;<strong>personal development</strong>&nbsp;seminars around the globe for more than 30 years. His unique approach to becoming a creative and fulfilled human being takes the best of the traditional&nbsp;<strong>self-development world&nbsp;</strong>and fuses it with 2020s realities and unique technology solutions using your cell phone in a liberating rather than enslaving manner.</p>\r\n\r\n<p>We live in a modern world of overabundance everywhere. We face an overabundance of stimulation and content coming at us from our cell phones and screens. We are drowning in an overabundance of stuff, junk, and possessions that arrive cheaply and near-instantly from Amazon and your favorite superstore. And we are overwhelmed with giant portions of fat and sugar-filled food and snacks made avail to use every waking moment.</p>', 1, '348304224', '00:06:36', '2023-05-14 01:58:07', '2023-05-14 01:58:07', NULL),
(51, 20, 'If You Learn to Type, You Can Learn to Create', '<p><strong>Personal Development, Personal Transformation</strong>, and Finding Your&nbsp;<strong>Life Purpose</strong>&nbsp;- All humans grapple with these topics, but only some create a meaningful process for living life to its full potential. This is the longest, most thorough, and detailed&nbsp;<strong>Personal Development and Personal Transformation&nbsp;</strong>course available on this platform!</p>\r\n\r\n<p>TJ Walker has been leading&nbsp;<strong>personal development</strong>&nbsp;seminars around the globe for more than 30 years. His unique approach to becoming a creative and fulfilled human being takes the best of the traditional&nbsp;<strong>self-development world&nbsp;</strong>and fuses it with 2020s realities and unique technology solutions using your cell phone in a liberating rather than enslaving manner.</p>\r\n\r\n<p>We live in a modern world of overabundance everywhere. We face an overabundance of stimulation and content coming at us from our cell phones and screens. We are drowning in an overabundance of stuff, junk, and possessions that arrive cheaply and near-instantly from Amazon and your favorite superstore. And we are overwhelmed with giant portions of fat and sugar-filled food and snacks made avail to use every waking moment.</p>', 1, '343467421', '00:07:36', '2023-05-14 01:58:26', '2023-05-14 01:58:26', NULL),
(52, 21, 'Welcome and Course Introduction', '<p><strong>The English Master Course: Learn English Grammar, English Speaking, English Punctuation, and English pronunciation.</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>Udemy&#39;s best-selling English course!</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>**New 2023 Update</strong>: Brand new accent training section added. Build the perfect American or British accent.</p>\r\n\r\n<p>Over 500 new grammar/IELTS/TOEFL interactive practice questions added.<strong>**</strong></p>\r\n\r\n<p><strong>Are you ready to master the English language?</strong>&nbsp;Are you tired of learning the same simple topics and never really getting better at English speaking or English grammar? This course will fix all those problems. This has been one of the top Udemy English courses for many years, and that is because we care about our students.</p>\r\n\r\n<p>The English master course covers all areas of English learning. English grammar, English speaking, and English writing (punctuation). There are over 40 hours of video lessons, hundreds of examples and practice problems, and full-length PDFs.</p>', 1, '313045749', '00:00:40', '2023-05-14 02:01:20', '2023-05-14 02:01:20', NULL),
(53, 21, 'Course Navigation and Course Outline', '<p><strong>English Pronunciation Section:</strong>&nbsp;Build the perfect English accent. The accent training section covers all the sounds of the English language. Learn how to make each sound correctly. In addition, train your accent with professional voice actors using state-of-the-art accent training activities. Pick an American or British accent.</p>\r\n\r\n<p><strong>After using this course</strong>, you will ace tough English grammar tests such as A1, A2, B1, B2, C1, TOEFL, IETLS, AND TOEIC. You will sound more professional at work and may even get that new job or promotion you want. You will impress people with your new advanced English level. Your English grammar, English speaking, and English writing will all improve. You will develop a British or American accent and sound fluent.</p>\r\n\r\n<p><strong>Students love this course. See what some of them have to say about it:</strong></p>\r\n\r\n<p>Verberly C.</p>\r\n\r\n<p>***** - 5 stars</p>\r\n\r\n<p>&quot;I have been using Course for success for over 2 years now, it was relevant then and even more so now, I always refer now and again to refresh my skills. The instructions are lessons are easy to follow and I am happy to be able to learn at my own pace.&quot;</p>\r\n\r\n<p>Sandesh K</p>\r\n\r\n<p>***** - 5 stars</p>\r\n\r\n<p>&quot;I&#39;m a newbie in this course and really enjoying it. The best part is that the instructor is always there to answer your question don&#39;t matter how many times you ask.&quot;</p>', 1, '346627381', '00:05:00', '2023-05-14 02:01:49', '2023-05-14 02:01:49', NULL),
(54, 22, 'Section Overview', '<p><strong>The English Master Course: Learn English Grammar, English Speaking, English Punctuation, and English pronunciation.</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>Udemy&#39;s best-selling English course!</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>**New 2023 Update</strong>: Brand new accent training section added. Build the perfect American or British accent.</p>\r\n\r\n<p>Over 500 new grammar/IELTS/TOEFL interactive practice questions added.<strong>**</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>Are you ready to master the English language?</strong>&nbsp;Are you tired of learning the same simple topics and never really getting better at English speaking or English grammar? This course will fix all those problems. This has been one of the top Udemy English courses for many years, and that is because we care about our students.</p>\r\n\r\n<p>The English master course covers all areas of English learning. English grammar, English speaking, and English writing (punctuation). There are over 40 hours of video lessons, hundreds of examples and practice problems, and full-length PDFs.</p>\r\n\r\n<p>This course is HUGE. Basically 4 courses in 1.</p>', 1, '348304224', '00:06:42', '2023-05-14 02:02:27', '2023-05-14 02:02:27', NULL),
(55, 22, 'The Parts of an English Sentence', '<p><strong>Students love this course. See what some of them have to say about it:</strong></p>\r\n\r\n<p>Verberly C.</p>\r\n\r\n<p>***** - 5 stars</p>\r\n\r\n<p>&quot;I have been using Course for success for over 2 years now, it was relevant then and even more so now, I always refer now and again to refresh my skills. The instructions are lessons are easy to follow and I am happy to be able to learn at my own pace.&quot;</p>\r\n\r\n<p>Sandesh K</p>\r\n\r\n<p>***** - 5 stars</p>\r\n\r\n<p>&quot;I&#39;m a newbie in this course and really enjoying it. The best part is that the instructor is always there to answer your question don&#39;t matter how many times you ask.&quot;</p>\r\n\r\n<p><strong>This is a SUPER course. 4 full courses in 1. You get English grammar, English speaking, English writing, and English pronunciation.</strong></p>\r\n\r\n<p>Great for all levels. Beginners, intermediate, and advanced.</p>\r\n\r\n<p>I guarantee everything you need to become a PRO English language user is in this English master Course. This is the only course that teaches you&nbsp;<strong>English grammar in use</strong>&nbsp;and also shows you how to use it in real&nbsp;<strong>English speaking and conversation&nbsp;</strong>so you can improve all areas of the English language.</p>', 1, '348304224', '00:15:05', '2023-05-14 02:02:46', '2023-05-14 02:02:46', NULL),
(56, 22, 'Adjectives, Adverbs, Determiners, and More', '<p><strong>The English Master Course: Learn English Grammar, English Speaking, English Punctuation, and English pronunciation.</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>Udemy&#39;s best-selling English course!</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>**New 2023 Update</strong>: Brand new accent training section added. Build the perfect American or British accent.</p>\r\n\r\n<p>Over 500 new grammar/IELTS/TOEFL interactive practice questions added.<strong>**</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>Are you ready to master the English language?</strong>&nbsp;Are you tired of learning the same simple topics and never really getting better at English speaking or English grammar? This course will fix all those problems. This has been one of the top Udemy English courses for many years, and that is because we care about our students.</p>\r\n\r\n<p>The English master course covers all areas of English learning. English grammar, English speaking, and English writing (punctuation). There are over 40 hours of video lessons, hundreds of examples and practice problems, and full-length PDFs.</p>\r\n\r\n<p>This course is HUGE. Basically 4 courses in 1.</p>\r\n\r\n<p><strong>English Grammar Section:&nbsp;</strong>Over 90 different English grammar topics. No other course covers as many English Grammar topics. Full video lessons and conversations showing you the English grammar in use. You will learn to score higher on your English exams like TOEIC, IELTS, or TOEFL. Hundred of practice problems and examples. Full-length PDFs for offline learning.</p>', 1, '344610920', '00:06:36', '2023-05-14 02:03:07', '2023-05-14 02:03:07', NULL),
(57, 23, 'English Grammar Section', '<p><strong>This is a SUPER course. 4 full courses in 1. You get English grammar, English speaking, English writing, and English pronunciation.</strong></p>\r\n\r\n<p>Great for all levels. Beginners, intermediate, and advanced.</p>\r\n\r\n<p>I guarantee everything you need to become a PRO English language user is in this English master Course. This is the only course that teaches you&nbsp;<strong>English grammar in use</strong>&nbsp;and also shows you how to use it in real&nbsp;<strong>English speaking and conversation&nbsp;</strong>so you can improve all areas of the English language.</p>\r\n\r\n<p>Every topic has dozens of useful&nbsp;<strong>English&nbsp;</strong>examples, video lectures, guided practice, and real-life English conversations. Hundreds of worksheet pdfs full of practice problems to help you&nbsp;<strong>learn the English language.</strong></p>\r\n\r\n<p>The creator of this course is a real-life university professor and will answer any questions you have 24/7. Start learning English the easy way! Add the course to your cart and we can begin.</p>\r\n\r\n<p>-----------------</p>\r\n\r\n<p>Message from Scott, the course creator:</p>\r\n\r\n<p>Hello, all native English language enthusiasts with the zeal to learn English grammar, use punctuation marks for writing, and become the best at speaking English. I welcome you all to my course page. I have been teaching the English language for many years and have seen most people are still insecure about their use of English. It is possible to master English grammar and English speaking. I will help you be confident when you speak and write.</p>', 1, '343467421', '00:00:40', '2023-05-14 02:03:35', '2023-05-14 02:03:35', NULL),
(58, 24, 'Welcome To The Course!', '<p>Learn the incredibly popular and in demand Laravel framework. There are countless Laravel courses in the world; here&#39;s what makes this one unique:</p>\r\n\r\n<ul>\r\n	<li>\r\n	<p>No assumptions that you already understand the PHP&nbsp;language.</p>\r\n	</li>\r\n	<li>\r\n	<p>No assumptions that you already understand the &quot;Model View Controller&quot;&nbsp;pattern.</p>\r\n	</li>\r\n	<li>\r\n	<p>No assumptions that you already understand how to setup a dev environment on your computer.</p>\r\n	</li>\r\n	<li>\r\n	<p>No assumptions that you already understand how to deploy a website.</p>\r\n	</li>\r\n	<li>\r\n	<p>No assumptions that you already understand the Linux command-line.</p>\r\n	</li>\r\n</ul>\r\n\r\n<p>Laravel is an amazing framework, but because it is so feature-complete I&#39;ve noticed that a lot of guides and tutorials get overly ambitious and introduce 10 or 20 new concepts in a single lesson which is frustrating when you&#39;re a beginner and you&#39;re trying to actually understand&nbsp;<strong>why</strong>&nbsp;you&#39;re doing what you&#39;re doing. I&#39;ve also noticed a lot of tutorials assume you&#39;ve already used lots of other web application frameworks before Laravel, and so they don&#39;t actually explain any of the organizational or conceptual pieces of the puzzle.</p>', 1, '346627381', '00:00:36', '2023-05-14 02:07:19', '2023-05-14 02:07:19', NULL),
(59, 24, 'Quick Note About Our Text Editor And Extensions', '<p>This course is different because I&nbsp;assume that Laravel is the&nbsp;<strong>first</strong>&nbsp;web application framework you&#39;ve ever attempted to learn, and so we move at a pace where you can actually absorb the big-picture concepts that exist in all frameworks; not just Laravel.</p>\r\n\r\n<p>Here&#39;s what we&#39;ll learn in the course:</p>\r\n\r\n<ul>\r\n	<li>\r\n	<p>The PHP&nbsp;language itself</p>\r\n	</li>\r\n	<li>\r\n	<p>Getting our computer ready for Laravel</p>\r\n	</li>\r\n	<li>\r\n	<p>User registration, log in, log out</p>\r\n	</li>\r\n	<li>\r\n	<p>Profile Photo Upload (server-side resize &amp;&nbsp;storage)</p>\r\n	</li>\r\n	<li>\r\n	<p>The Blade Template Engine</p>\r\n	</li>\r\n	<li>\r\n	<p>Composer the PHP&nbsp;Dependency Manager</p>\r\n	</li>\r\n	<li>\r\n	<p>Form Validation</p>\r\n	</li>\r\n	<li>\r\n	<p>Gates, Policies, Permissions (e.g. You can only edit your own posts and not other people&#39;s posts)</p>\r\n	</li>\r\n	<li>\r\n	<p>Relationships; letting one user follow another user</p>\r\n	</li>\r\n	<li>\r\n	<p>How to use Models to query for the exact data you want (e.g. homepage feed of posts from the users you follow)</p>\r\n	</li>\r\n	<li>\r\n	<p>How to send automated emails from your app</p>\r\n	</li>\r\n	<li>\r\n	<p>Add API URLS that allow users to login and create &amp; delete posts from outside the context of a web browser</p>\r\n	</li>\r\n	<li>\r\n	<p>Use Docker to practice deploying to a Linux server</p>\r\n	</li>\r\n	<li>\r\n	<p>Configure a real public Ubuntu VPS&nbsp;to host our Laravel app with a real domain</p>\r\n	</li>\r\n	<li>\r\n	<p>Setup our VPS&nbsp;as a Git server that you can push to for effortless future updates to your live site</p>\r\n	</li>\r\n</ul>', 1, '344610920', '00:07:36', '2023-05-14 02:07:39', '2023-05-14 02:07:39', NULL),
(60, 24, 'Windows: Installing PHP', '<p>&nbsp;encourage you to watch the freely available first lesson titled &quot;Welcome To The Course&quot; to get a better feel for the course.</p>\r\n\r\n<p>This course may be brand new, but this isn&rsquo;t my first time teaching. I&rsquo;ve led training sessions for Fortune 500 companies and I&rsquo;ve already helped over 200,000 people on Udemy and received the following feedback:</p>\r\n\r\n<p>&quot;Brad definitely has some of the best techniques to embed the lesson into your mind&hellip; hands down these are the best tutorials I have had the opportunity to view.&quot;</p>\r\n\r\n<p>&quot;Presentation is concise without being tedious&hellip; you honestly feel that you have a thorough understanding of the subject.&quot;</p>\r\n\r\n<p>&quot;&hellip;[Brad] explained the process. Not memorize this or that, he explained the process. If you&#39;re looking to take a course to understand the foundations of creating websites, look no further.&quot;</p>', 1, '348304224', '00:07:36', '2023-05-14 02:08:02', '2023-05-14 02:08:02', NULL),
(61, 25, 'Using Composer To Create a Laravel Project', '<p>Learn the incredibly popular and in demand Laravel framework. There are countless Laravel courses in the world; here&#39;s what makes this one unique:</p>\r\n\r\n<ul>\r\n	<li>\r\n	<p>No assumptions that you already understand the PHP&nbsp;language.</p>\r\n	</li>\r\n	<li>\r\n	<p>No assumptions that you already understand the &quot;Model View Controller&quot;&nbsp;pattern.</p>\r\n	</li>\r\n	<li>\r\n	<p>No assumptions that you already understand how to setup a dev environment on your computer.</p>\r\n	</li>\r\n	<li>\r\n	<p>No assumptions that you already understand how to deploy a website.</p>\r\n	</li>\r\n	<li>\r\n	<p>No assumptions that you already understand the Linux command-line.</p>\r\n	</li>\r\n</ul>', 1, '348304224', '00:15:05', '2023-05-14 02:09:00', '2023-05-14 02:09:00', NULL),
(62, 25, 'How To Use The Reference Zip Files In This Course', '<p>This course is different because I&nbsp;assume that Laravel is the&nbsp;<strong>first</strong>&nbsp;web application framework you&#39;ve ever attempted to learn, and so we move at a pace where you can actually absorb the big-picture concepts that exist in all frameworks; not just Laravel.</p>\r\n\r\n<p>Here&#39;s what we&#39;ll learn in the course:</p>\r\n\r\n<ul>\r\n	<li>\r\n	<p>The PHP&nbsp;language itself</p>\r\n	</li>\r\n	<li>\r\n	<p>Getting our computer ready for Laravel</p>\r\n	</li>\r\n	<li>\r\n	<p>User registration, log in, log out</p>\r\n	</li>\r\n	<li>\r\n	<p>Profile Photo Upload (server-side resize &amp;&nbsp;storage)</p>\r\n	</li>\r\n	<li>\r\n	<p>The Blade Template Engine</p>\r\n	</li>\r\n	<li>\r\n	<p>Composer the PHP&nbsp;Dependency Manager</p>\r\n	</li>\r\n	<li>\r\n	<p>Form Validation</p>\r\n	</li>\r\n	<li>\r\n	<p>Gates, Policies, Permissions (e.g. You can only edit your own posts and not other people&#39;s posts)</p>\r\n	</li>\r\n	<li>\r\n	<p>Relationships; letting one user follow another user</p>\r\n	</li>\r\n	<li>\r\n	<p>How to use Models to query for the exact data you want (e.g. homepage feed of posts from the users you follow)</p>\r\n	</li>\r\n	<li>\r\n	<p>How to send automated emails from your app</p>\r\n	</li>\r\n	<li>\r\n	<p>Add API URLS that allow users to login and create &amp; delete posts from outside the context of a web browser</p>\r\n	</li>\r\n	<li>\r\n	<p>Use Docker to practice deploying to a Linux server</p>\r\n	</li>\r\n	<li>\r\n	<p>Configure a real public Ubuntu VPS&nbsp;to host our Laravel app with a real domain</p>\r\n	</li>\r\n	<li>\r\n	<p>Setup our VPS&nbsp;as a Git server that you can push to for effortless future updates to your live site</p>\r\n	</li>\r\n</ul>', 1, '346627381', '00:05:00', '2023-05-14 02:09:18', '2023-05-14 02:09:18', NULL),
(63, 25, 'What Is A View? What Is Blade?', '<p>Laravel is an amazing framework, but because it is so feature-complete I&#39;ve noticed that a lot of guides and tutorials get overly ambitious and introduce 10 or 20 new concepts in a single lesson which is frustrating when you&#39;re a beginner and you&#39;re trying to actually understand&nbsp;<strong>why</strong>&nbsp;you&#39;re doing what you&#39;re doing. I&#39;ve also noticed a lot of tutorials assume you&#39;ve already used lots of other web application frameworks before Laravel, and so they don&#39;t actually explain any of the organizational or conceptual pieces of the puzzle.</p>\r\n\r\n<p>This course is different because I&nbsp;assume that Laravel is the&nbsp;<strong>first</strong>&nbsp;web application framework you&#39;ve ever attempted to learn, and so we move at a pace where you can actually absorb the big-picture concepts that exist in all frameworks; not just Laravel.</p>', 1, '343467421', '00:06:37', '2023-05-14 02:11:04', '2023-05-14 02:11:04', NULL),
(64, 26, 'Install MySQL (Windows)', '<p>Learn the incredibly popular and in demand Laravel framework. There are countless Laravel courses in the world; here&#39;s what makes this one unique:</p>\r\n\r\n<ul>\r\n	<li>\r\n	<p>No assumptions that you already understand the PHP&nbsp;language.</p>\r\n	</li>\r\n	<li>\r\n	<p>No assumptions that you already understand the &quot;Model View Controller&quot;&nbsp;pattern.</p>\r\n	</li>\r\n	<li>\r\n	<p>No assumptions that you already understand how to setup a dev environment on your computer.</p>\r\n	</li>\r\n	<li>\r\n	<p>No assumptions that you already understand how to deploy a website.</p>\r\n	</li>\r\n	<li>\r\n	<p>No assumptions that you already understand the Linux command-line.</p>\r\n	</li>\r\n</ul>', 1, '313045749', '00:01:22', '2023-05-14 02:11:24', '2023-05-14 02:11:24', NULL),
(65, 26, 'Connecting Laravel To Our Database', '<p>Laravel is an amazing framework, but because it is so feature-complete I&#39;ve noticed that a lot of guides and tutorials get overly ambitious and introduce 10 or 20 new concepts in a single lesson which is frustrating when you&#39;re a beginner and you&#39;re trying to actually understand&nbsp;<strong>why</strong>&nbsp;you&#39;re doing what you&#39;re doing. I&#39;ve also noticed a lot of tutorials assume you&#39;ve already used lots of other web application frameworks before Laravel, and so they don&#39;t actually explain any of the organizational or conceptual pieces of the puzzle.</p>\r\n\r\n<p>This course is different because I&nbsp;assume that Laravel is the&nbsp;<strong>first</strong>&nbsp;web application framework you&#39;ve ever attempted to learn, and so we move at a pace where you can actually absorb the big-picture concepts that exist in all frameworks; not just Laravel.</p>\r\n\r\n<p>Here&#39;s what we&#39;ll learn in the course:</p>\r\n\r\n<ul>\r\n	<li>\r\n	<p>The PHP&nbsp;language itself</p>\r\n	</li>\r\n	<li>\r\n	<p>Getting our computer ready for Laravel</p>\r\n	</li>\r\n	<li>\r\n	<p>User registration, log in, log out</p>\r\n	</li>\r\n</ul>', 1, '346627381', '00:05:30', '2023-05-14 02:11:41', '2023-05-14 02:11:41', NULL),
(66, 27, 'Logging Out & Misc Details', '<p>This course is different because I&nbsp;assume that Laravel is the&nbsp;<strong>first</strong>&nbsp;web application framework you&#39;ve ever attempted to learn, and so we move at a pace where you can actually absorb the big-picture concepts that exist in all frameworks; not just Laravel.</p>\r\n\r\n<p>Here&#39;s what we&#39;ll learn in the course:</p>\r\n\r\n<ul>\r\n	<li>\r\n	<p>The PHP&nbsp;language itself</p>\r\n	</li>\r\n	<li>\r\n	<p>Getting our computer ready for Laravel</p>\r\n	</li>\r\n	<li>\r\n	<p>User registration, log in, log out</p>\r\n	</li>\r\n	<li>\r\n	<p>Profile Photo Upload (server-side resize &amp;&nbsp;storage)</p>\r\n	</li>\r\n	<li>\r\n	<p>The Blade Template Engine</p>\r\n	</li>\r\n	<li>\r\n	<p>Composer the PHP&nbsp;Dependency Manager</p>\r\n	</li>\r\n	<li>\r\n	<p>Form Validation</p>\r\n	</li>\r\n	<li>\r\n	<p>Gates, Policies, Permissions (e.g. You can only edit your own posts and not other people&#39;s posts)</p>\r\n	</li>\r\n	<li>\r\n	<p>Relationships; letting one user follow another user</p>\r\n	</li>\r\n	<li>\r\n	<p>How to use Models to query for the exact data you want (e.g. homepage feed of posts from the users you follow)</p>\r\n	</li>\r\n	<li>\r\n	<p>How to send automated emails from your app</p>\r\n	</li>\r\n	<li>\r\n	<p>Add API URLS that allow users to login and create &amp; delete posts from outside the context of a web browser</p>\r\n	</li>\r\n	<li>\r\n	<p>Use Docker to practice deploying to a Linux server</p>\r\n	</li>\r\n	<li>\r\n	<p>Configure a real public Ubuntu VPS&nbsp;to host our Laravel app with a real domain</p>\r\n	</li>\r\n	<li>\r\n	<p>Setup our VPS&nbsp;as a Git server that you can push to for effortless future updates to your live site</p>\r\n	</li>\r\n</ul>', 1, '344610920', '00:02:36', '2023-05-14 02:12:09', '2023-05-14 02:12:09', NULL),
(67, 28, 'Welcome to the Course | Personal Finance Course', '<p><strong>This online personal finance course will teach you how to master your money, how to grow your income, reduce your debt, budget the smart way, invest your money, and much more!</strong></p>\r\n\r\n<ul>\r\n	<li>Do you need help handling your money?</li>\r\n	<li>Can you imagine a life of financial freedom?</li>\r\n	<li>Do you want to make more money?</li>\r\n	<li>Are you interested in investing but just don&rsquo;t know where to start?</li>\r\n	<li>Have you struggled with credit card or student loan debt?</li>\r\n	<li>Do you want to own a home?</li>\r\n</ul>\r\n\r\n<p>If you answered yes to any of these questions, you&rsquo;re in the right place. We know how hard it is to get by in the modern world. We understand your struggles. Heck, we&rsquo;ve lived them. But we&rsquo;ve been able to turn it around ourselves, to not just survive but to THRIVE!</p>\r\n\r\n<p><strong>Phil paid off over $140,000 in student loan debt&nbsp;</strong>and built a 6-figure side business within 5 years of college graduation.&nbsp;<strong>Mike &amp; Lauren are on the path towards super-early retirement,</strong>&nbsp;are the ultimate personal finance hackers, and are currently traveling the country with their newborn son.</p>', 1, '348304224', '00:03:30', '2023-05-14 02:15:23', '2023-05-14 02:15:23', NULL),
(68, 28, 'The Golden Rule of Personal Finance | Personal Finance Course', '<p><strong>This isn&rsquo;t your traditional personal finance course.</strong>&nbsp;We&rsquo;re not bankers or creditors. We&rsquo;re not trust fund babies who haven&rsquo;t worked for themselves. We&rsquo;re just like you, and that&rsquo;s what this course is all about. This is a course that teaches normal people like you the skills and knowledge to truly understand how money works. We show you the path towards financial freedom.</p>\r\n\r\n<p>This online personal finance course covers all of the following topics:</p>\r\n\r\n<ul>\r\n	<li><strong>Understand Your Money</strong></li>\r\n	<li><strong>Budgeting, Savings, Reducing Expenses</strong></li>\r\n	<li><strong>Grow Your Income</strong></li>\r\n	<li><strong>Understanding Credit Cards</strong></li>\r\n	<li><strong>Loans, Debt, Debt Reduction</strong></li>\r\n	<li><strong>Investing 101</strong></li>\r\n	<li><strong>Real Estate, Mortgages, and Other Big Ticket Purchases</strong></li>\r\n	<li><strong>Retirement Basics</strong></li>\r\n	<li><strong>Early Retirement Plan &amp; Financial Freedom</strong></li>\r\n	<li><strong>Taxes</strong></li>\r\n	<li><strong>Love &amp; Money</strong></li>\r\n	<li><strong>Youth &amp; Money</strong></li>\r\n	<li><strong>Psychology &amp; Money</strong></li>\r\n</ul>', 1, '348304224', '00:12:30', '2023-05-14 02:15:49', '2023-05-14 02:15:49', NULL),
(69, 28, 'How to Retire Early - in 4 Minutes | Personal Finance Course', '<p><strong>Master your own finances to build wealth for you and your family.</strong></p>\r\n\r\n<p>Regardless of what your financial expertise is or how much money you have in your bank account, this in-depth course is designed to provide you with everything you need to take your finances to the next level.</p>\r\n\r\n<p>Whether you&rsquo;re in debt and don&rsquo;t have a clue where to go from here, or you&rsquo;re just wondering where to invest your money, you&rsquo;ll learn the next steps to success. By truly understanding how things like credit, compound interest, taxes, and investment accounts work, you&rsquo;ll be in a better position for financial freedom.</p>\r\n\r\n<p>By the end of this course, you&rsquo;ll have a better grasp of your own finances. You&rsquo;ll know the next steps towards financial freedom. You&rsquo;ll know how to save more, spend less, and invest smarter. You&rsquo;ll be less stressed and happier. That&#39;s our goal.&nbsp;<strong>Take the first step to financial success with this amazing personal finance course.</strong></p>\r\n\r\n<p><strong>About the instructors:</strong></p>\r\n\r\n<p><strong>Phil Ebiner</strong>&nbsp;started teaching online courses in 2012, and now has over 130,000 happy students on Udemy learning all sorts of things from personal finance and business building to video editing and motion graphics. Phil is passionate about helping people understand their finances and uses tools like video to break down the complexity of these topics.</p>\r\n\r\n<p><strong>Mike and Lauren</strong>&nbsp;are personal finance wizards with a YouTube channel geared at helping others tackle their financial problems. Mike and Lauren don&rsquo;t just talk the talk, but also walk the walk of early retirement and living a financially smart life.</p>', 1, '343467421', '00:02:36', '2023-05-14 02:16:09', '2023-05-14 02:16:09', NULL),
(70, 29, 'Why Your Savings Rate is Very Important | Personal Finance Course', '<p><strong>This online personal finance course will teach you how to master your money, how to grow your income, reduce your debt, budget the smart way, invest your money, and much more!</strong></p>\r\n\r\n<ul>\r\n	<li>Do you need help handling your money?</li>\r\n	<li>Can you imagine a life of financial freedom?</li>\r\n	<li>Do you want to make more money?</li>\r\n	<li>Are you interested in investing but just don&rsquo;t know where to start?</li>\r\n	<li>Have you struggled with credit card or student loan debt?</li>\r\n	<li>Do you want to own a home?</li>\r\n</ul>', 1, '346627381', '00:07:36', '2023-05-14 02:16:36', '2023-05-14 02:16:36', NULL),
(71, 29, 'Easy Ways to Reduce Expenses | Personal Finance Course', '<p>If you answered yes to any of these questions, you&rsquo;re in the right place. We know how hard it is to get by in the modern world. We understand your struggles. Heck, we&rsquo;ve lived them. But we&rsquo;ve been able to turn it around ourselves, to not just survive but to THRIVE!</p>\r\n\r\n<p><strong>Phil paid off over $140,000 in student loan debt&nbsp;</strong>and built a 6-figure side business within 5 years of college graduation.&nbsp;<strong>Mike &amp; Lauren are on the path towards super-early retirement,</strong>&nbsp;are the ultimate personal finance hackers, and are currently traveling the country with their newborn son.</p>', 1, '344610920', '00:09:36', '2023-05-14 02:17:03', '2023-05-14 02:17:03', NULL);
INSERT INTO `course_classes` (`id`, `course_section_id`, `name`, `description`, `state`, `vimeo_id`, `time`, `created_at`, `updated_at`, `deleted_at`) VALUES
(72, 30, 'Section Introduction | Personal Finance Course', '<p>If you answered yes to any of these questions, you&rsquo;re in the right place. We know how hard it is to get by in the modern world. We understand your struggles. Heck, we&rsquo;ve lived them. But we&rsquo;ve been able to turn it around ourselves, to not just survive but to THRIVE!</p>\r\n\r\n<p><strong>Phil paid off over $140,000 in student loan debt&nbsp;</strong>and built a 6-figure side business within 5 years of college graduation.&nbsp;<strong>Mike &amp; Lauren are on the path towards super-early retirement,</strong>&nbsp;are the ultimate personal finance hackers, and are currently traveling the country with their newborn son.</p>\r\n\r\n<p><strong>This isn&rsquo;t your traditional personal finance course.</strong>&nbsp;We&rsquo;re not bankers or creditors. We&rsquo;re not trust fund babies who haven&rsquo;t worked for themselves. We&rsquo;re just like you, and that&rsquo;s what this course is all about. This is a course that teaches normal people like you the skills and knowledge to truly understand how money works. We show you the path towards financial freedom.</p>', 1, '313045749', '00:01:22', '2023-05-14 02:17:32', '2023-05-14 02:17:32', NULL),
(73, 30, 'Increasing Income Versus Reducing Expenses | Personal Finance Course', '<p><strong>This online personal finance course will teach you how to master your money, how to grow your income, reduce your debt, budget the smart way, invest your money, and much more!</strong></p>\r\n\r\n<ul>\r\n	<li>Do you need help handling your money?</li>\r\n	<li>Can you imagine a life of financial freedom?</li>\r\n	<li>Do you want to make more money?</li>\r\n	<li>Are you interested in investing but just don&rsquo;t know where to start?</li>\r\n	<li>Have you struggled with credit card or student loan debt?</li>\r\n	<li>Do you want to own a home?</li>\r\n</ul>\r\n\r\n<p>If you answered yes to any of these questions, you&rsquo;re in the right place. We know how hard it is to get by in the modern world. We understand your struggles. Heck, we&rsquo;ve lived them. But we&rsquo;ve been able to turn it around ourselves, to not just survive but to THRIVE!</p>', 1, '341090511', '00:02:36', '2023-05-14 02:17:51', '2023-05-14 02:17:51', NULL),
(74, 30, 'Side Income: Make Money Outside of the Office | Personal Finance Course', '<p><strong>This online personal finance course will teach you how to master your money, how to grow your income, reduce your debt, budget the smart way, invest your money, and much more!</strong></p>\r\n\r\n<ul>\r\n	<li>Do you need help handling your money?</li>\r\n	<li>Can you imagine a life of financial freedom?</li>\r\n	<li>Do you want to make more money?</li>\r\n	<li>Are you interested in investing but just don&rsquo;t know where to start?</li>\r\n	<li>Have you struggled with credit card or student loan debt?</li>\r\n	<li>Do you want to own a home?</li>\r\n</ul>', 1, '344610920', '00:05:34', '2023-05-14 02:18:09', '2023-05-14 02:18:09', NULL),
(75, 31, 'Section Introduction | Personal Finance Course', '<p>If you answered yes to any of these questions, you&rsquo;re in the right place. We know how hard it is to get by in the modern world. We understand your struggles. Heck, we&rsquo;ve lived them. But we&rsquo;ve been able to turn it around ourselves, to not just survive but to THRIVE!</p>\r\n\r\n<p><strong>Phil paid off over $140,000 in student loan debt&nbsp;</strong>and built a 6-figure side business within 5 years of college graduation.&nbsp;<strong>Mike &amp; Lauren are on the path towards super-early retirement,</strong>&nbsp;are the ultimate personal finance hackers, and are currently traveling the country with their newborn son.</p>\r\n\r\n<p><strong>This isn&rsquo;t your traditional personal finance course.</strong>&nbsp;We&rsquo;re not bankers or creditors. We&rsquo;re not trust fund babies who haven&rsquo;t worked for themselves. We&rsquo;re just like you, and that&rsquo;s what this course is all about. This is a course that teaches normal people like you the skills and knowledge to truly understand how money works. We show you the path towards financial freedom.</p>\r\n\r\n<p>This online personal finance course covers all of the following topics:</p>\r\n\r\n<ul>\r\n	<li><strong>Understand Your Money</strong></li>\r\n	<li><strong>Budgeting, Savings, Reducing Expenses</strong></li>\r\n	<li><strong>Grow Your Income</strong></li>\r\n	<li><strong>Understanding Credit Cards</strong></li>\r\n	<li><strong>Loans, Debt, Debt Reduction</strong></li>\r\n</ul>', 1, '348304224', '00:06:40', '2023-05-14 02:19:50', '2023-05-14 02:19:50', NULL),
(76, 31, 'Credit Card Rewards: Picking the Best Credit Card | Personal Finance Course', '<p><strong>This isn&rsquo;t your traditional personal finance course.</strong>&nbsp;We&rsquo;re not bankers or creditors. We&rsquo;re not trust fund babies who haven&rsquo;t worked for themselves. We&rsquo;re just like you, and that&rsquo;s what this course is all about. This is a course that teaches normal people like you the skills and knowledge to truly understand how money works. We show you the path towards financial freedom.</p>\r\n\r\n<p>This online personal finance course covers all of the following topics:</p>\r\n\r\n<ul>\r\n	<li><strong>Understand Your Money</strong></li>\r\n	<li><strong>Budgeting, Savings, Reducing Expenses</strong></li>\r\n	<li><strong>Grow Your Income</strong></li>\r\n	<li><strong>Understanding Credit Cards</strong></li>\r\n	<li><strong>Loans, Debt, Debt Reduction</strong></li>\r\n	<li><strong>Investing 101</strong></li>\r\n	<li><strong>Real Estate, Mortgages, and Other Big Ticket Purchases</strong></li>\r\n	<li><strong>Retirement Basics</strong></li>\r\n	<li><strong>Early Retirement Plan &amp; Financial Freedom</strong></li>\r\n	<li><strong>Taxes</strong></li>\r\n	<li><strong>Love &amp; Money</strong></li>\r\n</ul>', 1, '343467421', '00:01:30', '2023-05-14 02:20:05', '2023-05-14 02:20:05', NULL),
(77, 32, 'How to Use This Course', '<p><strong>Congratulations,&nbsp;You Found It!</strong></p>\r\n\r\n<p>The Most Complete Course on&nbsp;<strong>Digital Marketing</strong>, with&nbsp;<strong>24 Courses in 1!</strong></p>\r\n\r\n<p>Instead of buying 24 different Courses about Digital Marketing -<strong>&nbsp;<em>This Course Will Cover All Your Digital Marketing Needs.</em></strong></p>\r\n\r\n<p>This is a&nbsp;<strong>100% Practical Course</strong>&nbsp;- Get Ready for Hands-On Experience from the First Lecture!</p>\r\n\r\n<p><strong>Take A Look at&nbsp;These&nbsp;Top Rated Reviews...</strong></p>\r\n\r\n<p><em>This is a whole University degree, for such a little amount of money.</em>&nbsp;<strong>- Livingstone Ayehangane</strong></p>\r\n\r\n<p><em>Buying this course was the most important decision i ever made in my career.</em>&nbsp;<strong>- Mohamed Saeed</strong></p>\r\n\r\n<p><em>Robin and jesper are no doubt one of the best digital marketing experts and teachers out there, I love this course.</em>&nbsp;<strong>- Shaheer Farrukh</strong></p>\r\n\r\n<p><em>The best course ever. You can always come back to any part of the course if you need to. Amazing updates and golden value. This is my go to bible for everything I do. Would be lost without it.</em>&nbsp;<strong>- Rajaa Zaidi</strong></p>', 1, '346627381', '00:03:30', '2023-05-14 02:23:08', '2023-05-14 02:23:08', NULL),
(78, 32, 'What Exactly is Digital Marketing?', '<p><strong>Congratulations,&nbsp;You Found It!</strong></p>\r\n\r\n<p>The Most Complete Course on&nbsp;<strong>Digital Marketing</strong>, with&nbsp;<strong>24 Courses in 1!</strong></p>\r\n\r\n<p>Instead of buying 24 different Courses about Digital Marketing -<strong>&nbsp;<em>This Course Will Cover All Your Digital Marketing Needs.</em></strong></p>\r\n\r\n<p>This is a&nbsp;<strong>100% Practical Course</strong>&nbsp;- Get Ready for Hands-On Experience from the First Lecture!</p>\r\n\r\n<p><strong>Take A Look at&nbsp;These&nbsp;Top Rated Reviews...</strong></p>\r\n\r\n<p><em>This is a whole University degree, for such a little amount of money.</em>&nbsp;<strong>- Livingstone Ayehangane</strong></p>\r\n\r\n<p><em>Buying this course was the most important decision i ever made in my career.</em>&nbsp;<strong>- Mohamed Saeed</strong></p>\r\n\r\n<p><em>Robin and jesper are no doubt one of the best digital marketing experts and teachers out there, I love this course.</em>&nbsp;<strong>- Shaheer Farrukh</strong></p>\r\n\r\n<p><em>The best course ever. You can always come back to any part of the course if you need to. Amazing updates and golden value. This is my go to bible for everything I do. Would be lost without it.</em>&nbsp;<strong>- Rajaa Zaidi</strong></p>', 1, '344610920', '00:05:34', '2023-05-14 02:23:22', '2023-05-14 02:23:22', NULL),
(79, 32, 'Market Research Explained', '<p><strong>Course Goals:</strong></p>\r\n\r\n<ul>\r\n	<li>\r\n	<p>Grow Your Business Online</p>\r\n	</li>\r\n	<li>\r\n	<p>Get Hired as a Digital Marketing Expert</p>\r\n	</li>\r\n	<li>\r\n	<p>Work as a Digital Marketing Freelancer</p>\r\n	</li>\r\n</ul>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>Includes:</strong></p>\r\n\r\n<p><strong>&nbsp; &nbsp; &nbsp; &nbsp; DIGITAL&nbsp;MARKETING&nbsp;STRATEGY</strong></p>\r\n\r\n<ol>\r\n	<li>\r\n	<p>Market Research</p>\r\n	</li>\r\n	<li>\r\n	<p>Set Up a Website</p>\r\n	</li>\r\n	<li>\r\n	<p>SEO&nbsp;(Search Enginge Optimization)</p>\r\n	</li>\r\n	<li>\r\n	<p>Email Marketing</p>\r\n	</li>\r\n	<li>\r\n	<p>Google Analytics</p>\r\n\r\n	<p><br />\r\n	<strong>DIGITAL&nbsp;MARKETING&nbsp;IN-DEPTH</strong></p>\r\n	</li>\r\n	<li>\r\n	<p>Prompt Engineering with ChatGPT</p>\r\n	</li>\r\n	<li>\r\n	<p>Branding</p>\r\n	</li>\r\n	<li>\r\n	<p>Content Marketing</p>\r\n	</li>\r\n	<li>\r\n	<p>Sales Psychology</p>\r\n	</li>\r\n	<li>\r\n	<p>Copywriting</p>\r\n	</li>\r\n</ol>', 1, '313045749', '00:06:36', '2023-05-14 02:23:42', '2023-05-14 02:23:42', NULL),
(80, 33, 'Find Target Audience', '<p><strong>Congratulations,&nbsp;You Found It!</strong></p>\r\n\r\n<p>The Most Complete Course on&nbsp;<strong>Digital Marketing</strong>, with&nbsp;<strong>24 Courses in 1!</strong></p>\r\n\r\n<p>Instead of buying 24 different Courses about Digital Marketing -<strong>&nbsp;<em>This Course Will Cover All Your Digital Marketing Needs.</em></strong></p>\r\n\r\n<p>This is a&nbsp;<strong>100% Practical Course</strong>&nbsp;- Get Ready for Hands-On Experience from the First Lecture!</p>\r\n\r\n<p><strong>Take A Look at&nbsp;These&nbsp;Top Rated Reviews...</strong></p>\r\n\r\n<p><em>This is a whole University degree, for such a little amount of money.</em>&nbsp;<strong>- Livingstone Ayehangane</strong></p>\r\n\r\n<p><em>Buying this course was the most important decision i ever made in my career.</em>&nbsp;<strong>- Mohamed Saeed</strong></p>\r\n\r\n<p><em>Robin and jesper are no doubt one of the best digital marketing experts and teachers out there, I love this course.</em>&nbsp;<strong>- Shaheer Farrukh</strong></p>\r\n\r\n<p><em>The best course ever. You can always come back to any part of the course if you need to. Amazing updates and golden value. This is my go to bible for everything I do. Would be lost without it.</em>&nbsp;<strong>- Rajaa Zaidi</strong></p>', 1, '346627381', '00:07:36', '2023-05-14 02:24:10', '2023-05-14 02:24:10', NULL),
(81, 33, 'Exercise - Find Digital Marketing Channels', '<p><strong>Course Goals:</strong></p>\r\n\r\n<ul>\r\n	<li>\r\n	<p>Grow Your Business Online</p>\r\n	</li>\r\n	<li>\r\n	<p>Get Hired as a Digital Marketing Expert</p>\r\n	</li>\r\n	<li>\r\n	<p>Work as a Digital Marketing Freelancer</p>\r\n	</li>\r\n</ul>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>Includes:</strong></p>\r\n\r\n<p><strong>&nbsp; &nbsp; &nbsp; &nbsp; DIGITAL&nbsp;MARKETING&nbsp;STRATEGY</strong></p>\r\n\r\n<ol>\r\n	<li>\r\n	<p>Market Research</p>\r\n	</li>\r\n	<li>\r\n	<p>Set Up a Website</p>\r\n	</li>\r\n	<li>\r\n	<p>SEO&nbsp;(Search Enginge Optimization)</p>\r\n	</li>\r\n	<li>\r\n	<p>Email Marketing</p>\r\n	</li>\r\n	<li>\r\n	<p>Google Analytics</p>\r\n\r\n	<p><br />\r\n	<strong>DIGITAL&nbsp;MARKETING&nbsp;IN-DEPTH</strong></p>\r\n	</li>\r\n	<li>\r\n	<p>Prompt Engineering with ChatGPT</p>\r\n	</li>\r\n	<li>\r\n	<p>Branding</p>\r\n	</li>\r\n	<li>\r\n	<p>Content Marketing</p>\r\n	</li>\r\n	<li>\r\n	<p>Sales Psychology</p>\r\n	</li>\r\n	<li>\r\n	<p>Copywriting</p>\r\n\r\n	<p><br />\r\n	<strong>DIGITAL&nbsp;MARKETING&nbsp;CHANNELS</strong></p>\r\n	</li>\r\n	<li>\r\n	<p>Google Ads</p>\r\n	</li>\r\n	<li>\r\n	<p>YouTube Ads</p>\r\n	</li>\r\n	<li>\r\n	<p>Facebook Ads</p>\r\n	</li>\r\n	<li>\r\n	<p>Facebook Marketing</p>\r\n	</li>\r\n	<li>\r\n	<p>Instagram Marketing</p>\r\n	</li>\r\n	<li>\r\n	<p>YouTube Marketing</p>\r\n	</li>\r\n	<li>\r\n	<p>Pinterest Marketing</p>\r\n	</li>\r\n	<li>\r\n	<p>LinkedIn Marketing</p>\r\n	</li>\r\n	<li>\r\n	<p>Quora Marketing</p>\r\n	</li>\r\n	<li>\r\n	<p>Twitter Marketing</p>\r\n	</li>\r\n	<li>\r\n	<p>Content&nbsp;Marketing Machine</p>\r\n\r\n	<p><br />\r\n	<strong>DIGITAL&nbsp;MARKETING&nbsp;PROFESSIONAL</strong></p>\r\n	</li>\r\n	<li>\r\n	<p>Digital Marketing Freelancing</p>\r\n	</li>\r\n	<li>\r\n	<p>WordPress Masterclass</p>\r\n	</li>\r\n	<li>\r\n	<p>SEO Masterclass</p>\r\n\r\n	<p>&nbsp;</p>\r\n	</li>\r\n</ol>', 1, '348304224', '00:00:40', '2023-05-14 02:24:35', '2023-05-14 02:24:35', NULL),
(82, 34, 'Why You Need a Marketing Strategy', '<p><strong>Congratulations,&nbsp;You Found It!</strong></p>\r\n\r\n<p>The Most Complete Course on&nbsp;<strong>Digital Marketing</strong>, with&nbsp;<strong>24 Courses in 1!</strong></p>\r\n\r\n<p>Instead of buying 24 different Courses about Digital Marketing -<strong>&nbsp;<em>This Course Will Cover All Your Digital Marketing Needs.</em></strong></p>\r\n\r\n<p>This is a&nbsp;<strong>100% Practical Course</strong>&nbsp;- Get Ready for Hands-On Experience from the First Lecture!</p>\r\n\r\n<p><strong>Take A Look at&nbsp;These&nbsp;Top Rated Reviews...</strong></p>\r\n\r\n<p><em>This is a whole University degree, for such a little amount of money.</em>&nbsp;<strong>- Livingstone Ayehangane</strong></p>\r\n\r\n<p><em>Buying this course was the most important decision i ever made in my career.</em>&nbsp;<strong>- Mohamed Saeed</strong></p>\r\n\r\n<p><em>Robin and jesper are no doubt one of the best digital marketing experts and teachers out there, I love this course.</em>&nbsp;<strong>- Shaheer Farrukh</strong></p>\r\n\r\n<p><em>The best course ever. You can always come back to any part of the course if you need to. Amazing updates and golden value. This is my go to bible for everything I do. Would be lost without it.</em>&nbsp;<strong>- Rajaa Zaidi</strong></p>', 1, '348304224', '00:00:40', '2023-05-14 02:25:09', '2023-05-14 02:25:09', NULL),
(83, 35, 'What You\'ll Get', '<p><strong>Course Goals:</strong></p>\r\n\r\n<ul>\r\n	<li>\r\n	<p>Grow Your Business Online</p>\r\n	</li>\r\n	<li>\r\n	<p>Get Hired as a Digital Marketing Expert</p>\r\n	</li>\r\n	<li>\r\n	<p>Work as a Digital Marketing Freelancer</p>\r\n	</li>\r\n</ul>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>Includes:</strong></p>\r\n\r\n<p><strong>&nbsp; &nbsp; &nbsp; &nbsp; DIGITAL&nbsp;MARKETING&nbsp;STRATEGY</strong></p>\r\n\r\n<ol>\r\n	<li>\r\n	<p>Market Research</p>\r\n	</li>\r\n	<li>\r\n	<p>Set Up a Website</p>\r\n	</li>\r\n	<li>\r\n	<p>SEO&nbsp;(Search Enginge Optimization)</p>\r\n	</li>\r\n	<li>\r\n	<p>Email Marketing</p>\r\n	</li>\r\n	<li>\r\n	<p>Google Analytics</p>\r\n\r\n	<p><br />\r\n	<strong>DIGITAL&nbsp;MARKETING&nbsp;IN-DEPTH</strong></p>\r\n	</li>\r\n	<li>\r\n	<p>Prompt Engineering with ChatGPT</p>\r\n	</li>\r\n	<li>\r\n	<p>Branding</p>\r\n	</li>\r\n	<li>\r\n	<p>Content Marketing</p>\r\n	</li>\r\n	<li>\r\n	<p>Sales Psychology</p>\r\n	</li>\r\n	<li>\r\n	<p>Copywriting</p>\r\n\r\n	<p><br />\r\n	<strong>DIGITAL&nbsp;MARKETING&nbsp;CHANNELS</strong></p>\r\n	</li>\r\n	<li>\r\n	<p>Google Ads</p>\r\n	</li>\r\n	<li>\r\n	<p>YouTube Ads</p>\r\n	</li>\r\n	<li>\r\n	<p>Facebook Ads</p>\r\n	</li>\r\n	<li>\r\n	<p>Facebook Marketing</p>\r\n	</li>\r\n	<li>\r\n	<p>Instagram Marketing</p>\r\n	</li>\r\n	<li>\r\n	<p>YouTube Marketing</p>\r\n	</li>\r\n	<li>\r\n	<p>Pinterest Marketing</p>\r\n	</li>\r\n	<li>\r\n	<p>LinkedIn Marketing</p>\r\n	</li>\r\n	<li>\r\n	<p>Quora Marketing</p>\r\n	</li>\r\n	<li>\r\n	<p>Twitter Marketing</p>\r\n	</li>\r\n	<li>\r\n	<p>Content&nbsp;Marketing Machine</p>\r\n\r\n	<p><br />\r\n	<strong>DIGITAL&nbsp;MARKETING&nbsp;PROFESSIONAL</strong></p>\r\n	</li>\r\n	<li>\r\n	<p>Digital Marketing Freelancing</p>\r\n	</li>\r\n	<li>\r\n	<p>WordPress Masterclass</p>\r\n	</li>\r\n	<li>\r\n	<p>SEO Masterclass</p>\r\n	</li>\r\n</ol>\r\n\r\n<p><strong>- Lifetime Access to Future Updates</strong></p>\r\n\r\n<p><strong>- Tools, Articles &amp; Templates</strong></p>\r\n\r\n<p>-&nbsp;<strong>Quick &amp; Helpful Support in the Q&amp;A section</strong></p>\r\n\r\n<p>-&nbsp;<strong>Downloadable Certificate of Completion</strong></p>\r\n\r\n<p>-&nbsp;<strong>30 Day Money Back Guarantee (No Questions Asked)</strong></p>', 1, '313045749', '00:06:36', '2023-05-14 02:25:45', '2023-05-14 02:25:45', NULL),
(84, 35, 'What to Expect', '<p><strong>Congratulations,&nbsp;You Found It!</strong></p>\r\n\r\n<p>The Most Complete Course on&nbsp;<strong>Digital Marketing</strong>, with&nbsp;<strong>24 Courses in 1!</strong></p>\r\n\r\n<p>Instead of buying 24 different Courses about Digital Marketing -<strong>&nbsp;<em>This Course Will Cover All Your Digital Marketing Needs.</em></strong></p>\r\n\r\n<p>This is a&nbsp;<strong>100% Practical Course</strong>&nbsp;- Get Ready for Hands-On Experience from the First Lecture!</p>\r\n\r\n<p><strong>Take A Look at&nbsp;These&nbsp;Top Rated Reviews...</strong></p>\r\n\r\n<p><em>This is a whole University degree, for such a little amount of money.</em>&nbsp;<strong>- Livingstone Ayehangane</strong></p>\r\n\r\n<p><em>Buying this course was the most important decision i ever made in my career.</em>&nbsp;<strong>- Mohamed Saeed</strong></p>\r\n\r\n<p><em>Robin and jesper are no doubt one of the best digital marketing experts and teachers out there, I love this course.</em>&nbsp;<strong>- Shaheer Farrukh</strong></p>\r\n\r\n<p><em>The best course ever. You can always come back to any part of the course if you need to. Amazing updates and golden value. This is my go to bible for everything I do. Would be lost without it.</em>&nbsp;<strong>- Rajaa Zaidi</strong></p>', 1, '346627381', '00:06:40', '2023-05-14 02:26:08', '2023-05-14 02:26:08', NULL),
(85, 36, 'Keyword Research Explained', '<p><strong>Course Goals:</strong></p>\r\n\r\n<ul>\r\n	<li>\r\n	<p>Grow Your Business Online</p>\r\n	</li>\r\n	<li>\r\n	<p>Get Hired as a Digital Marketing Expert</p>\r\n	</li>\r\n	<li>\r\n	<p>Work as a Digital Marketing Freelancer</p>\r\n	</li>\r\n</ul>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>Includes:</strong></p>\r\n\r\n<p><strong>&nbsp; &nbsp; &nbsp; &nbsp; DIGITAL&nbsp;MARKETING&nbsp;STRATEGY</strong></p>\r\n\r\n<ol>\r\n	<li>\r\n	<p>Market Research</p>\r\n	</li>\r\n	<li>\r\n	<p>Set Up a Website</p>\r\n	</li>\r\n	<li>\r\n	<p>SEO&nbsp;(Search Enginge Optimization)</p>\r\n	</li>\r\n	<li>\r\n	<p>Email Marketing</p>\r\n	</li>\r\n	<li>\r\n	<p>Google Analytics</p>\r\n\r\n	<p><br />\r\n	<strong>DIGITAL&nbsp;MARKETING&nbsp;IN-DEPTH</strong></p>\r\n	</li>\r\n	<li>\r\n	<p>Prompt Engineering with ChatGPT</p>\r\n	</li>\r\n	<li>\r\n	<p>Branding</p>\r\n	</li>\r\n	<li>\r\n	<p>Content Marketing</p>\r\n	</li>\r\n	<li>\r\n	<p>Sales Psychology</p>\r\n	</li>\r\n	<li>\r\n	<p>Copywriting</p>\r\n\r\n	<p><br />\r\n	<strong>DIGITAL&nbsp;MARKETING&nbsp;CHANNELS</strong></p>\r\n	</li>\r\n	<li>\r\n	<p>Google Ads</p>\r\n	</li>\r\n	<li>\r\n	<p>YouTube Ads</p>\r\n	</li>\r\n	<li>\r\n	<p>Facebook Ads</p>\r\n	</li>\r\n	<li>\r\n	<p>Facebook Marketing</p>\r\n	</li>\r\n	<li>\r\n	<p>Instagram Marketing</p>\r\n	</li>\r\n	<li>\r\n	<p>YouTube Marketing</p>\r\n	</li>\r\n	<li>\r\n	<p>Pinterest Marketing</p>\r\n	</li>\r\n	<li>\r\n	<p>LinkedIn Marketing</p>\r\n	</li>\r\n	<li>\r\n	<p>Quora Marketing</p>\r\n	</li>\r\n	<li>\r\n	<p>Twitter Marketing</p>\r\n	</li>\r\n	<li>\r\n	<p>Content&nbsp;Marketing Machine</p>\r\n\r\n	<p><br />\r\n	<strong>DIGITAL&nbsp;MARKETING&nbsp;PROFESSIONAL</strong></p>\r\n	</li>\r\n	<li>\r\n	<p>Digital Marketing Freelancing</p>\r\n	</li>\r\n	<li>\r\n	<p>WordPress Masterclass</p>\r\n	</li>\r\n	<li>\r\n	<p>SEO Masterclass</p>\r\n	</li>\r\n</ol>', 1, '344610920', '00:02:36', '2023-05-14 02:26:45', '2023-05-14 02:26:45', NULL),
(86, 36, 'How to Keyword Research', '<ol>\r\n	<li>\r\n	<p><strong>DIGITAL&nbsp;MARKETING&nbsp;PROFESSIONAL</strong></p>\r\n	</li>\r\n	<li>\r\n	<p>Digital Marketing Freelancing</p>\r\n	</li>\r\n	<li>\r\n	<p>WordPress Masterclass</p>\r\n	</li>\r\n	<li>\r\n	<p>SEO Masterclass</p>\r\n\r\n	<p>&nbsp;</p>\r\n	</li>\r\n</ol>\r\n\r\n<p><strong>- Lifetime Access to Future Updates</strong></p>\r\n\r\n<p><strong>- Tools, Articles &amp; Templates</strong></p>\r\n\r\n<p>-&nbsp;<strong>Quick &amp; Helpful Support in the Q&amp;A section</strong></p>\r\n\r\n<p>-&nbsp;<strong>Downloadable Certificate of Completion</strong></p>\r\n\r\n<p>-&nbsp;<strong>30 Day Money Back Guarantee (No Questions Asked)</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>This course will require you to sign up to Bluehost to follow our Digital Marketing strategy step-by-step.</p>\r\n\r\n<p>You will also need to sign up for ChatGPT which is completely free.</p>', 1, '343467421', '00:05:34', '2023-05-14 02:27:31', '2023-05-14 02:27:31', NULL),
(87, 36, 'Find Your Keywords Assignment', '<p><strong>Congratulations,&nbsp;You Found It!</strong></p>\r\n\r\n<p>The Most Complete Course on&nbsp;<strong>Digital Marketing</strong>, with&nbsp;<strong>24 Courses in 1!</strong></p>\r\n\r\n<p>Instead of buying 24 different Courses about Digital Marketing -<strong>&nbsp;<em>This Course Will Cover All Your Digital Marketing Needs.</em></strong></p>\r\n\r\n<p>This is a&nbsp;<strong>100% Practical Course</strong>&nbsp;- Get Ready for Hands-On Experience from the First Lecture!</p>\r\n\r\n<p><strong>Take A Look at&nbsp;These&nbsp;Top Rated Reviews...</strong></p>\r\n\r\n<p><em>This is a whole University degree, for such a little amount of money.</em>&nbsp;<strong>- Livingstone Ayehangane</strong></p>\r\n\r\n<p><em>Buying this course was the most important decision i ever made in my career.</em>&nbsp;<strong>- Mohamed Saeed</strong></p>\r\n\r\n<p><em>Robin and jesper are no doubt one of the best digital marketing experts and teachers out there, I love this course.</em>&nbsp;<strong>- Shaheer Farrukh</strong></p>\r\n\r\n<p><em>The best course ever. You can always come back to any part of the course if you need to. Amazing updates and golden value. This is my go to bible for everything I do. Would be lost without it.</em>&nbsp;<strong>- Rajaa Zaidi</strong></p>', 1, '341090511', '00:03:30', '2023-05-14 02:27:47', '2023-05-14 02:27:47', NULL),
(88, 37, 'Quick Win Make an Ad for Yourself', '<p><strong>Personal Development, Personal Transformation</strong>, and Finding Your&nbsp;<strong>Life Purpose</strong>&nbsp;- All humans grapple with these topics, but only some create a meaningful process for living life to its full potential. This is the longest, most thorough, and detailed&nbsp;<strong>Personal Development and Personal Transformation&nbsp;</strong>course available on this platform!</p>\r\n\r\n<p>TJ Walker has been leading&nbsp;<strong>personal development</strong>&nbsp;seminars around the globe for more than 30 years. His unique approach to becoming a creative and fulfilled human being takes the best of the traditional&nbsp;<strong>self-development world&nbsp;</strong>and fuses it with 2020s realities and unique technology solutions using your cell phone in a liberating rather than enslaving manner.</p>\r\n\r\n<p>We live in a modern world of overabundance everywhere. We face an overabundance of stimulation and content coming at us from our cell phones and screens. We are drowning in an overabundance of stuff, junk, and possessions that arrive cheaply and near-instantly from Amazon and your favorite superstore. And we are overwhelmed with giant portions of fat and sugar-filled food and snacks made avail to use every waking moment.</p>', 1, '343467421', '00:03:40', '2023-05-14 01:51:58', '2023-05-14 01:51:58', NULL),
(89, 37, 'Another Quick Win  Create Something', '<p><strong>Personal Development, Personal Transformation</strong>, and Finding Your&nbsp;<strong>Life Purpose</strong>&nbsp;- All humans grapple with these topics, but only some create a meaningful process for living life to its full potential. This is the longest, most thorough, and detailed&nbsp;<strong>Personal Development and Personal Transformation&nbsp;</strong>course available on this platform!</p>\r\n\r\n<p>TJ Walker has been leading&nbsp;<strong>personal development</strong>&nbsp;seminars around the globe for more than 30 years. His unique approach to becoming a creative and fulfilled human being takes the best of the traditional&nbsp;<strong>self-development world&nbsp;</strong>and fuses it with 2020s realities and unique technology solutions using your cell phone in a liberating rather than enslaving manner.</p>\r\n\r\n<p>We live in a modern world of overabundance everywhere. We face an overabundance of stimulation and content coming at us from our cell phones and screens. We are drowning in an overabundance of stuff, junk, and possessions that arrive cheaply and near-instantly from Amazon and your favorite superstore. And we are overwhelmed with giant portions of fat and sugar-filled food and snacks made avail to use every waking moment.</p>', 1, '348304224', '00:01:22', '2023-05-14 01:52:55', '2023-05-14 01:52:55', NULL),
(90, 37, 'Determine Your Highest Potential', '<p>Modern overabundance is fueled by a digital delivery system that makes traditional&nbsp;<strong>self-help techniques</strong>&nbsp;impotent. In the modern, attention-driven economy, everybody is fighting for our mind space. This course will teach you how to aggressively take back control of your own mind, your own&nbsp;<strong>habits,</strong>&nbsp;and your own creativity by counter-programming your brain with your own wipes, dreams and goals.</p>\r\n\r\n<p>The world is splitting into two groups at greater acceleration: The creators versus the consumers, those who take action versus those who are passive, the haves versus the have-nots, the fulfilled versus the empty, the ones who create a lasting legacy and those who are soon forgotten.</p>\r\n\r\n<p>Which group do you want to be a part of?</p>\r\n\r\n<p>You can take 100% control over your present and future. You have the ability to condition your thoughts, actions, and methods of living life for more fulfilling results.</p>\r\n\r\n<p>TJ Walker is the founder of Createocracy and the developer of Selfie-Speaking Programming audios, a system where you create your own audio &quot;infomercial&quot; to rewire your brain.</p>\r\n\r\n<p>If you are ready to live a more active life, develop your own creative projects and live a healthier and more meaningful life, then sign up today for this&nbsp;<strong>Complete Personal Development Personal Transformation&nbsp;</strong>Course on Createocracy.</p>', 1, '348304224', '00:07:36', '2023-05-14 01:53:16', '2023-05-14 01:53:16', NULL),
(91, 38, 'Solving the Problem of Overabundance', '<p>The world is splitting into two groups at greater acceleration: The creators versus the consumers, those who take action versus those who are passive, the haves versus the have-nots, the fulfilled versus the empty, the ones who create a lasting legacy and those who are soon forgotten.</p>\r\n\r\n<p>Which group do you want to be a part of?</p>\r\n\r\n<p>You can take 100% control over your present and future. You have the ability to condition your thoughts, actions, and methods of living life for more fulfilling results.</p>\r\n\r\n<p>TJ Walker is the founder of Createocracy and the developer of Selfie-Speaking Programming audios, a system where you create your own audio &quot;infomercial&quot; to rewire your brain.</p>\r\n\r\n<p>If you are ready to live a more active life, develop your own creative projects and live a healthier and more meaningful life, then sign up today for this&nbsp;<strong>Complete Personal Development Personal Transformation&nbsp;</strong>Course on Createocracy.</p>\r\n\r\n<p>TJ Walker has conducted personal development workshops in more than 30 countries around the globe. He is the author of 6 books on personal development and is one of Udemy&#39;s most popular&nbsp;<strong>personal development</strong>&nbsp;instructors with more than 200,000 students here.</p>', 1, '341090511', '00:02:22', '2023-05-14 01:53:48', '2023-05-14 01:53:48', NULL),
(92, 38, 'Time to Find Specific Solutions for You', '<p><strong>Personal Development, Personal Transformation</strong>, and Finding Your&nbsp;<strong>Life Purpose</strong>&nbsp;- All humans grapple with these topics, but only some create a meaningful process for living life to its full potential. This is the longest, most thorough, and detailed&nbsp;<strong>Personal Development and Personal Transformation&nbsp;</strong>course available on this platform!</p>\r\n\r\n<p>TJ Walker has been leading&nbsp;<strong>personal development</strong>&nbsp;seminars around the globe for more than 30 years. His unique approach to becoming a creative and fulfilled human being takes the best of the traditional&nbsp;<strong>self-development world&nbsp;</strong>and fuses it with 2020s realities and unique technology solutions using your cell phone in a liberating rather than enslaving manner.</p>\r\n\r\n<p>We live in a modern world of overabundance everywhere. We face an overabundance of stimulation and content coming at us from our cell phones and screens. We are drowning in an overabundance of stuff, junk, and possessions that arrive cheaply and near-instantly from Amazon and your favorite superstore. And we are overwhelmed with giant portions of fat and sugar-filled food and snacks made avail to use every waking moment.</p>', 1, '341090511', '00:06:36', '2023-05-14 01:54:08', '2023-05-14 01:54:08', NULL),
(93, 38, 'Creativity Is a Habit, Not a Lottery Ticket', '<p>Here is what Udemy students say about this course:</p>\r\n\r\n<p><em>&quot;great course TJ it helped me discover more personal aspects, thank you so much.&quot;</em>&nbsp;Mina Freig</p>\r\n\r\n<p><em>&quot;You are so authentic and I am humbled to take this course. Thank you.&quot;</em>&nbsp;Arshia Khan</p>\r\n\r\n<p><em>&quot;Get to understand better how to develop myself in an ideal way. Thank you so much TJ Walker Expert!&quot;</em>&nbsp;Jo Yi Tan</p>\r\n\r\n<p><em>&quot;Really motivating and positive to watch!&quot;&nbsp;</em>Kailey Kivlehan</p>\r\n\r\n<p><em>&quot;This course has several golden nugget points that will help your personal and work life. I highly recommend this course!!! JT, thank you for your service to help others improve and succeed!!!!&quot;</em>&nbsp;Beth Kay</p>\r\n\r\n<p><em>&quot;I have already taken a course on Leadership from him and this is the reason I have enrolled for the second one. TJ is an amazing mentor and a great speaker. He is my personal benchmark and standard, especially for speaking skills. Keep up the good work.&quot;</em>&nbsp;Zafar Iqbal Ahmed</p>\r\n\r\n<p><em>&quot;There is no Real good structure in this course. A strange combination of two courses so far, with mixed topics. No definitely not recommended, I will finish it just to know what to avoid.&quot;&nbsp;</em>Malgorzata Cybulska Dusson</p>\r\n\r\n<p><em>&quot;Yes, it&#39;s a good match. It tells us to think of the personality, the way we communicate, things we do; and guides us / give tips to change certain ways/habits.&quot;</em>&nbsp;Swapnil</p>\r\n\r\n<p><em>&quot;Yes, I need to develop myself as a leader. For that to happen I must equip myself with content related to personal development and apply the knowledge in my life.&quot;&nbsp;</em>Mojau Mokone</p>\r\n\r\n<p><em>&quot;I like the fact that I can rewire my brain and I also believe that social media most of the time misleading and negative information spread but the government usually do the same as social media; therefore it is good to follow your own gut feelings and focus on positive ways of thinking.&quot;&nbsp;</em>&nbsp;Francois Venter</p>\r\n\r\n<p>Enroll now to Complete&nbsp;<strong>Personal Development Personal Transformation</strong>&nbsp;Course! Sign up today to take advantage of this limited offer.</p>', 1, '346627381', '00:06:40', '2023-05-14 01:55:12', '2023-05-14 01:55:12', NULL),
(94, 39, 'You Are Massively Creative', '<p><strong>Personal Development, Personal Transformation</strong>, and Finding Your&nbsp;<strong>Life Purpose</strong>&nbsp;- All humans grapple with these topics, but only some create a meaningful process for living life to its full potential. This is the longest, most thorough, and detailed&nbsp;<strong>Personal Development and Personal Transformation&nbsp;</strong>course available on this platform!</p>\r\n\r\n<p>TJ Walker has been leading&nbsp;<strong>personal development</strong>&nbsp;seminars around the globe for more than 30 years. His unique approach to becoming a creative and fulfilled human being takes the best of the traditional&nbsp;<strong>self-development world&nbsp;</strong>and fuses it with 2020s realities and unique technology solutions using your cell phone in a liberating rather than enslaving manner.</p>\r\n\r\n<p>We live in a modern world of overabundance everywhere. We face an overabundance of stimulation and content coming at us from our cell phones and screens. We are drowning in an overabundance of stuff, junk, and possessions that arrive cheaply and near-instantly from Amazon and your favorite superstore. And we are overwhelmed with giant portions of fat and sugar-filled food and snacks made avail to use every waking moment.</p>', 1, '344610920', '00:02:22', '2023-05-14 01:56:07', '2023-05-14 01:56:07', NULL),
(95, 39, 'The Best Way to Be Special is...', '<p>Here is what Udemy students say about this course:</p>\r\n\r\n<p><em>&quot;great course TJ it helped me discover more personal aspects, thank you so much.&quot;</em>&nbsp;Mina Freig</p>\r\n\r\n<p><em>&quot;You are so authentic and I am humbled to take this course. Thank you.&quot;</em>&nbsp;Arshia Khan</p>\r\n\r\n<p><em>&quot;Get to understand better how to develop myself in an ideal way. Thank you so much TJ Walker Expert!&quot;</em>&nbsp;Jo Yi Tan</p>\r\n\r\n<p><em>&quot;Really motivating and positive to watch!&quot;&nbsp;</em>Kailey Kivlehan</p>\r\n\r\n<p><em>&quot;This course has several golden nugget points that will help your personal and work life. I highly recommend this course!!! JT, thank you for your service to help others improve and succeed!!!!&quot;</em>&nbsp;Beth Kay</p>\r\n\r\n<p><em>&quot;I have already taken a course on Leadership from him and this is the reason I have enrolled for the second one. TJ is an amazing mentor and a great speaker. He is my personal benchmark and standard, e</em></p>', 1, '348304224', '00:21:30', '2023-05-14 01:56:37', '2023-05-14 01:56:37', NULL),
(96, 39, 'You Were born with the Desire to Create', '<p><strong>Personal Development, Personal Transformation</strong>, and Finding Your&nbsp;<strong>Life Purpose</strong>&nbsp;- All humans grapple with these topics, but only some create a meaningful process for living life to its full potential. This is the longest, most thorough, and detailed&nbsp;<strong>Personal Development and Personal Transformation&nbsp;</strong>course available on this platform!</p>\r\n\r\n<p>TJ Walker has been leading&nbsp;<strong>personal development</strong>&nbsp;seminars around the globe for more than 30 years. His unique approach to becoming a creative and fulfilled human being takes the best of the traditional&nbsp;<strong>self-development world&nbsp;</strong>and fuses it with 2020s realities and unique technology solutions using your cell phone in a liberating rather than enslaving manner.</p>\r\n\r\n<p>We live in a modern world of overabundance everywhere. We face an overabundance of stimulation and content coming at us from our cell phones and screens. We are drowning in an overabundance of stuff, junk, and possessions that arrive cheaply and near-instantly from Amazon and your favorite superstore. And we are overwhelmed with giant portions of fat and sugar-filled food and snacks made avail to use every waking moment.</p>', 1, '348304224', '00:01:22', '2023-05-14 01:57:02', '2023-05-14 01:57:02', NULL),
(97, 40, 'Life Is the Sum of Your Daily Habits', '<p>The world is splitting into two groups at greater acceleration: The creators versus the consumers, those who take action versus those who are passive, the haves versus the have-nots, the fulfilled versus the empty, the ones who create a lasting legacy and those who are soon forgotten.</p>\r\n\r\n<p>Which group do you want to be a part of?</p>\r\n\r\n<p>You can take 100% control over your present and future. You have the ability to condition your thoughts, actions, and methods of living life for more fulfilling results.</p>\r\n\r\n<p>TJ Walker is the founder of Createocracy and the developer of Selfie-Speaking Programming audios, a system where you create your own audio &quot;infomercial&quot; to rewire your brain.</p>\r\n\r\n<p>If you are ready to live a more active life, develop your own creative projects and live a healthier and more meaningful life, then sign up today for this&nbsp;<strong>Complete Personal Development Personal Transformation&nbsp;</strong>Course on Createocracy.</p>\r\n\r\n<p>TJ Walker has conducted personal development workshops in more than 30 countries around the globe. He is the author of 6 books on personal development and is one of Udemy&#39;s most popular&nbsp;<strong>personal development</strong>&nbsp;instructors with more than 200,000 students here.</p>', 1, '344610920', '00:01:30', '2023-05-14 01:57:35', '2023-05-14 01:57:35', NULL),
(98, 41, 'This is Creativity', '<p><strong>Personal Development, Personal Transformation</strong>, and Finding Your&nbsp;<strong>Life Purpose</strong>&nbsp;- All humans grapple with these topics, but only some create a meaningful process for living life to its full potential. This is the longest, most thorough, and detailed&nbsp;<strong>Personal Development and Personal Transformation&nbsp;</strong>course available on this platform!</p>\r\n\r\n<p>TJ Walker has been leading&nbsp;<strong>personal development</strong>&nbsp;seminars around the globe for more than 30 years. His unique approach to becoming a creative and fulfilled human being takes the best of the traditional&nbsp;<strong>self-development world&nbsp;</strong>and fuses it with 2020s realities and unique technology solutions using your cell phone in a liberating rather than enslaving manner.</p>\r\n\r\n<p>We live in a modern world of overabundance everywhere. We face an overabundance of stimulation and content coming at us from our cell phones and screens. We are drowning in an overabundance of stuff, junk, and possessions that arrive cheaply and near-instantly from Amazon and your favorite superstore. And we are overwhelmed with giant portions of fat and sugar-filled food and snacks made avail to use every waking moment.</p>', 1, '341090511', '00:09:30', '2023-05-14 01:58:07', '2023-05-14 01:58:07', NULL),
(99, 41, 'If You Learn to Type, You Can Learn to Create', '<p><strong>Personal Development, Personal Transformation</strong>, and Finding Your&nbsp;<strong>Life Purpose</strong>&nbsp;- All humans grapple with these topics, but only some create a meaningful process for living life to its full potential. This is the longest, most thorough, and detailed&nbsp;<strong>Personal Development and Personal Transformation&nbsp;</strong>course available on this platform!</p>\r\n\r\n<p>TJ Walker has been leading&nbsp;<strong>personal development</strong>&nbsp;seminars around the globe for more than 30 years. His unique approach to becoming a creative and fulfilled human being takes the best of the traditional&nbsp;<strong>self-development world&nbsp;</strong>and fuses it with 2020s realities and unique technology solutions using your cell phone in a liberating rather than enslaving manner.</p>\r\n\r\n<p>We live in a modern world of overabundance everywhere. We face an overabundance of stimulation and content coming at us from our cell phones and screens. We are drowning in an overabundance of stuff, junk, and possessions that arrive cheaply and near-instantly from Amazon and your favorite superstore. And we are overwhelmed with giant portions of fat and sugar-filled food and snacks made avail to use every waking moment.</p>', 1, '341090511', '00:02:36', '2023-05-14 01:58:26', '2023-05-14 01:58:26', NULL),
(100, 42, 'Welcome and Course Introduction', '<p><strong>The English Master Course: Learn English Grammar, English Speaking, English Punctuation, and English pronunciation.</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>Udemy&#39;s best-selling English course!</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>**New 2023 Update</strong>: Brand new accent training section added. Build the perfect American or British accent.</p>\r\n\r\n<p>Over 500 new grammar/IELTS/TOEFL interactive practice questions added.<strong>**</strong></p>\r\n\r\n<p><strong>Are you ready to master the English language?</strong>&nbsp;Are you tired of learning the same simple topics and never really getting better at English speaking or English grammar? This course will fix all those problems. This has been one of the top Udemy English courses for many years, and that is because we care about our students.</p>\r\n\r\n<p>The English master course covers all areas of English learning. English grammar, English speaking, and English writing (punctuation). There are over 40 hours of video lessons, hundreds of examples and practice problems, and full-length PDFs.</p>', 1, '346627381', '00:08:22', '2023-05-14 02:01:20', '2023-05-14 02:01:20', NULL),
(101, 42, 'Course Navigation and Course Outline', '<p><strong>English Pronunciation Section:</strong>&nbsp;Build the perfect English accent. The accent training section covers all the sounds of the English language. Learn how to make each sound correctly. In addition, train your accent with professional voice actors using state-of-the-art accent training activities. Pick an American or British accent.</p>\r\n\r\n<p><strong>After using this course</strong>, you will ace tough English grammar tests such as A1, A2, B1, B2, C1, TOEFL, IETLS, AND TOEIC. You will sound more professional at work and may even get that new job or promotion you want. You will impress people with your new advanced English level. Your English grammar, English speaking, and English writing will all improve. You will develop a British or American accent and sound fluent.</p>\r\n\r\n<p><strong>Students love this course. See what some of them have to say about it:</strong></p>\r\n\r\n<p>Verberly C.</p>\r\n\r\n<p>***** - 5 stars</p>\r\n\r\n<p>&quot;I have been using Course for success for over 2 years now, it was relevant then and even more so now, I always refer now and again to refresh my skills. The instructions are lessons are easy to follow and I am happy to be able to learn at my own pace.&quot;</p>\r\n\r\n<p>Sandesh K</p>\r\n\r\n<p>***** - 5 stars</p>\r\n\r\n<p>&quot;I&#39;m a newbie in this course and really enjoying it. The best part is that the instructor is always there to answer your question don&#39;t matter how many times you ask.&quot;</p>', 1, '348304224', '00:07:36', '2023-05-14 02:01:49', '2023-05-14 02:01:49', NULL),
(102, 43, 'Section Overview', '<p><strong>The English Master Course: Learn English Grammar, English Speaking, English Punctuation, and English pronunciation.</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>Udemy&#39;s best-selling English course!</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>**New 2023 Update</strong>: Brand new accent training section added. Build the perfect American or British accent.</p>\r\n\r\n<p>Over 500 new grammar/IELTS/TOEFL interactive practice questions added.<strong>**</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>Are you ready to master the English language?</strong>&nbsp;Are you tired of learning the same simple topics and never really getting better at English speaking or English grammar? This course will fix all those problems. This has been one of the top Udemy English courses for many years, and that is because we care about our students.</p>\r\n\r\n<p>The English master course covers all areas of English learning. English grammar, English speaking, and English writing (punctuation). There are over 40 hours of video lessons, hundreds of examples and practice problems, and full-length PDFs.</p>\r\n\r\n<p>This course is HUGE. Basically 4 courses in 1.</p>', 1, '348304224', '00:06:17', '2023-05-14 02:02:27', '2023-05-14 02:02:27', NULL),
(103, 43, 'The Parts of an English Sentence', '<p><strong>Students love this course. See what some of them have to say about it:</strong></p>\r\n\r\n<p>Verberly C.</p>\r\n\r\n<p>***** - 5 stars</p>\r\n\r\n<p>&quot;I have been using Course for success for over 2 years now, it was relevant then and even more so now, I always refer now and again to refresh my skills. The instructions are lessons are easy to follow and I am happy to be able to learn at my own pace.&quot;</p>\r\n\r\n<p>Sandesh K</p>\r\n\r\n<p>***** - 5 stars</p>\r\n\r\n<p>&quot;I&#39;m a newbie in this course and really enjoying it. The best part is that the instructor is always there to answer your question don&#39;t matter how many times you ask.&quot;</p>\r\n\r\n<p><strong>This is a SUPER course. 4 full courses in 1. You get English grammar, English speaking, English writing, and English pronunciation.</strong></p>\r\n\r\n<p>Great for all levels. Beginners, intermediate, and advanced.</p>\r\n\r\n<p>I guarantee everything you need to become a PRO English language user is in this English master Course. This is the only course that teaches you&nbsp;<strong>English grammar in use</strong>&nbsp;and also shows you how to use it in real&nbsp;<strong>English speaking and conversation&nbsp;</strong>so you can improve all areas of the English language.</p>', 1, '346627381', '00:06:17', '2023-05-14 02:02:46', '2023-05-14 02:02:46', NULL),
(104, 43, 'Adjectives, Adverbs, Determiners, and More', '<p><strong>The English Master Course: Learn English Grammar, English Speaking, English Punctuation, and English pronunciation.</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>Udemy&#39;s best-selling English course!</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>**New 2023 Update</strong>: Brand new accent training section added. Build the perfect American or British accent.</p>\r\n\r\n<p>Over 500 new grammar/IELTS/TOEFL interactive practice questions added.<strong>**</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>Are you ready to master the English language?</strong>&nbsp;Are you tired of learning the same simple topics and never really getting better at English speaking or English grammar? This course will fix all those problems. This has been one of the top Udemy English courses for many years, and that is because we care about our students.</p>\r\n\r\n<p>The English master course covers all areas of English learning. English grammar, English speaking, and English writing (punctuation). There are over 40 hours of video lessons, hundreds of examples and practice problems, and full-length PDFs.</p>\r\n\r\n<p>This course is HUGE. Basically 4 courses in 1.</p>\r\n\r\n<p><strong>English Grammar Section:&nbsp;</strong>Over 90 different English grammar topics. No other course covers as many English Grammar topics. Full video lessons and conversations showing you the English grammar in use. You will learn to score higher on your English exams like TOEIC, IELTS, or TOEFL. Hundred of practice problems and examples. Full-length PDFs for offline learning.</p>', 1, '343467421', '00:06:36', '2023-05-14 02:03:07', '2023-05-14 02:03:07', NULL),
(105, 44, 'English Grammar Section', '<p><strong>This is a SUPER course. 4 full courses in 1. You get English grammar, English speaking, English writing, and English pronunciation.</strong></p>\r\n\r\n<p>Great for all levels. Beginners, intermediate, and advanced.</p>\r\n\r\n<p>I guarantee everything you need to become a PRO English language user is in this English master Course. This is the only course that teaches you&nbsp;<strong>English grammar in use</strong>&nbsp;and also shows you how to use it in real&nbsp;<strong>English speaking and conversation&nbsp;</strong>so you can improve all areas of the English language.</p>\r\n\r\n<p>Every topic has dozens of useful&nbsp;<strong>English&nbsp;</strong>examples, video lectures, guided practice, and real-life English conversations. Hundreds of worksheet pdfs full of practice problems to help you&nbsp;<strong>learn the English language.</strong></p>\r\n\r\n<p>The creator of this course is a real-life university professor and will answer any questions you have 24/7. Start learning English the easy way! Add the course to your cart and we can begin.</p>\r\n\r\n<p>-----------------</p>\r\n\r\n<p>Message from Scott, the course creator:</p>\r\n\r\n<p>Hello, all native English language enthusiasts with the zeal to learn English grammar, use punctuation marks for writing, and become the best at speaking English. I welcome you all to my course page. I have been teaching the English language for many years and have seen most people are still insecure about their use of English. It is possible to master English grammar and English speaking. I will help you be confident when you speak and write.</p>', 1, '343467421', '00:03:17', '2023-05-14 02:03:35', '2023-05-14 02:03:35', NULL);
INSERT INTO `course_classes` (`id`, `course_section_id`, `name`, `description`, `state`, `vimeo_id`, `time`, `created_at`, `updated_at`, `deleted_at`) VALUES
(106, 45, 'Introducción', '<p><em>Do you want to Learn&nbsp;</em><strong><em>Web Designing</em></strong><em>&nbsp;from Scratch ?</em></p>\r\n\r\n<p><em>Do you want to&nbsp;</em><strong><em>Master Your Web Design Skill&nbsp;</em></strong><em>to Advanced Professional Level ?</em></p>\r\n\r\n<p><em>Welcome to One of the&nbsp;</em><strong><em>Biggest Web Designing Course !!!</em></strong></p>\r\n\r\n<p>This Course includes :</p>\r\n\r\n<ul>\r\n	<li>\r\n	<p><strong><em>14 Courses</em></strong></p>\r\n	</li>\r\n	<li>\r\n	<p><strong><em>400+ Video Lectures</em></strong></p>\r\n	</li>\r\n	<li>\r\n	<p><strong><em>4 Bonus Courses&nbsp;</em></strong>(all in all&nbsp;<strong><em>18 Courses in 1</em></strong>)</p>\r\n	</li>\r\n</ul>\r\n\r\n<p>Topics Covered in this Course :</p>\r\n\r\n<ul>\r\n	<li>\r\n	<p><strong><em>HTML&nbsp;</em></strong>Crash Course</p>\r\n	</li>\r\n	<li>\r\n	<p><strong><em>CSS Concepts</em></strong></p>\r\n	</li>\r\n	<li>\r\n	<p><strong><em>Javascript</em></strong></p>\r\n	</li>\r\n	<li>\r\n	<p><strong><em>Jquery</em></strong></p>\r\n	</li>\r\n	<li>\r\n	<p><strong><em>Ajax</em></strong></p>\r\n	</li>\r\n	<li>\r\n	<p><strong><em>Bootstrap</em></strong>&nbsp;(for Responsive Design)</p>\r\n	</li>\r\n</ul>', 1, '341090511', '00:10:36', '2023-05-13 10:54:26', '2023-05-13 10:54:26', NULL),
(107, 46, 'What is HTML ?', '<p><em>o you want to Learn&nbsp;</em><strong><em>Web Designing</em></strong><em>&nbsp;from Scratch ?</em></p>\r\n\r\n<p><em>Do you want to&nbsp;</em><strong><em>Master Your Web Design Skill&nbsp;</em></strong><em>to Advanced Professional Level ?</em></p>\r\n\r\n<p><em>Welcome to One of the&nbsp;</em><strong><em>Biggest Web Designing Course !!!</em></strong></p>\r\n\r\n<p>This Course includes :</p>\r\n\r\n<ul>\r\n	<li>\r\n	<p><strong><em>14 Courses</em></strong></p>\r\n	</li>\r\n	<li>\r\n	<p><strong><em>400+ Video Lectures</em></strong></p>\r\n	</li>\r\n	<li>\r\n	<p><strong><em>4 Bonus Courses&nbsp;</em></strong>(all in all&nbsp;<strong><em>18 Courses in 1</em></strong>)</p>\r\n	</li>\r\n</ul>', 1, '343467421', '00:07:36', '2023-05-13 10:56:43', '2023-05-13 10:56:43', NULL),
(108, 46, 'Creating a Basic HTML Document', '<p>Each and everything is explained in detail. Also if you need any help , I am always here to Clear your concept.</p>\r\n\r\n<p>So , what are you waiting for ?&nbsp;<strong><em>Enroll Now !!!&nbsp;</em></strong>and&nbsp;<strong><em>take your first step in Designing Awesome Professional Websites</em></strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li>\r\n	<p><strong><em>3 Mega PSD to Responsive Web Design Projects</em></strong></p>\r\n	</li>\r\n	<li>\r\n	<p>Creating websites with cool features like&nbsp;<strong><em>Ajax Contact Form</em></strong>&nbsp;,&nbsp;<strong><em>CSS Animations</em></strong>&nbsp;,<strong><em>&nbsp;Parallax Designs</em></strong></p>\r\n	</li>\r\n	<li>\r\n	<p>Creating&nbsp;<strong><em>Animated Sliders&nbsp;</em></strong><em>without any Jquery Plugin</em>&nbsp;(no need to pay for paid plugins when you can do it on your own !!!)</p>\r\n	</li>\r\n	<li>\r\n	<p><em>Many More important tips ,tricks,techniques are shared</em></p>\r\n	</li>\r\n</ul>', 1, '344610920', '00:06:36', '2023-05-13 10:57:34', '2023-05-13 10:57:34', NULL),
(109, 46, 'HTML Styles', '<p>Hi ,</p>\r\n\r\n<p><strong><em>Do you want to want to Learn Web Development from Scratch ?</em></strong></p>\r\n\r\n<p><em><strong>Do you want to become an Awesome Web Developer ?</strong></em></p>\r\n\r\n<p><em><strong>Do you want to Build Amazing Websites ?</strong></em></p>\r\n\r\n<p>If your answer to any of these questions is&nbsp;<strong>YES</strong>&nbsp;, then this course is definitely for you .</p>\r\n\r\n<p>Welcome to this&nbsp;<em><strong>Mega and Most Comprehensive Web Development Course</strong></em>&nbsp;, where you will learn everything starting from&nbsp;<em><strong>HTML, CSS, Javascript, Jquery, Ajax, Bootstrap, PHP, MYSQL, Wordpress</strong></em>.</p>\r\n\r\n<p><em>Each and every little concept and code is explained in detail</em></p>\r\n\r\n<p>You will also learn creating&nbsp;<em><strong>Amazing Unique Hover Effects</strong></em></p>', 1, '341631029', '00:10:36', '2023-05-13 10:58:24', '2023-05-13 10:58:24', NULL),
(110, 47, 'CSS Syntax', '<p>Hi ,</p>\r\n\r\n<p><strong><em>Do you want to want to Learn Web Development from Scratch ?</em></strong></p>\r\n\r\n<p><em><strong>Do you want to become an Awesome Web Developer ?</strong></em></p>\r\n\r\n<p><em><strong>Do you want to Build Amazing Websites ?</strong></em></p>\r\n\r\n<p>If your answer to any of these questions is&nbsp;<strong>YES</strong>&nbsp;, then this course is definitely for you .</p>\r\n\r\n<p>Welcome to this&nbsp;<em><strong>Mega and Most Comprehensive Web Development Course</strong></em>&nbsp;, where you will learn everything starting from&nbsp;<em><strong>HTML, CSS, Javascript, Jquery, Ajax, Bootstrap, PHP, MYSQL, Wordpress</strong></em>.</p>\r\n\r\n<p><em>Each and every little concept and code is explained in detail</em></p>\r\n\r\n<p>You will also learn creating&nbsp;<em><strong>Amazing Unique Hover Effects</strong></em></p>', 1, '332748369', '00:05:00', '2023-05-13 11:00:08', '2023-05-13 11:00:08', NULL),
(111, 47, 'Understanding children selectors using examples', '<p>Hi ,</p>\r\n\r\n<p><strong><em>Do you want to want to Learn Web Development from Scratch ?</em></strong></p>\r\n\r\n<p><em><strong>Do you want to become an Awesome Web Developer ?</strong></em></p>\r\n\r\n<p><em><strong>Do you want to Build Amazing Websites ?</strong></em></p>\r\n\r\n<p>If your answer to any of these questions is&nbsp;<strong>YES</strong>&nbsp;, then this course is definitely for you .</p>\r\n\r\n<p>Welcome to this&nbsp;<em><strong>Mega and Most Comprehensive Web Development Course</strong></em>&nbsp;, where you will learn everything starting from&nbsp;<em><strong>HTML, CSS, Javascript, Jquery, Ajax, Bootstrap, PHP, MYSQL, Wordpress</strong></em>.</p>\r\n\r\n<p><em>Each and every little concept and code is explained in detail</em></p>\r\n\r\n<p>You will also learn creating&nbsp;<em><strong>Amazing Unique Hover Effects</strong></em></p>', 1, '346943885', '00:05:00', '2023-05-13 11:00:39', '2023-05-13 11:00:39', NULL),
(112, 47, 'Border , Border Radius and Outline', '<p>ou will also Learn Building&nbsp;<em><strong>Awesome Modern Looking Professional Websites</strong></em>&nbsp;with&nbsp;<em><strong>Cool Features</strong></em></p>\r\n\r\n<p>Some of the Website Projects that we have in this Course are as follows :</p>\r\n\r\n<ul>\r\n	<li><em>Project Spark :</em>&nbsp;<strong>Features :</strong>&nbsp;<em><strong>Modern Professional Look , Water Ripple Background, Awesome Unique Hover Effect</strong></em></li>\r\n	<li><em>Wordpress Project1 : Multipage Corporate Site :</em>&nbsp;<strong>Features :</strong>&nbsp;<em><strong>Cool Slider , Modern Look , Portfolio Filter Feature and contain all the required sections required for a&nbsp;Corporate Site</strong></em></li>\r\n	<li><em>Wordpress Project2 :</em>&nbsp;<em><strong>Multipage Portfolio Site</strong></em></li>\r\n	<li><em>Our Mega Project : PHP Multiuser Photogallery Site :</em>&nbsp;<em><strong>Features : Awesome Hover Effects, Pagination Feature in Gallery Page , Profile Image Feature / Avatar Image Feature handled with Ajax , Ajax Image Upload , Ajax Image Approval by Admin , Recent Uploads Feature , Tracking Number of Uploads by each User , Top Uploaders</strong></em></li>\r\n</ul>', 1, '346627381', '00:05:00', '2023-05-13 11:01:10', '2023-05-13 11:01:10', NULL),
(113, 48, 'What is Javascript and Why it is used ?', '<p>ou will also Learn Building&nbsp;<em><strong>Awesome Modern Looking Professional Websites</strong></em>&nbsp;with&nbsp;<em><strong>Cool Features</strong></em></p>\r\n\r\n<p>Some of the Website Projects that we have in this Course are as follows :</p>\r\n\r\n<ul>\r\n	<li><em>Project Spark :</em>&nbsp;<strong>Features :</strong>&nbsp;<em><strong>Modern Professional Look , Water Ripple Background, Awesome Unique Hover Effect</strong></em></li>\r\n	<li><em>Wordpress Project1 : Multipage Corporate Site :</em>&nbsp;<strong>Features :</strong>&nbsp;<em><strong>Cool Slider , Modern Look , Portfolio Filter Feature and contain all the required sections required for a&nbsp;Corporate Site</strong></em></li>\r\n	<li><em>Wordpress Project2 :</em>&nbsp;<em><strong>Multipage Portfolio Site</strong></em></li>\r\n	<li><em>Our Mega Project : PHP Multiuser Photogallery Site :</em>&nbsp;<em><strong>Features : Awesome Hover Effects, Pagination Feature in Gallery Page , Profile Image Feature / Avatar Image Feature handled with Ajax , Ajax Image Upload , Ajax Image Approval by Admin , Recent Uploads Feature , Tracking Number of Uploads by each User , Top Uploaders</strong></em></li>\r\n</ul>', 1, '348304224', '00:06:40', '2023-05-13 11:02:17', '2023-05-13 11:02:17', NULL),
(114, 48, 'Javascript Syntax', '<p>You will also Learn Building&nbsp;<em><strong>Awesome Modern Looking Professional Websites</strong></em>&nbsp;with&nbsp;<em><strong>Cool Features</strong></em></p>\r\n\r\n<p>Some of the Website Projects that we have in this Course are as follows :</p>\r\n\r\n<ul>\r\n	<li><em>Project Spark :</em>&nbsp;<strong>Features :</strong>&nbsp;<em><strong>Modern Professional Look , Water Ripple Background, Awesome Unique Hover Effect</strong></em></li>\r\n	<li><em>Wordpress Project1 : Multipage Corporate Site :</em>&nbsp;<strong>Features :</strong>&nbsp;<em><strong>Cool Slider , Modern Look , Portfolio Filter Feature and contain all the required sections required for a&nbsp;Corporate Site</strong></em></li>\r\n	<li><em>Wordpress Project2 :</em>&nbsp;<em><strong>Multipage Portfolio Site</strong></em></li>\r\n	<li><em>Our Mega Project : PHP Multiuser Photogallery Site :</em>&nbsp;<em><strong>Features : Awesome Hover Effects, Pagination Feature in Gallery Page , Profile Image Feature / Avatar Image Feature handled with Ajax , Ajax Image Upload , Ajax Image Approval by Admin , Recent Uploads Feature , Tracking Number of Uploads by each User , Top Uploaders</strong></em></li>\r\n</ul>\r\n\r\n<p><em><strong>After Completing this course along with these projects, you will have great knowledge about Web Development and enormous confidence&nbsp;in yourself , that you can also create Amazing Websites</strong></em></p>\r\n\r\n<p><em><strong>So why waiting , Enroll Now and take your first step to become an Awesome Web Developer</strong></em></p>', 1, '313045749', '00:06:40', '2023-05-13 11:02:37', '2023-05-13 11:02:37', NULL),
(115, 48, 'Interesting Concept : Adding Strings and Numbers', '<p>You will also Learn Building&nbsp;<em><strong>Awesome Modern Looking Professional Websites</strong></em>&nbsp;with&nbsp;<em><strong>Cool Features</strong></em></p>\r\n\r\n<p>Some of the Website Projects that we have in this Course are as follows :</p>\r\n\r\n<ul>\r\n	<li><em>Project Spark :</em>&nbsp;<strong>Features :</strong>&nbsp;<em><strong>Modern Professional Look , Water Ripple Background, Awesome Unique Hover Effect</strong></em></li>\r\n	<li><em>Wordpress Project1 : Multipage Corporate Site :</em>&nbsp;<strong>Features :</strong>&nbsp;<em><strong>Cool Slider , Modern Look , Portfolio Filter Feature and contain all the required sections required for a&nbsp;Corporate Site</strong></em></li>\r\n	<li><em>Wordpress Project2 :</em>&nbsp;<em><strong>Multipage Portfolio Site</strong></em></li>\r\n	<li><em>Our Mega Project : PHP Multiuser Photogallery Site :</em>&nbsp;<em><strong>Features : Awesome Hover Effects, Pagination Feature in Gallery Page , Profile Image Feature / Avatar Image Feature handled with Ajax , Ajax Image Upload , Ajax Image Approval by Admin , Recent Uploads Feature , Tracking Number of Uploads by each User , Top Uploaders</strong></em></li>\r\n</ul>\r\n\r\n<p><em><strong>After Completing this course along with these projects, you will have great knowledge about Web Development and enormous confidence&nbsp;in yourself , that you can also create Amazing Websites</strong></em></p>\r\n\r\n<p><em><strong>So why waiting , Enroll Now and take your first step to become an Awesome Web Developer</strong></em></p>', 1, '344610920', '00:06:36', '2023-05-13 11:02:56', '2023-05-13 11:02:56', NULL),
(116, 49, 'What is Jquery and why we use it ?', '<p>You will also Learn Building&nbsp;<em><strong>Awesome Modern Looking Professional Websites</strong></em>&nbsp;with&nbsp;<em><strong>Cool Features</strong></em></p>\r\n\r\n<p>Some of the Website Projects that we have in this Course are as follows :</p>\r\n\r\n<ul>\r\n	<li><em>Project Spark :</em>&nbsp;<strong>Features :</strong>&nbsp;<em><strong>Modern Professional Look , Water Ripple Background, Awesome Unique Hover Effect</strong></em></li>\r\n	<li><em>Wordpress Project1 : Multipage Corporate Site :</em>&nbsp;<strong>Features :</strong>&nbsp;<em><strong>Cool Slider , Modern Look , Portfolio Filter Feature and contain all the required sections required for a&nbsp;Corporate Site</strong></em></li>\r\n	<li><em>Wordpress Project2 :</em>&nbsp;<em><strong>Multipage Portfolio Site</strong></em></li>\r\n	<li><em>Our Mega Project : PHP Multiuser Photogallery Site :</em>&nbsp;<em><strong>Features : Awesome Hover Effects, Pagination Feature in Gallery Page , Profile Image Feature / Avatar Image Feature handled with Ajax , Ajax Image Upload , Ajax Image Approval by Admin , Recent Uploads Feature , Tracking Number of Uploads by each User , Top Uploaders</strong></em></li>\r\n</ul>\r\n\r\n<p><em><strong>After Completing this course along with these projects, you will have great knowledge about Web Development and enormous confidence&nbsp;in yourself , that you can also create Amazing Websites</strong></em></p>\r\n\r\n<p><em><strong>So why waiting , Enroll Now and take your first step to become an Awesome Web Developer</strong></em></p>', 1, '341090511', '00:10:36', '2023-05-13 11:03:40', '2023-05-13 11:03:40', NULL),
(117, 49, 'Using Jquery in Website', '<p>You will also Learn Building&nbsp;<em><strong>Awesome Modern Looking Professional Websites</strong></em>&nbsp;with&nbsp;<em><strong>Cool Features</strong></em></p>\r\n\r\n<p>Some of the Website Projects that we have in this Course are as follows :</p>\r\n\r\n<ul>\r\n	<li><em>Project Spark :</em>&nbsp;<strong>Features :</strong>&nbsp;<em><strong>Modern Professional Look , Water Ripple Background, Awesome Unique Hover Effect</strong></em></li>\r\n	<li><em>Wordpress Project1 : Multipage Corporate Site :</em>&nbsp;<strong>Features :</strong>&nbsp;<em><strong>Cool Slider , Modern Look , Portfolio Filter Feature and contain all the required sections required for a&nbsp;Corporate Site</strong></em></li>\r\n	<li><em>Wordpress Project2 :</em>&nbsp;<em><strong>Multipage Portfolio Site</strong></em></li>\r\n	<li><em>Our Mega Project : PHP Multiuser Photogallery Site :</em>&nbsp;<em><strong>Features : Awesome Hover Effects, Pagination Feature in Gallery Page , Profile Image Feature / Avatar Image Feature handled with Ajax , Ajax Image Upload , Ajax Image Approval by Admin , Recent Uploads Feature , Tracking Number of Uploads by each User , Top Uploaders</strong></em></li>\r\n</ul>\r\n\r\n<p><em><strong>After Completing this course along with these projects, you will have great knowledge about Web Development and enormous confidence&nbsp;in yourself , that you can also create Amazing Websites</strong></em></p>\r\n\r\n<p><em><strong>So why waiting , Enroll Now and take your first step to become an Awesome Web Developer</strong></em></p>', 1, '344610920', '00:05:00', '2023-05-13 11:03:55', '2023-05-13 11:03:55', NULL),
(118, 49, 'Removing HTML Content using Jquery', '<p>You will also Learn Building&nbsp;<em><strong>Awesome Modern Looking Professional Websites</strong></em>&nbsp;with&nbsp;<em><strong>Cool Features</strong></em></p>\r\n\r\n<p>Some of the Website Projects that we have in this Course are as follows :</p>\r\n\r\n<ul>\r\n	<li><em>Project Spark :</em>&nbsp;<strong>Features :</strong>&nbsp;<em><strong>Modern Professional Look , Water Ripple Background, Awesome Unique Hover Effect</strong></em></li>\r\n	<li><em>Wordpress Project1 : Multipage Corporate Site :</em>&nbsp;<strong>Features :</strong>&nbsp;<em><strong>Cool Slider , Modern Look , Portfolio Filter Feature and contain all the required sections required for a&nbsp;Corporate Site</strong></em></li>\r\n	<li><em>Wordpress Project2 :</em>&nbsp;<em><strong>Multipage Portfolio Site</strong></em></li>\r\n	<li><em>Our Mega Project : PHP Multiuser Photogallery Site :</em>&nbsp;<em><strong>Features : Awesome Hover Effects, Pagination Feature in Gallery Page , Profile Image Feature / Avatar Image Feature handled with Ajax , Ajax Image Upload , Ajax Image Approval by Admin , Recent Uploads Feature , Tracking Number of Uploads by each User , Top Uploaders</strong></em></li>\r\n</ul>\r\n\r\n<p><em><strong>After Completing this course along with these projects, you will have great knowledge about Web Development and enormous confidence&nbsp;in yourself , that you can also create Amazing Websites</strong></em></p>\r\n\r\n<p><em><strong>So why waiting , Enroll Now and take your first step to become an Awesome Web Developer</strong></em></p>', 1, '346943885', '00:05:30', '2023-05-13 11:04:11', '2023-05-13 11:04:11', NULL),
(119, 50, 'Welcome To The Course!', '<p>Learn the incredibly popular and in demand Laravel framework. There are countless Laravel courses in the world; here&#39;s what makes this one unique:</p>\r\n\r\n<ul>\r\n	<li>\r\n	<p>No assumptions that you already understand the PHP&nbsp;language.</p>\r\n	</li>\r\n	<li>\r\n	<p>No assumptions that you already understand the &quot;Model View Controller&quot;&nbsp;pattern.</p>\r\n	</li>\r\n	<li>\r\n	<p>No assumptions that you already understand how to setup a dev environment on your computer.</p>\r\n	</li>\r\n	<li>\r\n	<p>No assumptions that you already understand how to deploy a website.</p>\r\n	</li>\r\n	<li>\r\n	<p>No assumptions that you already understand the Linux command-line.</p>\r\n	</li>\r\n</ul>\r\n\r\n<p>Laravel is an amazing framework, but because it is so feature-complete I&#39;ve noticed that a lot of guides and tutorials get overly ambitious and introduce 10 or 20 new concepts in a single lesson which is frustrating when you&#39;re a beginner and you&#39;re trying to actually understand&nbsp;<strong>why</strong>&nbsp;you&#39;re doing what you&#39;re doing. I&#39;ve also noticed a lot of tutorials assume you&#39;ve already used lots of other web application frameworks before Laravel, and so they don&#39;t actually explain any of the organizational or conceptual pieces of the puzzle.</p>', 1, '346627381', '00:05:45', '2023-05-14 02:07:19', '2023-05-14 02:07:19', NULL),
(120, 50, 'Quick Note About Our Text Editor And Extensions', '<p>This course is different because I&nbsp;assume that Laravel is the&nbsp;<strong>first</strong>&nbsp;web application framework you&#39;ve ever attempted to learn, and so we move at a pace where you can actually absorb the big-picture concepts that exist in all frameworks; not just Laravel.</p>\r\n\r\n<p>Here&#39;s what we&#39;ll learn in the course:</p>\r\n\r\n<ul>\r\n	<li>\r\n	<p>The PHP&nbsp;language itself</p>\r\n	</li>\r\n	<li>\r\n	<p>Getting our computer ready for Laravel</p>\r\n	</li>\r\n	<li>\r\n	<p>User registration, log in, log out</p>\r\n	</li>\r\n	<li>\r\n	<p>Profile Photo Upload (server-side resize &amp;&nbsp;storage)</p>\r\n	</li>\r\n	<li>\r\n	<p>The Blade Template Engine</p>\r\n	</li>\r\n	<li>\r\n	<p>Composer the PHP&nbsp;Dependency Manager</p>\r\n	</li>\r\n	<li>\r\n	<p>Form Validation</p>\r\n	</li>\r\n	<li>\r\n	<p>Gates, Policies, Permissions (e.g. You can only edit your own posts and not other people&#39;s posts)</p>\r\n	</li>\r\n	<li>\r\n	<p>Relationships; letting one user follow another user</p>\r\n	</li>\r\n	<li>\r\n	<p>How to use Models to query for the exact data you want (e.g. homepage feed of posts from the users you follow)</p>\r\n	</li>\r\n	<li>\r\n	<p>How to send automated emails from your app</p>\r\n	</li>\r\n	<li>\r\n	<p>Add API URLS that allow users to login and create &amp; delete posts from outside the context of a web browser</p>\r\n	</li>\r\n	<li>\r\n	<p>Use Docker to practice deploying to a Linux server</p>\r\n	</li>\r\n	<li>\r\n	<p>Configure a real public Ubuntu VPS&nbsp;to host our Laravel app with a real domain</p>\r\n	</li>\r\n	<li>\r\n	<p>Setup our VPS&nbsp;as a Git server that you can push to for effortless future updates to your live site</p>\r\n	</li>\r\n</ul>', 1, '348304224', '00:06:17', '2023-05-14 02:07:39', '2023-05-14 02:07:39', NULL),
(121, 50, 'Windows: Installing PHP', '<p>&nbsp;encourage you to watch the freely available first lesson titled &quot;Welcome To The Course&quot; to get a better feel for the course.</p>\r\n\r\n<p>This course may be brand new, but this isn&rsquo;t my first time teaching. I&rsquo;ve led training sessions for Fortune 500 companies and I&rsquo;ve already helped over 200,000 people on Udemy and received the following feedback:</p>\r\n\r\n<p>&quot;Brad definitely has some of the best techniques to embed the lesson into your mind&hellip; hands down these are the best tutorials I have had the opportunity to view.&quot;</p>\r\n\r\n<p>&quot;Presentation is concise without being tedious&hellip; you honestly feel that you have a thorough understanding of the subject.&quot;</p>\r\n\r\n<p>&quot;&hellip;[Brad] explained the process. Not memorize this or that, he explained the process. If you&#39;re looking to take a course to understand the foundations of creating websites, look no further.&quot;</p>', 1, '348304224', '00:11:40', '2023-05-14 02:08:02', '2023-05-14 02:08:02', NULL),
(122, 51, 'Using Composer To Create a Laravel Project', '<p>Learn the incredibly popular and in demand Laravel framework. There are countless Laravel courses in the world; here&#39;s what makes this one unique:</p>\r\n\r\n<ul>\r\n	<li>\r\n	<p>No assumptions that you already understand the PHP&nbsp;language.</p>\r\n	</li>\r\n	<li>\r\n	<p>No assumptions that you already understand the &quot;Model View Controller&quot;&nbsp;pattern.</p>\r\n	</li>\r\n	<li>\r\n	<p>No assumptions that you already understand how to setup a dev environment on your computer.</p>\r\n	</li>\r\n	<li>\r\n	<p>No assumptions that you already understand how to deploy a website.</p>\r\n	</li>\r\n	<li>\r\n	<p>No assumptions that you already understand the Linux command-line.</p>\r\n	</li>\r\n</ul>', 1, '341090511', '00:02:36', '2023-05-14 02:09:00', '2023-05-14 02:09:00', NULL),
(123, 51, 'How To Use The Reference Zip Files In This Course', '<p>This course is different because I&nbsp;assume that Laravel is the&nbsp;<strong>first</strong>&nbsp;web application framework you&#39;ve ever attempted to learn, and so we move at a pace where you can actually absorb the big-picture concepts that exist in all frameworks; not just Laravel.</p>\r\n\r\n<p>Here&#39;s what we&#39;ll learn in the course:</p>\r\n\r\n<ul>\r\n	<li>\r\n	<p>The PHP&nbsp;language itself</p>\r\n	</li>\r\n	<li>\r\n	<p>Getting our computer ready for Laravel</p>\r\n	</li>\r\n	<li>\r\n	<p>User registration, log in, log out</p>\r\n	</li>\r\n	<li>\r\n	<p>Profile Photo Upload (server-side resize &amp;&nbsp;storage)</p>\r\n	</li>\r\n	<li>\r\n	<p>The Blade Template Engine</p>\r\n	</li>\r\n	<li>\r\n	<p>Composer the PHP&nbsp;Dependency Manager</p>\r\n	</li>\r\n	<li>\r\n	<p>Form Validation</p>\r\n	</li>\r\n	<li>\r\n	<p>Gates, Policies, Permissions (e.g. You can only edit your own posts and not other people&#39;s posts)</p>\r\n	</li>\r\n	<li>\r\n	<p>Relationships; letting one user follow another user</p>\r\n	</li>\r\n	<li>\r\n	<p>How to use Models to query for the exact data you want (e.g. homepage feed of posts from the users you follow)</p>\r\n	</li>\r\n	<li>\r\n	<p>How to send automated emails from your app</p>\r\n	</li>\r\n	<li>\r\n	<p>Add API URLS that allow users to login and create &amp; delete posts from outside the context of a web browser</p>\r\n	</li>\r\n	<li>\r\n	<p>Use Docker to practice deploying to a Linux server</p>\r\n	</li>\r\n	<li>\r\n	<p>Configure a real public Ubuntu VPS&nbsp;to host our Laravel app with a real domain</p>\r\n	</li>\r\n	<li>\r\n	<p>Setup our VPS&nbsp;as a Git server that you can push to for effortless future updates to your live site</p>\r\n	</li>\r\n</ul>', 1, '341090511', '00:02:30', '2023-05-14 02:09:18', '2023-05-14 02:09:18', NULL),
(124, 51, 'What Is A View? What Is Blade?', '<p>Laravel is an amazing framework, but because it is so feature-complete I&#39;ve noticed that a lot of guides and tutorials get overly ambitious and introduce 10 or 20 new concepts in a single lesson which is frustrating when you&#39;re a beginner and you&#39;re trying to actually understand&nbsp;<strong>why</strong>&nbsp;you&#39;re doing what you&#39;re doing. I&#39;ve also noticed a lot of tutorials assume you&#39;ve already used lots of other web application frameworks before Laravel, and so they don&#39;t actually explain any of the organizational or conceptual pieces of the puzzle.</p>\r\n\r\n<p>This course is different because I&nbsp;assume that Laravel is the&nbsp;<strong>first</strong>&nbsp;web application framework you&#39;ve ever attempted to learn, and so we move at a pace where you can actually absorb the big-picture concepts that exist in all frameworks; not just Laravel.</p>', 1, '344610920', '00:01:30', '2023-05-14 02:11:04', '2023-05-14 02:11:04', NULL),
(125, 52, 'Install MySQL (Windows)', '<p>Learn the incredibly popular and in demand Laravel framework. There are countless Laravel courses in the world; here&#39;s what makes this one unique:</p>\r\n\r\n<ul>\r\n	<li>\r\n	<p>No assumptions that you already understand the PHP&nbsp;language.</p>\r\n	</li>\r\n	<li>\r\n	<p>No assumptions that you already understand the &quot;Model View Controller&quot;&nbsp;pattern.</p>\r\n	</li>\r\n	<li>\r\n	<p>No assumptions that you already understand how to setup a dev environment on your computer.</p>\r\n	</li>\r\n	<li>\r\n	<p>No assumptions that you already understand how to deploy a website.</p>\r\n	</li>\r\n	<li>\r\n	<p>No assumptions that you already understand the Linux command-line.</p>\r\n	</li>\r\n</ul>', 1, '341631029', '00:07:36', '2023-05-14 02:11:24', '2023-05-14 02:11:24', NULL),
(126, 52, 'Connecting Laravel To Our Database', '<p>Laravel is an amazing framework, but because it is so feature-complete I&#39;ve noticed that a lot of guides and tutorials get overly ambitious and introduce 10 or 20 new concepts in a single lesson which is frustrating when you&#39;re a beginner and you&#39;re trying to actually understand&nbsp;<strong>why</strong>&nbsp;you&#39;re doing what you&#39;re doing. I&#39;ve also noticed a lot of tutorials assume you&#39;ve already used lots of other web application frameworks before Laravel, and so they don&#39;t actually explain any of the organizational or conceptual pieces of the puzzle.</p>\r\n\r\n<p>This course is different because I&nbsp;assume that Laravel is the&nbsp;<strong>first</strong>&nbsp;web application framework you&#39;ve ever attempted to learn, and so we move at a pace where you can actually absorb the big-picture concepts that exist in all frameworks; not just Laravel.</p>\r\n\r\n<p>Here&#39;s what we&#39;ll learn in the course:</p>\r\n\r\n<ul>\r\n	<li>\r\n	<p>The PHP&nbsp;language itself</p>\r\n	</li>\r\n	<li>\r\n	<p>Getting our computer ready for Laravel</p>\r\n	</li>\r\n	<li>\r\n	<p>User registration, log in, log out</p>\r\n	</li>\r\n</ul>', 1, '348304224', '00:07:36', '2023-05-14 02:11:41', '2023-05-14 02:11:41', NULL),
(127, 53, 'Logging Out & Misc Details', '<p>This course is different because I&nbsp;assume that Laravel is the&nbsp;<strong>first</strong>&nbsp;web application framework you&#39;ve ever attempted to learn, and so we move at a pace where you can actually absorb the big-picture concepts that exist in all frameworks; not just Laravel.</p>\r\n\r\n<p>Here&#39;s what we&#39;ll learn in the course:</p>\r\n\r\n<ul>\r\n	<li>\r\n	<p>The PHP&nbsp;language itself</p>\r\n	</li>\r\n	<li>\r\n	<p>Getting our computer ready for Laravel</p>\r\n	</li>\r\n	<li>\r\n	<p>User registration, log in, log out</p>\r\n	</li>\r\n	<li>\r\n	<p>Profile Photo Upload (server-side resize &amp;&nbsp;storage)</p>\r\n	</li>\r\n	<li>\r\n	<p>The Blade Template Engine</p>\r\n	</li>\r\n	<li>\r\n	<p>Composer the PHP&nbsp;Dependency Manager</p>\r\n	</li>\r\n	<li>\r\n	<p>Form Validation</p>\r\n	</li>\r\n	<li>\r\n	<p>Gates, Policies, Permissions (e.g. You can only edit your own posts and not other people&#39;s posts)</p>\r\n	</li>\r\n	<li>\r\n	<p>Relationships; letting one user follow another user</p>\r\n	</li>\r\n	<li>\r\n	<p>How to use Models to query for the exact data you want (e.g. homepage feed of posts from the users you follow)</p>\r\n	</li>\r\n	<li>\r\n	<p>How to send automated emails from your app</p>\r\n	</li>\r\n	<li>\r\n	<p>Add API URLS that allow users to login and create &amp; delete posts from outside the context of a web browser</p>\r\n	</li>\r\n	<li>\r\n	<p>Use Docker to practice deploying to a Linux server</p>\r\n	</li>\r\n	<li>\r\n	<p>Configure a real public Ubuntu VPS&nbsp;to host our Laravel app with a real domain</p>\r\n	</li>\r\n	<li>\r\n	<p>Setup our VPS&nbsp;as a Git server that you can push to for effortless future updates to your live site</p>\r\n	</li>\r\n</ul>', 1, '348304224', '00:06:40', '2023-05-14 02:12:09', '2023-05-14 02:12:09', NULL),
(128, 54, 'Introducción', '<p><em>Do you want to Learn&nbsp;</em><strong><em>Web Designing</em></strong><em>&nbsp;from Scratch ?</em></p>\r\n\r\n<p><em>Do you want to&nbsp;</em><strong><em>Master Your Web Design Skill&nbsp;</em></strong><em>to Advanced Professional Level ?</em></p>\r\n\r\n<p><em>Welcome to One of the&nbsp;</em><strong><em>Biggest Web Designing Course !!!</em></strong></p>\r\n\r\n<p>This Course includes :</p>\r\n\r\n<ul>\r\n	<li>\r\n	<p><strong><em>14 Courses</em></strong></p>\r\n	</li>\r\n	<li>\r\n	<p><strong><em>400+ Video Lectures</em></strong></p>\r\n	</li>\r\n	<li>\r\n	<p><strong><em>4 Bonus Courses&nbsp;</em></strong>(all in all&nbsp;<strong><em>18 Courses in 1</em></strong>)</p>\r\n	</li>\r\n</ul>\r\n\r\n<p>Topics Covered in this Course :</p>\r\n\r\n<ul>\r\n	<li>\r\n	<p><strong><em>HTML&nbsp;</em></strong>Crash Course</p>\r\n	</li>\r\n	<li>\r\n	<p><strong><em>CSS Concepts</em></strong></p>\r\n	</li>\r\n	<li>\r\n	<p><strong><em>Javascript</em></strong></p>\r\n	</li>\r\n	<li>\r\n	<p><strong><em>Jquery</em></strong></p>\r\n	</li>\r\n	<li>\r\n	<p><strong><em>Ajax</em></strong></p>\r\n	</li>\r\n	<li>\r\n	<p><strong><em>Bootstrap</em></strong>&nbsp;(for Responsive Design)</p>\r\n	</li>\r\n</ul>', 1, '341090511', '00:10:36', '2023-05-13 10:54:26', '2023-05-13 10:54:26', NULL),
(129, 55, 'What is HTML ?', '<p><em>o you want to Learn&nbsp;</em><strong><em>Web Designing</em></strong><em>&nbsp;from Scratch ?</em></p>\r\n\r\n<p><em>Do you want to&nbsp;</em><strong><em>Master Your Web Design Skill&nbsp;</em></strong><em>to Advanced Professional Level ?</em></p>\r\n\r\n<p><em>Welcome to One of the&nbsp;</em><strong><em>Biggest Web Designing Course !!!</em></strong></p>\r\n\r\n<p>This Course includes :</p>\r\n\r\n<ul>\r\n	<li>\r\n	<p><strong><em>14 Courses</em></strong></p>\r\n	</li>\r\n	<li>\r\n	<p><strong><em>400+ Video Lectures</em></strong></p>\r\n	</li>\r\n	<li>\r\n	<p><strong><em>4 Bonus Courses&nbsp;</em></strong>(all in all&nbsp;<strong><em>18 Courses in 1</em></strong>)</p>\r\n	</li>\r\n</ul>', 1, '343467421', '00:07:36', '2023-05-13 10:56:43', '2023-05-13 10:56:43', NULL),
(130, 55, 'Creating a Basic HTML Document', '<p>Each and everything is explained in detail. Also if you need any help , I am always here to Clear your concept.</p>\r\n\r\n<p>So , what are you waiting for ?&nbsp;<strong><em>Enroll Now !!!&nbsp;</em></strong>and&nbsp;<strong><em>take your first step in Designing Awesome Professional Websites</em></strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li>\r\n	<p><strong><em>3 Mega PSD to Responsive Web Design Projects</em></strong></p>\r\n	</li>\r\n	<li>\r\n	<p>Creating websites with cool features like&nbsp;<strong><em>Ajax Contact Form</em></strong>&nbsp;,&nbsp;<strong><em>CSS Animations</em></strong>&nbsp;,<strong><em>&nbsp;Parallax Designs</em></strong></p>\r\n	</li>\r\n	<li>\r\n	<p>Creating&nbsp;<strong><em>Animated Sliders&nbsp;</em></strong><em>without any Jquery Plugin</em>&nbsp;(no need to pay for paid plugins when you can do it on your own !!!)</p>\r\n	</li>\r\n	<li>\r\n	<p><em>Many More important tips ,tricks,techniques are shared</em></p>\r\n	</li>\r\n</ul>', 1, '344610920', '00:06:36', '2023-05-13 10:57:34', '2023-05-13 10:57:34', NULL),
(131, 55, 'HTML Styles', '<p>Hi ,</p>\r\n\r\n<p><strong><em>Do you want to want to Learn Web Development from Scratch ?</em></strong></p>\r\n\r\n<p><em><strong>Do you want to become an Awesome Web Developer ?</strong></em></p>\r\n\r\n<p><em><strong>Do you want to Build Amazing Websites ?</strong></em></p>\r\n\r\n<p>If your answer to any of these questions is&nbsp;<strong>YES</strong>&nbsp;, then this course is definitely for you .</p>\r\n\r\n<p>Welcome to this&nbsp;<em><strong>Mega and Most Comprehensive Web Development Course</strong></em>&nbsp;, where you will learn everything starting from&nbsp;<em><strong>HTML, CSS, Javascript, Jquery, Ajax, Bootstrap, PHP, MYSQL, Wordpress</strong></em>.</p>\r\n\r\n<p><em>Each and every little concept and code is explained in detail</em></p>\r\n\r\n<p>You will also learn creating&nbsp;<em><strong>Amazing Unique Hover Effects</strong></em></p>', 1, '341631029', '00:10:36', '2023-05-13 10:58:24', '2023-05-13 10:58:24', NULL),
(132, 56, 'CSS Syntax', '<p>Hi ,</p>\r\n\r\n<p><strong><em>Do you want to want to Learn Web Development from Scratch ?</em></strong></p>\r\n\r\n<p><em><strong>Do you want to become an Awesome Web Developer ?</strong></em></p>\r\n\r\n<p><em><strong>Do you want to Build Amazing Websites ?</strong></em></p>\r\n\r\n<p>If your answer to any of these questions is&nbsp;<strong>YES</strong>&nbsp;, then this course is definitely for you .</p>\r\n\r\n<p>Welcome to this&nbsp;<em><strong>Mega and Most Comprehensive Web Development Course</strong></em>&nbsp;, where you will learn everything starting from&nbsp;<em><strong>HTML, CSS, Javascript, Jquery, Ajax, Bootstrap, PHP, MYSQL, Wordpress</strong></em>.</p>\r\n\r\n<p><em>Each and every little concept and code is explained in detail</em></p>\r\n\r\n<p>You will also learn creating&nbsp;<em><strong>Amazing Unique Hover Effects</strong></em></p>', 1, '332748369', '00:05:00', '2023-05-13 11:00:08', '2023-05-13 11:00:08', NULL),
(133, 56, 'Understanding children selectors using examples', '<p>Hi ,</p>\r\n\r\n<p><strong><em>Do you want to want to Learn Web Development from Scratch ?</em></strong></p>\r\n\r\n<p><em><strong>Do you want to become an Awesome Web Developer ?</strong></em></p>\r\n\r\n<p><em><strong>Do you want to Build Amazing Websites ?</strong></em></p>\r\n\r\n<p>If your answer to any of these questions is&nbsp;<strong>YES</strong>&nbsp;, then this course is definitely for you .</p>\r\n\r\n<p>Welcome to this&nbsp;<em><strong>Mega and Most Comprehensive Web Development Course</strong></em>&nbsp;, where you will learn everything starting from&nbsp;<em><strong>HTML, CSS, Javascript, Jquery, Ajax, Bootstrap, PHP, MYSQL, Wordpress</strong></em>.</p>\r\n\r\n<p><em>Each and every little concept and code is explained in detail</em></p>\r\n\r\n<p>You will also learn creating&nbsp;<em><strong>Amazing Unique Hover Effects</strong></em></p>', 1, '346943885', '00:05:00', '2023-05-13 11:00:39', '2023-05-13 11:00:39', NULL),
(134, 56, 'Border , Border Radius and Outline', '<p>ou will also Learn Building&nbsp;<em><strong>Awesome Modern Looking Professional Websites</strong></em>&nbsp;with&nbsp;<em><strong>Cool Features</strong></em></p>\r\n\r\n<p>Some of the Website Projects that we have in this Course are as follows :</p>\r\n\r\n<ul>\r\n	<li><em>Project Spark :</em>&nbsp;<strong>Features :</strong>&nbsp;<em><strong>Modern Professional Look , Water Ripple Background, Awesome Unique Hover Effect</strong></em></li>\r\n	<li><em>Wordpress Project1 : Multipage Corporate Site :</em>&nbsp;<strong>Features :</strong>&nbsp;<em><strong>Cool Slider , Modern Look , Portfolio Filter Feature and contain all the required sections required for a&nbsp;Corporate Site</strong></em></li>\r\n	<li><em>Wordpress Project2 :</em>&nbsp;<em><strong>Multipage Portfolio Site</strong></em></li>\r\n	<li><em>Our Mega Project : PHP Multiuser Photogallery Site :</em>&nbsp;<em><strong>Features : Awesome Hover Effects, Pagination Feature in Gallery Page , Profile Image Feature / Avatar Image Feature handled with Ajax , Ajax Image Upload , Ajax Image Approval by Admin , Recent Uploads Feature , Tracking Number of Uploads by each User , Top Uploaders</strong></em></li>\r\n</ul>', 1, '346627381', '00:05:00', '2023-05-13 11:01:10', '2023-05-13 11:01:10', NULL),
(135, 57, 'What is Javascript and Why it is used ?', '<p>ou will also Learn Building&nbsp;<em><strong>Awesome Modern Looking Professional Websites</strong></em>&nbsp;with&nbsp;<em><strong>Cool Features</strong></em></p>\r\n\r\n<p>Some of the Website Projects that we have in this Course are as follows :</p>\r\n\r\n<ul>\r\n	<li><em>Project Spark :</em>&nbsp;<strong>Features :</strong>&nbsp;<em><strong>Modern Professional Look , Water Ripple Background, Awesome Unique Hover Effect</strong></em></li>\r\n	<li><em>Wordpress Project1 : Multipage Corporate Site :</em>&nbsp;<strong>Features :</strong>&nbsp;<em><strong>Cool Slider , Modern Look , Portfolio Filter Feature and contain all the required sections required for a&nbsp;Corporate Site</strong></em></li>\r\n	<li><em>Wordpress Project2 :</em>&nbsp;<em><strong>Multipage Portfolio Site</strong></em></li>\r\n	<li><em>Our Mega Project : PHP Multiuser Photogallery Site :</em>&nbsp;<em><strong>Features : Awesome Hover Effects, Pagination Feature in Gallery Page , Profile Image Feature / Avatar Image Feature handled with Ajax , Ajax Image Upload , Ajax Image Approval by Admin , Recent Uploads Feature , Tracking Number of Uploads by each User , Top Uploaders</strong></em></li>\r\n</ul>', 1, '348304224', '00:06:40', '2023-05-13 11:02:17', '2023-05-13 11:02:17', NULL),
(136, 57, 'Javascript Syntax', '<p>You will also Learn Building&nbsp;<em><strong>Awesome Modern Looking Professional Websites</strong></em>&nbsp;with&nbsp;<em><strong>Cool Features</strong></em></p>\r\n\r\n<p>Some of the Website Projects that we have in this Course are as follows :</p>\r\n\r\n<ul>\r\n	<li><em>Project Spark :</em>&nbsp;<strong>Features :</strong>&nbsp;<em><strong>Modern Professional Look , Water Ripple Background, Awesome Unique Hover Effect</strong></em></li>\r\n	<li><em>Wordpress Project1 : Multipage Corporate Site :</em>&nbsp;<strong>Features :</strong>&nbsp;<em><strong>Cool Slider , Modern Look , Portfolio Filter Feature and contain all the required sections required for a&nbsp;Corporate Site</strong></em></li>\r\n	<li><em>Wordpress Project2 :</em>&nbsp;<em><strong>Multipage Portfolio Site</strong></em></li>\r\n	<li><em>Our Mega Project : PHP Multiuser Photogallery Site :</em>&nbsp;<em><strong>Features : Awesome Hover Effects, Pagination Feature in Gallery Page , Profile Image Feature / Avatar Image Feature handled with Ajax , Ajax Image Upload , Ajax Image Approval by Admin , Recent Uploads Feature , Tracking Number of Uploads by each User , Top Uploaders</strong></em></li>\r\n</ul>\r\n\r\n<p><em><strong>After Completing this course along with these projects, you will have great knowledge about Web Development and enormous confidence&nbsp;in yourself , that you can also create Amazing Websites</strong></em></p>\r\n\r\n<p><em><strong>So why waiting , Enroll Now and take your first step to become an Awesome Web Developer</strong></em></p>', 1, '313045749', '00:06:40', '2023-05-13 11:02:37', '2023-05-13 11:02:37', NULL),
(137, 57, 'Interesting Concept : Adding Strings and Numbers', '<p>You will also Learn Building&nbsp;<em><strong>Awesome Modern Looking Professional Websites</strong></em>&nbsp;with&nbsp;<em><strong>Cool Features</strong></em></p>\r\n\r\n<p>Some of the Website Projects that we have in this Course are as follows :</p>\r\n\r\n<ul>\r\n	<li><em>Project Spark :</em>&nbsp;<strong>Features :</strong>&nbsp;<em><strong>Modern Professional Look , Water Ripple Background, Awesome Unique Hover Effect</strong></em></li>\r\n	<li><em>Wordpress Project1 : Multipage Corporate Site :</em>&nbsp;<strong>Features :</strong>&nbsp;<em><strong>Cool Slider , Modern Look , Portfolio Filter Feature and contain all the required sections required for a&nbsp;Corporate Site</strong></em></li>\r\n	<li><em>Wordpress Project2 :</em>&nbsp;<em><strong>Multipage Portfolio Site</strong></em></li>\r\n	<li><em>Our Mega Project : PHP Multiuser Photogallery Site :</em>&nbsp;<em><strong>Features : Awesome Hover Effects, Pagination Feature in Gallery Page , Profile Image Feature / Avatar Image Feature handled with Ajax , Ajax Image Upload , Ajax Image Approval by Admin , Recent Uploads Feature , Tracking Number of Uploads by each User , Top Uploaders</strong></em></li>\r\n</ul>\r\n\r\n<p><em><strong>After Completing this course along with these projects, you will have great knowledge about Web Development and enormous confidence&nbsp;in yourself , that you can also create Amazing Websites</strong></em></p>\r\n\r\n<p><em><strong>So why waiting , Enroll Now and take your first step to become an Awesome Web Developer</strong></em></p>', 1, '344610920', '00:06:36', '2023-05-13 11:02:56', '2023-05-13 11:02:56', NULL),
(138, 58, 'What is Jquery and why we use it ?', '<p>You will also Learn Building&nbsp;<em><strong>Awesome Modern Looking Professional Websites</strong></em>&nbsp;with&nbsp;<em><strong>Cool Features</strong></em></p>\r\n\r\n<p>Some of the Website Projects that we have in this Course are as follows :</p>\r\n\r\n<ul>\r\n	<li><em>Project Spark :</em>&nbsp;<strong>Features :</strong>&nbsp;<em><strong>Modern Professional Look , Water Ripple Background, Awesome Unique Hover Effect</strong></em></li>\r\n	<li><em>Wordpress Project1 : Multipage Corporate Site :</em>&nbsp;<strong>Features :</strong>&nbsp;<em><strong>Cool Slider , Modern Look , Portfolio Filter Feature and contain all the required sections required for a&nbsp;Corporate Site</strong></em></li>\r\n	<li><em>Wordpress Project2 :</em>&nbsp;<em><strong>Multipage Portfolio Site</strong></em></li>\r\n	<li><em>Our Mega Project : PHP Multiuser Photogallery Site :</em>&nbsp;<em><strong>Features : Awesome Hover Effects, Pagination Feature in Gallery Page , Profile Image Feature / Avatar Image Feature handled with Ajax , Ajax Image Upload , Ajax Image Approval by Admin , Recent Uploads Feature , Tracking Number of Uploads by each User , Top Uploaders</strong></em></li>\r\n</ul>\r\n\r\n<p><em><strong>After Completing this course along with these projects, you will have great knowledge about Web Development and enormous confidence&nbsp;in yourself , that you can also create Amazing Websites</strong></em></p>\r\n\r\n<p><em><strong>So why waiting , Enroll Now and take your first step to become an Awesome Web Developer</strong></em></p>', 1, '341090511', '00:10:36', '2023-05-13 11:03:40', '2023-05-13 11:03:40', NULL),
(139, 58, 'Using Jquery in Website', '<p>You will also Learn Building&nbsp;<em><strong>Awesome Modern Looking Professional Websites</strong></em>&nbsp;with&nbsp;<em><strong>Cool Features</strong></em></p>\r\n\r\n<p>Some of the Website Projects that we have in this Course are as follows :</p>\r\n\r\n<ul>\r\n	<li><em>Project Spark :</em>&nbsp;<strong>Features :</strong>&nbsp;<em><strong>Modern Professional Look , Water Ripple Background, Awesome Unique Hover Effect</strong></em></li>\r\n	<li><em>Wordpress Project1 : Multipage Corporate Site :</em>&nbsp;<strong>Features :</strong>&nbsp;<em><strong>Cool Slider , Modern Look , Portfolio Filter Feature and contain all the required sections required for a&nbsp;Corporate Site</strong></em></li>\r\n	<li><em>Wordpress Project2 :</em>&nbsp;<em><strong>Multipage Portfolio Site</strong></em></li>\r\n	<li><em>Our Mega Project : PHP Multiuser Photogallery Site :</em>&nbsp;<em><strong>Features : Awesome Hover Effects, Pagination Feature in Gallery Page , Profile Image Feature / Avatar Image Feature handled with Ajax , Ajax Image Upload , Ajax Image Approval by Admin , Recent Uploads Feature , Tracking Number of Uploads by each User , Top Uploaders</strong></em></li>\r\n</ul>\r\n\r\n<p><em><strong>After Completing this course along with these projects, you will have great knowledge about Web Development and enormous confidence&nbsp;in yourself , that you can also create Amazing Websites</strong></em></p>\r\n\r\n<p><em><strong>So why waiting , Enroll Now and take your first step to become an Awesome Web Developer</strong></em></p>', 1, '344610920', '00:05:00', '2023-05-13 11:03:55', '2023-05-13 11:03:55', NULL),
(140, 58, 'Removing HTML Content using Jquery', '<p>You will also Learn Building&nbsp;<em><strong>Awesome Modern Looking Professional Websites</strong></em>&nbsp;with&nbsp;<em><strong>Cool Features</strong></em></p>\r\n\r\n<p>Some of the Website Projects that we have in this Course are as follows :</p>\r\n\r\n<ul>\r\n	<li><em>Project Spark :</em>&nbsp;<strong>Features :</strong>&nbsp;<em><strong>Modern Professional Look , Water Ripple Background, Awesome Unique Hover Effect</strong></em></li>\r\n	<li><em>Wordpress Project1 : Multipage Corporate Site :</em>&nbsp;<strong>Features :</strong>&nbsp;<em><strong>Cool Slider , Modern Look , Portfolio Filter Feature and contain all the required sections required for a&nbsp;Corporate Site</strong></em></li>\r\n	<li><em>Wordpress Project2 :</em>&nbsp;<em><strong>Multipage Portfolio Site</strong></em></li>\r\n	<li><em>Our Mega Project : PHP Multiuser Photogallery Site :</em>&nbsp;<em><strong>Features : Awesome Hover Effects, Pagination Feature in Gallery Page , Profile Image Feature / Avatar Image Feature handled with Ajax , Ajax Image Upload , Ajax Image Approval by Admin , Recent Uploads Feature , Tracking Number of Uploads by each User , Top Uploaders</strong></em></li>\r\n</ul>\r\n\r\n<p><em><strong>After Completing this course along with these projects, you will have great knowledge about Web Development and enormous confidence&nbsp;in yourself , that you can also create Amazing Websites</strong></em></p>\r\n\r\n<p><em><strong>So why waiting , Enroll Now and take your first step to become an Awesome Web Developer</strong></em></p>', 1, '346943885', '00:05:30', '2023-05-13 11:04:11', '2023-05-13 11:04:11', NULL),
(141, 59, 'Welcome to the Course | Personal Finance Course', '<p><strong>This online personal finance course will teach you how to master your money, how to grow your income, reduce your debt, budget the smart way, invest your money, and much more!</strong></p>\r\n\r\n<ul>\r\n	<li>Do you need help handling your money?</li>\r\n	<li>Can you imagine a life of financial freedom?</li>\r\n	<li>Do you want to make more money?</li>\r\n	<li>Are you interested in investing but just don&rsquo;t know where to start?</li>\r\n	<li>Have you struggled with credit card or student loan debt?</li>\r\n	<li>Do you want to own a home?</li>\r\n</ul>\r\n\r\n<p>If you answered yes to any of these questions, you&rsquo;re in the right place. We know how hard it is to get by in the modern world. We understand your struggles. Heck, we&rsquo;ve lived them. But we&rsquo;ve been able to turn it around ourselves, to not just survive but to THRIVE!</p>\r\n\r\n<p><strong>Phil paid off over $140,000 in student loan debt&nbsp;</strong>and built a 6-figure side business within 5 years of college graduation.&nbsp;<strong>Mike &amp; Lauren are on the path towards super-early retirement,</strong>&nbsp;are the ultimate personal finance hackers, and are currently traveling the country with their newborn son.</p>', 1, '344610920', '00:01:30', '2023-05-14 02:15:23', '2023-05-14 02:15:23', NULL),
(142, 59, 'The Golden Rule of Personal Finance | Personal Finance Course', '<p><strong>This isn&rsquo;t your traditional personal finance course.</strong>&nbsp;We&rsquo;re not bankers or creditors. We&rsquo;re not trust fund babies who haven&rsquo;t worked for themselves. We&rsquo;re just like you, and that&rsquo;s what this course is all about. This is a course that teaches normal people like you the skills and knowledge to truly understand how money works. We show you the path towards financial freedom.</p>\r\n\r\n<p>This online personal finance course covers all of the following topics:</p>\r\n\r\n<ul>\r\n	<li><strong>Understand Your Money</strong></li>\r\n	<li><strong>Budgeting, Savings, Reducing Expenses</strong></li>\r\n	<li><strong>Grow Your Income</strong></li>\r\n	<li><strong>Understanding Credit Cards</strong></li>\r\n	<li><strong>Loans, Debt, Debt Reduction</strong></li>\r\n	<li><strong>Investing 101</strong></li>\r\n	<li><strong>Real Estate, Mortgages, and Other Big Ticket Purchases</strong></li>\r\n	<li><strong>Retirement Basics</strong></li>\r\n	<li><strong>Early Retirement Plan &amp; Financial Freedom</strong></li>\r\n	<li><strong>Taxes</strong></li>\r\n	<li><strong>Love &amp; Money</strong></li>\r\n	<li><strong>Youth &amp; Money</strong></li>\r\n	<li><strong>Psychology &amp; Money</strong></li>\r\n</ul>', 1, '341090511', '00:12:05', '2023-05-14 02:15:49', '2023-05-14 02:15:49', NULL);
INSERT INTO `course_classes` (`id`, `course_section_id`, `name`, `description`, `state`, `vimeo_id`, `time`, `created_at`, `updated_at`, `deleted_at`) VALUES
(143, 59, 'How to Retire Early - in 4 Minutes | Personal Finance Course', '<p><strong>Master your own finances to build wealth for you and your family.</strong></p>\r\n\r\n<p>Regardless of what your financial expertise is or how much money you have in your bank account, this in-depth course is designed to provide you with everything you need to take your finances to the next level.</p>\r\n\r\n<p>Whether you&rsquo;re in debt and don&rsquo;t have a clue where to go from here, or you&rsquo;re just wondering where to invest your money, you&rsquo;ll learn the next steps to success. By truly understanding how things like credit, compound interest, taxes, and investment accounts work, you&rsquo;ll be in a better position for financial freedom.</p>\r\n\r\n<p>By the end of this course, you&rsquo;ll have a better grasp of your own finances. You&rsquo;ll know the next steps towards financial freedom. You&rsquo;ll know how to save more, spend less, and invest smarter. You&rsquo;ll be less stressed and happier. That&#39;s our goal.&nbsp;<strong>Take the first step to financial success with this amazing personal finance course.</strong></p>\r\n\r\n<p><strong>About the instructors:</strong></p>\r\n\r\n<p><strong>Phil Ebiner</strong>&nbsp;started teaching online courses in 2012, and now has over 130,000 happy students on Udemy learning all sorts of things from personal finance and business building to video editing and motion graphics. Phil is passionate about helping people understand their finances and uses tools like video to break down the complexity of these topics.</p>\r\n\r\n<p><strong>Mike and Lauren</strong>&nbsp;are personal finance wizards with a YouTube channel geared at helping others tackle their financial problems. Mike and Lauren don&rsquo;t just talk the talk, but also walk the walk of early retirement and living a financially smart life.</p>', 1, '348304224', '00:06:36', '2023-05-14 02:16:09', '2023-05-14 02:16:09', NULL),
(144, 60, 'Why Your Savings Rate is Very Important | Personal Finance Course', '<p><strong>This online personal finance course will teach you how to master your money, how to grow your income, reduce your debt, budget the smart way, invest your money, and much more!</strong></p>\r\n\r\n<ul>\r\n	<li>Do you need help handling your money?</li>\r\n	<li>Can you imagine a life of financial freedom?</li>\r\n	<li>Do you want to make more money?</li>\r\n	<li>Are you interested in investing but just don&rsquo;t know where to start?</li>\r\n	<li>Have you struggled with credit card or student loan debt?</li>\r\n	<li>Do you want to own a home?</li>\r\n</ul>', 1, '343467421', '00:15:05', '2023-05-14 02:16:36', '2023-05-14 02:16:36', NULL),
(145, 60, 'Easy Ways to Reduce Expenses | Personal Finance Course', '<p>If you answered yes to any of these questions, you&rsquo;re in the right place. We know how hard it is to get by in the modern world. We understand your struggles. Heck, we&rsquo;ve lived them. But we&rsquo;ve been able to turn it around ourselves, to not just survive but to THRIVE!</p>\r\n\r\n<p><strong>Phil paid off over $140,000 in student loan debt&nbsp;</strong>and built a 6-figure side business within 5 years of college graduation.&nbsp;<strong>Mike &amp; Lauren are on the path towards super-early retirement,</strong>&nbsp;are the ultimate personal finance hackers, and are currently traveling the country with their newborn son.</p>', 1, '346627381', '00:07:36', '2023-05-14 02:17:03', '2023-05-14 02:17:03', NULL),
(146, 61, 'Section Introduction | Personal Finance Course', '<p>If you answered yes to any of these questions, you&rsquo;re in the right place. We know how hard it is to get by in the modern world. We understand your struggles. Heck, we&rsquo;ve lived them. But we&rsquo;ve been able to turn it around ourselves, to not just survive but to THRIVE!</p>\r\n\r\n<p><strong>Phil paid off over $140,000 in student loan debt&nbsp;</strong>and built a 6-figure side business within 5 years of college graduation.&nbsp;<strong>Mike &amp; Lauren are on the path towards super-early retirement,</strong>&nbsp;are the ultimate personal finance hackers, and are currently traveling the country with their newborn son.</p>\r\n\r\n<p><strong>This isn&rsquo;t your traditional personal finance course.</strong>&nbsp;We&rsquo;re not bankers or creditors. We&rsquo;re not trust fund babies who haven&rsquo;t worked for themselves. We&rsquo;re just like you, and that&rsquo;s what this course is all about. This is a course that teaches normal people like you the skills and knowledge to truly understand how money works. We show you the path towards financial freedom.</p>', 1, '343467421', '00:06:17', '2023-05-14 02:17:32', '2023-05-14 02:17:32', NULL),
(147, 61, 'Increasing Income Versus Reducing Expenses | Personal Finance Course', '<p><strong>This online personal finance course will teach you how to master your money, how to grow your income, reduce your debt, budget the smart way, invest your money, and much more!</strong></p>\r\n\r\n<ul>\r\n	<li>Do you need help handling your money?</li>\r\n	<li>Can you imagine a life of financial freedom?</li>\r\n	<li>Do you want to make more money?</li>\r\n	<li>Are you interested in investing but just don&rsquo;t know where to start?</li>\r\n	<li>Have you struggled with credit card or student loan debt?</li>\r\n	<li>Do you want to own a home?</li>\r\n</ul>\r\n\r\n<p>If you answered yes to any of these questions, you&rsquo;re in the right place. We know how hard it is to get by in the modern world. We understand your struggles. Heck, we&rsquo;ve lived them. But we&rsquo;ve been able to turn it around ourselves, to not just survive but to THRIVE!</p>', 1, '348304224', '00:06:40', '2023-05-14 02:17:51', '2023-05-14 02:17:51', NULL),
(148, 61, 'Side Income: Make Money Outside of the Office | Personal Finance Course', '<p><strong>This online personal finance course will teach you how to master your money, how to grow your income, reduce your debt, budget the smart way, invest your money, and much more!</strong></p>\r\n\r\n<ul>\r\n	<li>Do you need help handling your money?</li>\r\n	<li>Can you imagine a life of financial freedom?</li>\r\n	<li>Do you want to make more money?</li>\r\n	<li>Are you interested in investing but just don&rsquo;t know where to start?</li>\r\n	<li>Have you struggled with credit card or student loan debt?</li>\r\n	<li>Do you want to own a home?</li>\r\n</ul>', 1, '341631029', '00:06:30', '2023-05-14 02:18:09', '2023-05-14 02:18:09', NULL),
(149, 62, 'Section Introduction | Personal Finance Course', '<p>If you answered yes to any of these questions, you&rsquo;re in the right place. We know how hard it is to get by in the modern world. We understand your struggles. Heck, we&rsquo;ve lived them. But we&rsquo;ve been able to turn it around ourselves, to not just survive but to THRIVE!</p>\r\n\r\n<p><strong>Phil paid off over $140,000 in student loan debt&nbsp;</strong>and built a 6-figure side business within 5 years of college graduation.&nbsp;<strong>Mike &amp; Lauren are on the path towards super-early retirement,</strong>&nbsp;are the ultimate personal finance hackers, and are currently traveling the country with their newborn son.</p>\r\n\r\n<p><strong>This isn&rsquo;t your traditional personal finance course.</strong>&nbsp;We&rsquo;re not bankers or creditors. We&rsquo;re not trust fund babies who haven&rsquo;t worked for themselves. We&rsquo;re just like you, and that&rsquo;s what this course is all about. This is a course that teaches normal people like you the skills and knowledge to truly understand how money works. We show you the path towards financial freedom.</p>\r\n\r\n<p>This online personal finance course covers all of the following topics:</p>\r\n\r\n<ul>\r\n	<li><strong>Understand Your Money</strong></li>\r\n	<li><strong>Budgeting, Savings, Reducing Expenses</strong></li>\r\n	<li><strong>Grow Your Income</strong></li>\r\n	<li><strong>Understanding Credit Cards</strong></li>\r\n	<li><strong>Loans, Debt, Debt Reduction</strong></li>\r\n</ul>', 1, '341090511', '00:01:30', '2023-05-14 02:19:50', '2023-05-14 02:19:50', NULL),
(150, 62, 'Credit Card Rewards: Picking the Best Credit Card | Personal Finance Course', '<p><strong>This isn&rsquo;t your traditional personal finance course.</strong>&nbsp;We&rsquo;re not bankers or creditors. We&rsquo;re not trust fund babies who haven&rsquo;t worked for themselves. We&rsquo;re just like you, and that&rsquo;s what this course is all about. This is a course that teaches normal people like you the skills and knowledge to truly understand how money works. We show you the path towards financial freedom.</p>\r\n\r\n<p>This online personal finance course covers all of the following topics:</p>\r\n\r\n<ul>\r\n	<li><strong>Understand Your Money</strong></li>\r\n	<li><strong>Budgeting, Savings, Reducing Expenses</strong></li>\r\n	<li><strong>Grow Your Income</strong></li>\r\n	<li><strong>Understanding Credit Cards</strong></li>\r\n	<li><strong>Loans, Debt, Debt Reduction</strong></li>\r\n	<li><strong>Investing 101</strong></li>\r\n	<li><strong>Real Estate, Mortgages, and Other Big Ticket Purchases</strong></li>\r\n	<li><strong>Retirement Basics</strong></li>\r\n	<li><strong>Early Retirement Plan &amp; Financial Freedom</strong></li>\r\n	<li><strong>Taxes</strong></li>\r\n	<li><strong>Love &amp; Money</strong></li>\r\n</ul>', 1, '344610920', '00:01:30', '2023-05-14 02:20:05', '2023-05-14 02:20:05', NULL),
(151, 63, 'How to Use This Course', '<p><strong>Congratulations,&nbsp;You Found It!</strong></p>\r\n\r\n<p>The Most Complete Course on&nbsp;<strong>Digital Marketing</strong>, with&nbsp;<strong>24 Courses in 1!</strong></p>\r\n\r\n<p>Instead of buying 24 different Courses about Digital Marketing -<strong>&nbsp;<em>This Course Will Cover All Your Digital Marketing Needs.</em></strong></p>\r\n\r\n<p>This is a&nbsp;<strong>100% Practical Course</strong>&nbsp;- Get Ready for Hands-On Experience from the First Lecture!</p>\r\n\r\n<p><strong>Take A Look at&nbsp;These&nbsp;Top Rated Reviews...</strong></p>\r\n\r\n<p><em>This is a whole University degree, for such a little amount of money.</em>&nbsp;<strong>- Livingstone Ayehangane</strong></p>\r\n\r\n<p><em>Buying this course was the most important decision i ever made in my career.</em>&nbsp;<strong>- Mohamed Saeed</strong></p>\r\n\r\n<p><em>Robin and jesper are no doubt one of the best digital marketing experts and teachers out there, I love this course.</em>&nbsp;<strong>- Shaheer Farrukh</strong></p>\r\n\r\n<p><em>The best course ever. You can always come back to any part of the course if you need to. Amazing updates and golden value. This is my go to bible for everything I do. Would be lost without it.</em>&nbsp;<strong>- Rajaa Zaidi</strong></p>', 1, '344610920', '00:00:36', '2023-05-14 02:23:08', '2023-05-14 02:23:08', NULL),
(152, 63, 'What Exactly is Digital Marketing?', '<p><strong>Congratulations,&nbsp;You Found It!</strong></p>\r\n\r\n<p>The Most Complete Course on&nbsp;<strong>Digital Marketing</strong>, with&nbsp;<strong>24 Courses in 1!</strong></p>\r\n\r\n<p>Instead of buying 24 different Courses about Digital Marketing -<strong>&nbsp;<em>This Course Will Cover All Your Digital Marketing Needs.</em></strong></p>\r\n\r\n<p>This is a&nbsp;<strong>100% Practical Course</strong>&nbsp;- Get Ready for Hands-On Experience from the First Lecture!</p>\r\n\r\n<p><strong>Take A Look at&nbsp;These&nbsp;Top Rated Reviews...</strong></p>\r\n\r\n<p><em>This is a whole University degree, for such a little amount of money.</em>&nbsp;<strong>- Livingstone Ayehangane</strong></p>\r\n\r\n<p><em>Buying this course was the most important decision i ever made in my career.</em>&nbsp;<strong>- Mohamed Saeed</strong></p>\r\n\r\n<p><em>Robin and jesper are no doubt one of the best digital marketing experts and teachers out there, I love this course.</em>&nbsp;<strong>- Shaheer Farrukh</strong></p>\r\n\r\n<p><em>The best course ever. You can always come back to any part of the course if you need to. Amazing updates and golden value. This is my go to bible for everything I do. Would be lost without it.</em>&nbsp;<strong>- Rajaa Zaidi</strong></p>', 1, '341090511', '00:07:36', '2023-05-14 02:23:22', '2023-05-14 02:23:22', NULL),
(153, 63, 'Market Research Explained', '<p><strong>Course Goals:</strong></p>\r\n\r\n<ul>\r\n	<li>\r\n	<p>Grow Your Business Online</p>\r\n	</li>\r\n	<li>\r\n	<p>Get Hired as a Digital Marketing Expert</p>\r\n	</li>\r\n	<li>\r\n	<p>Work as a Digital Marketing Freelancer</p>\r\n	</li>\r\n</ul>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>Includes:</strong></p>\r\n\r\n<p><strong>&nbsp; &nbsp; &nbsp; &nbsp; DIGITAL&nbsp;MARKETING&nbsp;STRATEGY</strong></p>\r\n\r\n<ol>\r\n	<li>\r\n	<p>Market Research</p>\r\n	</li>\r\n	<li>\r\n	<p>Set Up a Website</p>\r\n	</li>\r\n	<li>\r\n	<p>SEO&nbsp;(Search Enginge Optimization)</p>\r\n	</li>\r\n	<li>\r\n	<p>Email Marketing</p>\r\n	</li>\r\n	<li>\r\n	<p>Google Analytics</p>\r\n\r\n	<p><br />\r\n	<strong>DIGITAL&nbsp;MARKETING&nbsp;IN-DEPTH</strong></p>\r\n	</li>\r\n	<li>\r\n	<p>Prompt Engineering with ChatGPT</p>\r\n	</li>\r\n	<li>\r\n	<p>Branding</p>\r\n	</li>\r\n	<li>\r\n	<p>Content Marketing</p>\r\n	</li>\r\n	<li>\r\n	<p>Sales Psychology</p>\r\n	</li>\r\n	<li>\r\n	<p>Copywriting</p>\r\n	</li>\r\n</ol>', 1, '313045749', '00:06:17', '2023-05-14 02:23:42', '2023-05-14 02:23:42', NULL),
(154, 64, 'Find Target Audience', '<p><strong>Congratulations,&nbsp;You Found It!</strong></p>\r\n\r\n<p>The Most Complete Course on&nbsp;<strong>Digital Marketing</strong>, with&nbsp;<strong>24 Courses in 1!</strong></p>\r\n\r\n<p>Instead of buying 24 different Courses about Digital Marketing -<strong>&nbsp;<em>This Course Will Cover All Your Digital Marketing Needs.</em></strong></p>\r\n\r\n<p>This is a&nbsp;<strong>100% Practical Course</strong>&nbsp;- Get Ready for Hands-On Experience from the First Lecture!</p>\r\n\r\n<p><strong>Take A Look at&nbsp;These&nbsp;Top Rated Reviews...</strong></p>\r\n\r\n<p><em>This is a whole University degree, for such a little amount of money.</em>&nbsp;<strong>- Livingstone Ayehangane</strong></p>\r\n\r\n<p><em>Buying this course was the most important decision i ever made in my career.</em>&nbsp;<strong>- Mohamed Saeed</strong></p>\r\n\r\n<p><em>Robin and jesper are no doubt one of the best digital marketing experts and teachers out there, I love this course.</em>&nbsp;<strong>- Shaheer Farrukh</strong></p>\r\n\r\n<p><em>The best course ever. You can always come back to any part of the course if you need to. Amazing updates and golden value. This is my go to bible for everything I do. Would be lost without it.</em>&nbsp;<strong>- Rajaa Zaidi</strong></p>', 1, '341631029', '00:02:30', '2023-05-14 02:24:10', '2023-05-14 02:24:10', NULL),
(155, 64, 'Exercise - Find Digital Marketing Channels', '<p><strong>Course Goals:</strong></p>\r\n\r\n<ul>\r\n	<li>\r\n	<p>Grow Your Business Online</p>\r\n	</li>\r\n	<li>\r\n	<p>Get Hired as a Digital Marketing Expert</p>\r\n	</li>\r\n	<li>\r\n	<p>Work as a Digital Marketing Freelancer</p>\r\n	</li>\r\n</ul>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>Includes:</strong></p>\r\n\r\n<p><strong>&nbsp; &nbsp; &nbsp; &nbsp; DIGITAL&nbsp;MARKETING&nbsp;STRATEGY</strong></p>\r\n\r\n<ol>\r\n	<li>\r\n	<p>Market Research</p>\r\n	</li>\r\n	<li>\r\n	<p>Set Up a Website</p>\r\n	</li>\r\n	<li>\r\n	<p>SEO&nbsp;(Search Enginge Optimization)</p>\r\n	</li>\r\n	<li>\r\n	<p>Email Marketing</p>\r\n	</li>\r\n	<li>\r\n	<p>Google Analytics</p>\r\n\r\n	<p><br />\r\n	<strong>DIGITAL&nbsp;MARKETING&nbsp;IN-DEPTH</strong></p>\r\n	</li>\r\n	<li>\r\n	<p>Prompt Engineering with ChatGPT</p>\r\n	</li>\r\n	<li>\r\n	<p>Branding</p>\r\n	</li>\r\n	<li>\r\n	<p>Content Marketing</p>\r\n	</li>\r\n	<li>\r\n	<p>Sales Psychology</p>\r\n	</li>\r\n	<li>\r\n	<p>Copywriting</p>\r\n\r\n	<p><br />\r\n	<strong>DIGITAL&nbsp;MARKETING&nbsp;CHANNELS</strong></p>\r\n	</li>\r\n	<li>\r\n	<p>Google Ads</p>\r\n	</li>\r\n	<li>\r\n	<p>YouTube Ads</p>\r\n	</li>\r\n	<li>\r\n	<p>Facebook Ads</p>\r\n	</li>\r\n	<li>\r\n	<p>Facebook Marketing</p>\r\n	</li>\r\n	<li>\r\n	<p>Instagram Marketing</p>\r\n	</li>\r\n	<li>\r\n	<p>YouTube Marketing</p>\r\n	</li>\r\n	<li>\r\n	<p>Pinterest Marketing</p>\r\n	</li>\r\n	<li>\r\n	<p>LinkedIn Marketing</p>\r\n	</li>\r\n	<li>\r\n	<p>Quora Marketing</p>\r\n	</li>\r\n	<li>\r\n	<p>Twitter Marketing</p>\r\n	</li>\r\n	<li>\r\n	<p>Content&nbsp;Marketing Machine</p>\r\n\r\n	<p><br />\r\n	<strong>DIGITAL&nbsp;MARKETING&nbsp;PROFESSIONAL</strong></p>\r\n	</li>\r\n	<li>\r\n	<p>Digital Marketing Freelancing</p>\r\n	</li>\r\n	<li>\r\n	<p>WordPress Masterclass</p>\r\n	</li>\r\n	<li>\r\n	<p>SEO Masterclass</p>\r\n\r\n	<p>&nbsp;</p>\r\n	</li>\r\n</ol>', 1, '344610920', '00:05:34', '2023-05-14 02:24:35', '2023-05-14 02:24:35', NULL),
(156, 64, 'Why You Need a Marketing Strategy', '<p><strong>Congratulations,&nbsp;You Found It!</strong></p>\r\n\r\n<p>The Most Complete Course on&nbsp;<strong>Digital Marketing</strong>, with&nbsp;<strong>24 Courses in 1!</strong></p>\r\n\r\n<p>Instead of buying 24 different Courses about Digital Marketing -<strong>&nbsp;<em>This Course Will Cover All Your Digital Marketing Needs.</em></strong></p>\r\n\r\n<p>This is a&nbsp;<strong>100% Practical Course</strong>&nbsp;- Get Ready for Hands-On Experience from the First Lecture!</p>\r\n\r\n<p><strong>Take A Look at&nbsp;These&nbsp;Top Rated Reviews...</strong></p>\r\n\r\n<p><em>This is a whole University degree, for such a little amount of money.</em>&nbsp;<strong>- Livingstone Ayehangane</strong></p>\r\n\r\n<p><em>Buying this course was the most important decision i ever made in my career.</em>&nbsp;<strong>- Mohamed Saeed</strong></p>\r\n\r\n<p><em>Robin and jesper are no doubt one of the best digital marketing experts and teachers out there, I love this course.</em>&nbsp;<strong>- Shaheer Farrukh</strong></p>\r\n\r\n<p><em>The best course ever. You can always come back to any part of the course if you need to. Amazing updates and golden value. This is my go to bible for everything I do. Would be lost without it.</em>&nbsp;<strong>- Rajaa Zaidi</strong></p>', 1, '348304224', '00:01:22', '2023-05-14 02:25:09', '2023-05-14 02:25:09', NULL),
(157, 65, 'What You\'ll Get', '<p><strong>Course Goals:</strong></p>\r\n\r\n<ul>\r\n	<li>\r\n	<p>Grow Your Business Online</p>\r\n	</li>\r\n	<li>\r\n	<p>Get Hired as a Digital Marketing Expert</p>\r\n	</li>\r\n	<li>\r\n	<p>Work as a Digital Marketing Freelancer</p>\r\n	</li>\r\n</ul>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>Includes:</strong></p>\r\n\r\n<p><strong>&nbsp; &nbsp; &nbsp; &nbsp; DIGITAL&nbsp;MARKETING&nbsp;STRATEGY</strong></p>\r\n\r\n<ol>\r\n	<li>\r\n	<p>Market Research</p>\r\n	</li>\r\n	<li>\r\n	<p>Set Up a Website</p>\r\n	</li>\r\n	<li>\r\n	<p>SEO&nbsp;(Search Enginge Optimization)</p>\r\n	</li>\r\n	<li>\r\n	<p>Email Marketing</p>\r\n	</li>\r\n	<li>\r\n	<p>Google Analytics</p>\r\n\r\n	<p><br />\r\n	<strong>DIGITAL&nbsp;MARKETING&nbsp;IN-DEPTH</strong></p>\r\n	</li>\r\n	<li>\r\n	<p>Prompt Engineering with ChatGPT</p>\r\n	</li>\r\n	<li>\r\n	<p>Branding</p>\r\n	</li>\r\n	<li>\r\n	<p>Content Marketing</p>\r\n	</li>\r\n	<li>\r\n	<p>Sales Psychology</p>\r\n	</li>\r\n	<li>\r\n	<p>Copywriting</p>\r\n\r\n	<p><br />\r\n	<strong>DIGITAL&nbsp;MARKETING&nbsp;CHANNELS</strong></p>\r\n	</li>\r\n	<li>\r\n	<p>Google Ads</p>\r\n	</li>\r\n	<li>\r\n	<p>YouTube Ads</p>\r\n	</li>\r\n	<li>\r\n	<p>Facebook Ads</p>\r\n	</li>\r\n	<li>\r\n	<p>Facebook Marketing</p>\r\n	</li>\r\n	<li>\r\n	<p>Instagram Marketing</p>\r\n	</li>\r\n	<li>\r\n	<p>YouTube Marketing</p>\r\n	</li>\r\n	<li>\r\n	<p>Pinterest Marketing</p>\r\n	</li>\r\n	<li>\r\n	<p>LinkedIn Marketing</p>\r\n	</li>\r\n	<li>\r\n	<p>Quora Marketing</p>\r\n	</li>\r\n	<li>\r\n	<p>Twitter Marketing</p>\r\n	</li>\r\n	<li>\r\n	<p>Content&nbsp;Marketing Machine</p>\r\n\r\n	<p><br />\r\n	<strong>DIGITAL&nbsp;MARKETING&nbsp;PROFESSIONAL</strong></p>\r\n	</li>\r\n	<li>\r\n	<p>Digital Marketing Freelancing</p>\r\n	</li>\r\n	<li>\r\n	<p>WordPress Masterclass</p>\r\n	</li>\r\n	<li>\r\n	<p>SEO Masterclass</p>\r\n	</li>\r\n</ol>\r\n\r\n<p><strong>- Lifetime Access to Future Updates</strong></p>\r\n\r\n<p><strong>- Tools, Articles &amp; Templates</strong></p>\r\n\r\n<p>-&nbsp;<strong>Quick &amp; Helpful Support in the Q&amp;A section</strong></p>\r\n\r\n<p>-&nbsp;<strong>Downloadable Certificate of Completion</strong></p>\r\n\r\n<p>-&nbsp;<strong>30 Day Money Back Guarantee (No Questions Asked)</strong></p>', 1, '348304224', '00:10:30', '2023-05-14 02:25:45', '2023-05-14 02:25:45', NULL),
(158, 65, 'What to Expect', '<p><strong>Congratulations,&nbsp;You Found It!</strong></p>\r\n\r\n<p>The Most Complete Course on&nbsp;<strong>Digital Marketing</strong>, with&nbsp;<strong>24 Courses in 1!</strong></p>\r\n\r\n<p>Instead of buying 24 different Courses about Digital Marketing -<strong>&nbsp;<em>This Course Will Cover All Your Digital Marketing Needs.</em></strong></p>\r\n\r\n<p>This is a&nbsp;<strong>100% Practical Course</strong>&nbsp;- Get Ready for Hands-On Experience from the First Lecture!</p>\r\n\r\n<p><strong>Take A Look at&nbsp;These&nbsp;Top Rated Reviews...</strong></p>\r\n\r\n<p><em>This is a whole University degree, for such a little amount of money.</em>&nbsp;<strong>- Livingstone Ayehangane</strong></p>\r\n\r\n<p><em>Buying this course was the most important decision i ever made in my career.</em>&nbsp;<strong>- Mohamed Saeed</strong></p>\r\n\r\n<p><em>Robin and jesper are no doubt one of the best digital marketing experts and teachers out there, I love this course.</em>&nbsp;<strong>- Shaheer Farrukh</strong></p>\r\n\r\n<p><em>The best course ever. You can always come back to any part of the course if you need to. Amazing updates and golden value. This is my go to bible for everything I do. Would be lost without it.</em>&nbsp;<strong>- Rajaa Zaidi</strong></p>', 1, '341631029', '00:02:36', '2023-05-14 02:26:08', '2023-05-14 02:26:08', NULL),
(159, 66, 'Keyword Research Explained', '<p><strong>Course Goals:</strong></p>\r\n\r\n<ul>\r\n	<li>\r\n	<p>Grow Your Business Online</p>\r\n	</li>\r\n	<li>\r\n	<p>Get Hired as a Digital Marketing Expert</p>\r\n	</li>\r\n	<li>\r\n	<p>Work as a Digital Marketing Freelancer</p>\r\n	</li>\r\n</ul>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>Includes:</strong></p>\r\n\r\n<p><strong>&nbsp; &nbsp; &nbsp; &nbsp; DIGITAL&nbsp;MARKETING&nbsp;STRATEGY</strong></p>\r\n\r\n<ol>\r\n	<li>\r\n	<p>Market Research</p>\r\n	</li>\r\n	<li>\r\n	<p>Set Up a Website</p>\r\n	</li>\r\n	<li>\r\n	<p>SEO&nbsp;(Search Enginge Optimization)</p>\r\n	</li>\r\n	<li>\r\n	<p>Email Marketing</p>\r\n	</li>\r\n	<li>\r\n	<p>Google Analytics</p>\r\n\r\n	<p><br />\r\n	<strong>DIGITAL&nbsp;MARKETING&nbsp;IN-DEPTH</strong></p>\r\n	</li>\r\n	<li>\r\n	<p>Prompt Engineering with ChatGPT</p>\r\n	</li>\r\n	<li>\r\n	<p>Branding</p>\r\n	</li>\r\n	<li>\r\n	<p>Content Marketing</p>\r\n	</li>\r\n	<li>\r\n	<p>Sales Psychology</p>\r\n	</li>\r\n	<li>\r\n	<p>Copywriting</p>\r\n\r\n	<p><br />\r\n	<strong>DIGITAL&nbsp;MARKETING&nbsp;CHANNELS</strong></p>\r\n	</li>\r\n	<li>\r\n	<p>Google Ads</p>\r\n	</li>\r\n	<li>\r\n	<p>YouTube Ads</p>\r\n	</li>\r\n	<li>\r\n	<p>Facebook Ads</p>\r\n	</li>\r\n	<li>\r\n	<p>Facebook Marketing</p>\r\n	</li>\r\n	<li>\r\n	<p>Instagram Marketing</p>\r\n	</li>\r\n	<li>\r\n	<p>YouTube Marketing</p>\r\n	</li>\r\n	<li>\r\n	<p>Pinterest Marketing</p>\r\n	</li>\r\n	<li>\r\n	<p>LinkedIn Marketing</p>\r\n	</li>\r\n	<li>\r\n	<p>Quora Marketing</p>\r\n	</li>\r\n	<li>\r\n	<p>Twitter Marketing</p>\r\n	</li>\r\n	<li>\r\n	<p>Content&nbsp;Marketing Machine</p>\r\n\r\n	<p><br />\r\n	<strong>DIGITAL&nbsp;MARKETING&nbsp;PROFESSIONAL</strong></p>\r\n	</li>\r\n	<li>\r\n	<p>Digital Marketing Freelancing</p>\r\n	</li>\r\n	<li>\r\n	<p>WordPress Masterclass</p>\r\n	</li>\r\n	<li>\r\n	<p>SEO Masterclass</p>\r\n	</li>\r\n</ol>', 1, '341090511', '00:07:36', '2023-05-14 02:26:45', '2023-05-14 02:26:45', NULL),
(160, 66, 'How to Keyword Research', '<ol>\r\n	<li>\r\n	<p><strong>DIGITAL&nbsp;MARKETING&nbsp;PROFESSIONAL</strong></p>\r\n	</li>\r\n	<li>\r\n	<p>Digital Marketing Freelancing</p>\r\n	</li>\r\n	<li>\r\n	<p>WordPress Masterclass</p>\r\n	</li>\r\n	<li>\r\n	<p>SEO Masterclass</p>\r\n\r\n	<p>&nbsp;</p>\r\n	</li>\r\n</ol>\r\n\r\n<p><strong>- Lifetime Access to Future Updates</strong></p>\r\n\r\n<p><strong>- Tools, Articles &amp; Templates</strong></p>\r\n\r\n<p>-&nbsp;<strong>Quick &amp; Helpful Support in the Q&amp;A section</strong></p>\r\n\r\n<p>-&nbsp;<strong>Downloadable Certificate of Completion</strong></p>\r\n\r\n<p>-&nbsp;<strong>30 Day Money Back Guarantee (No Questions Asked)</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>This course will require you to sign up to Bluehost to follow our Digital Marketing strategy step-by-step.</p>\r\n\r\n<p>You will also need to sign up for ChatGPT which is completely free.</p>', 1, '344610920', '00:07:36', '2023-05-14 02:27:31', '2023-05-14 02:27:31', NULL),
(161, 67, 'Find Your Keywords Assignment', '<p><strong>Congratulations,&nbsp;You Found It!</strong></p>\r\n\r\n<p>The Most Complete Course on&nbsp;<strong>Digital Marketing</strong>, with&nbsp;<strong>24 Courses in 1!</strong></p>\r\n\r\n<p>Instead of buying 24 different Courses about Digital Marketing -<strong>&nbsp;<em>This Course Will Cover All Your Digital Marketing Needs.</em></strong></p>\r\n\r\n<p>This is a&nbsp;<strong>100% Practical Course</strong>&nbsp;- Get Ready for Hands-On Experience from the First Lecture!</p>\r\n\r\n<p><strong>Take A Look at&nbsp;These&nbsp;Top Rated Reviews...</strong></p>\r\n\r\n<p><em>This is a whole University degree, for such a little amount of money.</em>&nbsp;<strong>- Livingstone Ayehangane</strong></p>\r\n\r\n<p><em>Buying this course was the most important decision i ever made in my career.</em>&nbsp;<strong>- Mohamed Saeed</strong></p>\r\n\r\n<p><em>Robin and jesper are no doubt one of the best digital marketing experts and teachers out there, I love this course.</em>&nbsp;<strong>- Shaheer Farrukh</strong></p>\r\n\r\n<p><em>The best course ever. You can always come back to any part of the course if you need to. Amazing updates and golden value. This is my go to bible for everything I do. Would be lost without it.</em>&nbsp;<strong>- Rajaa Zaidi</strong></p>', 1, '344610920', '00:01:22', '2023-05-14 02:27:47', '2023-05-14 02:27:47', NULL),
(162, 68, 'How to Use This Course', '<p><strong>Congratulations,&nbsp;You Found It!</strong></p>\r\n\r\n<p>The Most Complete Course on&nbsp;<strong>Digital Marketing</strong>, with&nbsp;<strong>24 Courses in 1!</strong></p>\r\n\r\n<p>Instead of buying 24 different Courses about Digital Marketing -<strong>&nbsp;<em>This Course Will Cover All Your Digital Marketing Needs.</em></strong></p>\r\n\r\n<p>This is a&nbsp;<strong>100% Practical Course</strong>&nbsp;- Get Ready for Hands-On Experience from the First Lecture!</p>\r\n\r\n<p><strong>Take A Look at&nbsp;These&nbsp;Top Rated Reviews...</strong></p>\r\n\r\n<p><em>This is a whole University degree, for such a little amount of money.</em>&nbsp;<strong>- Livingstone Ayehangane</strong></p>\r\n\r\n<p><em>Buying this course was the most important decision i ever made in my career.</em>&nbsp;<strong>- Mohamed Saeed</strong></p>\r\n\r\n<p><em>Robin and jesper are no doubt one of the best digital marketing experts and teachers out there, I love this course.</em>&nbsp;<strong>- Shaheer Farrukh</strong></p>\r\n\r\n<p><em>The best course ever. You can always come back to any part of the course if you need to. Amazing updates and golden value. This is my go to bible for everything I do. Would be lost without it.</em>&nbsp;<strong>- Rajaa Zaidi</strong></p>', 1, '341090511', '00:06:40', '2023-05-14 02:23:08', '2023-05-14 02:23:08', NULL),
(163, 68, 'What Exactly is Digital Marketing?', '<p><strong>Congratulations,&nbsp;You Found It!</strong></p>\r\n\r\n<p>The Most Complete Course on&nbsp;<strong>Digital Marketing</strong>, with&nbsp;<strong>24 Courses in 1!</strong></p>\r\n\r\n<p>Instead of buying 24 different Courses about Digital Marketing -<strong>&nbsp;<em>This Course Will Cover All Your Digital Marketing Needs.</em></strong></p>\r\n\r\n<p>This is a&nbsp;<strong>100% Practical Course</strong>&nbsp;- Get Ready for Hands-On Experience from the First Lecture!</p>\r\n\r\n<p><strong>Take A Look at&nbsp;These&nbsp;Top Rated Reviews...</strong></p>\r\n\r\n<p><em>This is a whole University degree, for such a little amount of money.</em>&nbsp;<strong>- Livingstone Ayehangane</strong></p>\r\n\r\n<p><em>Buying this course was the most important decision i ever made in my career.</em>&nbsp;<strong>- Mohamed Saeed</strong></p>\r\n\r\n<p><em>Robin and jesper are no doubt one of the best digital marketing experts and teachers out there, I love this course.</em>&nbsp;<strong>- Shaheer Farrukh</strong></p>\r\n\r\n<p><em>The best course ever. You can always come back to any part of the course if you need to. Amazing updates and golden value. This is my go to bible for everything I do. Would be lost without it.</em>&nbsp;<strong>- Rajaa Zaidi</strong></p>', 1, '341090511', '00:00:40', '2023-05-14 02:23:22', '2023-05-14 02:23:22', NULL),
(164, 68, 'Market Research Explained', '<p><strong>Course Goals:</strong></p>\r\n\r\n<ul>\r\n	<li>\r\n	<p>Grow Your Business Online</p>\r\n	</li>\r\n	<li>\r\n	<p>Get Hired as a Digital Marketing Expert</p>\r\n	</li>\r\n	<li>\r\n	<p>Work as a Digital Marketing Freelancer</p>\r\n	</li>\r\n</ul>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>Includes:</strong></p>\r\n\r\n<p><strong>&nbsp; &nbsp; &nbsp; &nbsp; DIGITAL&nbsp;MARKETING&nbsp;STRATEGY</strong></p>\r\n\r\n<ol>\r\n	<li>\r\n	<p>Market Research</p>\r\n	</li>\r\n	<li>\r\n	<p>Set Up a Website</p>\r\n	</li>\r\n	<li>\r\n	<p>SEO&nbsp;(Search Enginge Optimization)</p>\r\n	</li>\r\n	<li>\r\n	<p>Email Marketing</p>\r\n	</li>\r\n	<li>\r\n	<p>Google Analytics</p>\r\n\r\n	<p><br />\r\n	<strong>DIGITAL&nbsp;MARKETING&nbsp;IN-DEPTH</strong></p>\r\n	</li>\r\n	<li>\r\n	<p>Prompt Engineering with ChatGPT</p>\r\n	</li>\r\n	<li>\r\n	<p>Branding</p>\r\n	</li>\r\n	<li>\r\n	<p>Content Marketing</p>\r\n	</li>\r\n	<li>\r\n	<p>Sales Psychology</p>\r\n	</li>\r\n	<li>\r\n	<p>Copywriting</p>\r\n	</li>\r\n</ol>', 1, '348304224', '00:06:45', '2023-05-14 02:23:42', '2023-05-14 02:23:42', NULL),
(165, 70, 'Find Target Audience', '<p><strong>Congratulations,&nbsp;You Found It!</strong></p>\r\n\r\n<p>The Most Complete Course on&nbsp;<strong>Digital Marketing</strong>, with&nbsp;<strong>24 Courses in 1!</strong></p>\r\n\r\n<p>Instead of buying 24 different Courses about Digital Marketing -<strong>&nbsp;<em>This Course Will Cover All Your Digital Marketing Needs.</em></strong></p>\r\n\r\n<p>This is a&nbsp;<strong>100% Practical Course</strong>&nbsp;- Get Ready for Hands-On Experience from the First Lecture!</p>\r\n\r\n<p><strong>Take A Look at&nbsp;These&nbsp;Top Rated Reviews...</strong></p>\r\n\r\n<p><em>This is a whole University degree, for such a little amount of money.</em>&nbsp;<strong>- Livingstone Ayehangane</strong></p>\r\n\r\n<p><em>Buying this course was the most important decision i ever made in my career.</em>&nbsp;<strong>- Mohamed Saeed</strong></p>\r\n\r\n<p><em>Robin and jesper are no doubt one of the best digital marketing experts and teachers out there, I love this course.</em>&nbsp;<strong>- Shaheer Farrukh</strong></p>\r\n\r\n<p><em>The best course ever. You can always come back to any part of the course if you need to. Amazing updates and golden value. This is my go to bible for everything I do. Would be lost without it.</em>&nbsp;<strong>- Rajaa Zaidi</strong></p>', 1, '341090511', '00:06:36', '2023-05-14 02:24:10', '2023-05-14 02:24:10', NULL),
(166, 70, 'Exercise - Find Digital Marketing Channels', '<p><strong>Course Goals:</strong></p>\r\n\r\n<ul>\r\n	<li>\r\n	<p>Grow Your Business Online</p>\r\n	</li>\r\n	<li>\r\n	<p>Get Hired as a Digital Marketing Expert</p>\r\n	</li>\r\n	<li>\r\n	<p>Work as a Digital Marketing Freelancer</p>\r\n	</li>\r\n</ul>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>Includes:</strong></p>\r\n\r\n<p><strong>&nbsp; &nbsp; &nbsp; &nbsp; DIGITAL&nbsp;MARKETING&nbsp;STRATEGY</strong></p>\r\n\r\n<ol>\r\n	<li>\r\n	<p>Market Research</p>\r\n	</li>\r\n	<li>\r\n	<p>Set Up a Website</p>\r\n	</li>\r\n	<li>\r\n	<p>SEO&nbsp;(Search Enginge Optimization)</p>\r\n	</li>\r\n	<li>\r\n	<p>Email Marketing</p>\r\n	</li>\r\n	<li>\r\n	<p>Google Analytics</p>\r\n\r\n	<p><br />\r\n	<strong>DIGITAL&nbsp;MARKETING&nbsp;IN-DEPTH</strong></p>\r\n	</li>\r\n	<li>\r\n	<p>Prompt Engineering with ChatGPT</p>\r\n	</li>\r\n	<li>\r\n	<p>Branding</p>\r\n	</li>\r\n	<li>\r\n	<p>Content Marketing</p>\r\n	</li>\r\n	<li>\r\n	<p>Sales Psychology</p>\r\n	</li>\r\n	<li>\r\n	<p>Copywriting</p>\r\n\r\n	<p><br />\r\n	<strong>DIGITAL&nbsp;MARKETING&nbsp;CHANNELS</strong></p>\r\n	</li>\r\n	<li>\r\n	<p>Google Ads</p>\r\n	</li>\r\n	<li>\r\n	<p>YouTube Ads</p>\r\n	</li>\r\n	<li>\r\n	<p>Facebook Ads</p>\r\n	</li>\r\n	<li>\r\n	<p>Facebook Marketing</p>\r\n	</li>\r\n	<li>\r\n	<p>Instagram Marketing</p>\r\n	</li>\r\n	<li>\r\n	<p>YouTube Marketing</p>\r\n	</li>\r\n	<li>\r\n	<p>Pinterest Marketing</p>\r\n	</li>\r\n	<li>\r\n	<p>LinkedIn Marketing</p>\r\n	</li>\r\n	<li>\r\n	<p>Quora Marketing</p>\r\n	</li>\r\n	<li>\r\n	<p>Twitter Marketing</p>\r\n	</li>\r\n	<li>\r\n	<p>Content&nbsp;Marketing Machine</p>\r\n\r\n	<p><br />\r\n	<strong>DIGITAL&nbsp;MARKETING&nbsp;PROFESSIONAL</strong></p>\r\n	</li>\r\n	<li>\r\n	<p>Digital Marketing Freelancing</p>\r\n	</li>\r\n	<li>\r\n	<p>WordPress Masterclass</p>\r\n	</li>\r\n	<li>\r\n	<p>SEO Masterclass</p>\r\n\r\n	<p>&nbsp;</p>\r\n	</li>\r\n</ol>', 1, '343467421', '00:07:36', '2023-05-14 02:24:35', '2023-05-14 02:24:35', NULL),
(167, 71, 'Why You Need a Marketing Strategy', '<p><strong>Congratulations,&nbsp;You Found It!</strong></p>\r\n\r\n<p>The Most Complete Course on&nbsp;<strong>Digital Marketing</strong>, with&nbsp;<strong>24 Courses in 1!</strong></p>\r\n\r\n<p>Instead of buying 24 different Courses about Digital Marketing -<strong>&nbsp;<em>This Course Will Cover All Your Digital Marketing Needs.</em></strong></p>\r\n\r\n<p>This is a&nbsp;<strong>100% Practical Course</strong>&nbsp;- Get Ready for Hands-On Experience from the First Lecture!</p>\r\n\r\n<p><strong>Take A Look at&nbsp;These&nbsp;Top Rated Reviews...</strong></p>\r\n\r\n<p><em>This is a whole University degree, for such a little amount of money.</em>&nbsp;<strong>- Livingstone Ayehangane</strong></p>\r\n\r\n<p><em>Buying this course was the most important decision i ever made in my career.</em>&nbsp;<strong>- Mohamed Saeed</strong></p>\r\n\r\n<p><em>Robin and jesper are no doubt one of the best digital marketing experts and teachers out there, I love this course.</em>&nbsp;<strong>- Shaheer Farrukh</strong></p>\r\n\r\n<p><em>The best course ever. You can always come back to any part of the course if you need to. Amazing updates and golden value. This is my go to bible for everything I do. Would be lost without it.</em>&nbsp;<strong>- Rajaa Zaidi</strong></p>', 1, '341090511', '00:06:40', '2023-05-14 02:25:09', '2023-05-14 02:25:09', NULL),
(168, 72, 'What You\'ll Get', '<p><strong>Course Goals:</strong></p>\r\n\r\n<ul>\r\n	<li>\r\n	<p>Grow Your Business Online</p>\r\n	</li>\r\n	<li>\r\n	<p>Get Hired as a Digital Marketing Expert</p>\r\n	</li>\r\n	<li>\r\n	<p>Work as a Digital Marketing Freelancer</p>\r\n	</li>\r\n</ul>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>Includes:</strong></p>\r\n\r\n<p><strong>&nbsp; &nbsp; &nbsp; &nbsp; DIGITAL&nbsp;MARKETING&nbsp;STRATEGY</strong></p>\r\n\r\n<ol>\r\n	<li>\r\n	<p>Market Research</p>\r\n	</li>\r\n	<li>\r\n	<p>Set Up a Website</p>\r\n	</li>\r\n	<li>\r\n	<p>SEO&nbsp;(Search Enginge Optimization)</p>\r\n	</li>\r\n	<li>\r\n	<p>Email Marketing</p>\r\n	</li>\r\n	<li>\r\n	<p>Google Analytics</p>\r\n\r\n	<p><br />\r\n	<strong>DIGITAL&nbsp;MARKETING&nbsp;IN-DEPTH</strong></p>\r\n	</li>\r\n	<li>\r\n	<p>Prompt Engineering with ChatGPT</p>\r\n	</li>\r\n	<li>\r\n	<p>Branding</p>\r\n	</li>\r\n	<li>\r\n	<p>Content Marketing</p>\r\n	</li>\r\n	<li>\r\n	<p>Sales Psychology</p>\r\n	</li>\r\n	<li>\r\n	<p>Copywriting</p>\r\n\r\n	<p><br />\r\n	<strong>DIGITAL&nbsp;MARKETING&nbsp;CHANNELS</strong></p>\r\n	</li>\r\n	<li>\r\n	<p>Google Ads</p>\r\n	</li>\r\n	<li>\r\n	<p>YouTube Ads</p>\r\n	</li>\r\n	<li>\r\n	<p>Facebook Ads</p>\r\n	</li>\r\n	<li>\r\n	<p>Facebook Marketing</p>\r\n	</li>\r\n	<li>\r\n	<p>Instagram Marketing</p>\r\n	</li>\r\n	<li>\r\n	<p>YouTube Marketing</p>\r\n	</li>\r\n	<li>\r\n	<p>Pinterest Marketing</p>\r\n	</li>\r\n	<li>\r\n	<p>LinkedIn Marketing</p>\r\n	</li>\r\n	<li>\r\n	<p>Quora Marketing</p>\r\n	</li>\r\n	<li>\r\n	<p>Twitter Marketing</p>\r\n	</li>\r\n	<li>\r\n	<p>Content&nbsp;Marketing Machine</p>\r\n\r\n	<p><br />\r\n	<strong>DIGITAL&nbsp;MARKETING&nbsp;PROFESSIONAL</strong></p>\r\n	</li>\r\n	<li>\r\n	<p>Digital Marketing Freelancing</p>\r\n	</li>\r\n	<li>\r\n	<p>WordPress Masterclass</p>\r\n	</li>\r\n	<li>\r\n	<p>SEO Masterclass</p>\r\n	</li>\r\n</ol>\r\n\r\n<p><strong>- Lifetime Access to Future Updates</strong></p>\r\n\r\n<p><strong>- Tools, Articles &amp; Templates</strong></p>\r\n\r\n<p>-&nbsp;<strong>Quick &amp; Helpful Support in the Q&amp;A section</strong></p>\r\n\r\n<p>-&nbsp;<strong>Downloadable Certificate of Completion</strong></p>\r\n\r\n<p>-&nbsp;<strong>30 Day Money Back Guarantee (No Questions Asked)</strong></p>', 1, '341090511', '00:05:34', '2023-05-14 02:25:45', '2023-05-14 02:25:45', NULL),
(169, 72, 'What to Expect', '<p><strong>Congratulations,&nbsp;You Found It!</strong></p>\r\n\r\n<p>The Most Complete Course on&nbsp;<strong>Digital Marketing</strong>, with&nbsp;<strong>24 Courses in 1!</strong></p>\r\n\r\n<p>Instead of buying 24 different Courses about Digital Marketing -<strong>&nbsp;<em>This Course Will Cover All Your Digital Marketing Needs.</em></strong></p>\r\n\r\n<p>This is a&nbsp;<strong>100% Practical Course</strong>&nbsp;- Get Ready for Hands-On Experience from the First Lecture!</p>\r\n\r\n<p><strong>Take A Look at&nbsp;These&nbsp;Top Rated Reviews...</strong></p>\r\n\r\n<p><em>This is a whole University degree, for such a little amount of money.</em>&nbsp;<strong>- Livingstone Ayehangane</strong></p>\r\n\r\n<p><em>Buying this course was the most important decision i ever made in my career.</em>&nbsp;<strong>- Mohamed Saeed</strong></p>\r\n\r\n<p><em>Robin and jesper are no doubt one of the best digital marketing experts and teachers out there, I love this course.</em>&nbsp;<strong>- Shaheer Farrukh</strong></p>\r\n\r\n<p><em>The best course ever. You can always come back to any part of the course if you need to. Amazing updates and golden value. This is my go to bible for everything I do. Would be lost without it.</em>&nbsp;<strong>- Rajaa Zaidi</strong></p>', 1, '344610920', '00:10:30', '2023-05-14 02:26:08', '2023-05-14 02:26:08', NULL),
(170, 73, 'Keyword Research Explained', '<p><strong>Course Goals:</strong></p>\r\n\r\n<ul>\r\n	<li>\r\n	<p>Grow Your Business Online</p>\r\n	</li>\r\n	<li>\r\n	<p>Get Hired as a Digital Marketing Expert</p>\r\n	</li>\r\n	<li>\r\n	<p>Work as a Digital Marketing Freelancer</p>\r\n	</li>\r\n</ul>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>Includes:</strong></p>\r\n\r\n<p><strong>&nbsp; &nbsp; &nbsp; &nbsp; DIGITAL&nbsp;MARKETING&nbsp;STRATEGY</strong></p>\r\n\r\n<ol>\r\n	<li>\r\n	<p>Market Research</p>\r\n	</li>\r\n	<li>\r\n	<p>Set Up a Website</p>\r\n	</li>\r\n	<li>\r\n	<p>SEO&nbsp;(Search Enginge Optimization)</p>\r\n	</li>\r\n	<li>\r\n	<p>Email Marketing</p>\r\n	</li>\r\n	<li>\r\n	<p>Google Analytics</p>\r\n\r\n	<p><br />\r\n	<strong>DIGITAL&nbsp;MARKETING&nbsp;IN-DEPTH</strong></p>\r\n	</li>\r\n	<li>\r\n	<p>Prompt Engineering with ChatGPT</p>\r\n	</li>\r\n	<li>\r\n	<p>Branding</p>\r\n	</li>\r\n	<li>\r\n	<p>Content Marketing</p>\r\n	</li>\r\n	<li>\r\n	<p>Sales Psychology</p>\r\n	</li>\r\n	<li>\r\n	<p>Copywriting</p>\r\n\r\n	<p><br />\r\n	<strong>DIGITAL&nbsp;MARKETING&nbsp;CHANNELS</strong></p>\r\n	</li>\r\n	<li>\r\n	<p>Google Ads</p>\r\n	</li>\r\n	<li>\r\n	<p>YouTube Ads</p>\r\n	</li>\r\n	<li>\r\n	<p>Facebook Ads</p>\r\n	</li>\r\n	<li>\r\n	<p>Facebook Marketing</p>\r\n	</li>\r\n	<li>\r\n	<p>Instagram Marketing</p>\r\n	</li>\r\n	<li>\r\n	<p>YouTube Marketing</p>\r\n	</li>\r\n	<li>\r\n	<p>Pinterest Marketing</p>\r\n	</li>\r\n	<li>\r\n	<p>LinkedIn Marketing</p>\r\n	</li>\r\n	<li>\r\n	<p>Quora Marketing</p>\r\n	</li>\r\n	<li>\r\n	<p>Twitter Marketing</p>\r\n	</li>\r\n	<li>\r\n	<p>Content&nbsp;Marketing Machine</p>\r\n\r\n	<p><br />\r\n	<strong>DIGITAL&nbsp;MARKETING&nbsp;PROFESSIONAL</strong></p>\r\n	</li>\r\n	<li>\r\n	<p>Digital Marketing Freelancing</p>\r\n	</li>\r\n	<li>\r\n	<p>WordPress Masterclass</p>\r\n	</li>\r\n	<li>\r\n	<p>SEO Masterclass</p>\r\n	</li>\r\n</ol>', 1, '344610920', '00:00:36', '2023-05-14 02:26:45', '2023-05-14 02:26:45', NULL),
(171, 18, 'How to Keyword Research', '<ol>\r\n	<li>\r\n	<p><strong>DIGITAL&nbsp;MARKETING&nbsp;PROFESSIONAL</strong></p>\r\n	</li>\r\n	<li>\r\n	<p>Digital Marketing Freelancing</p>\r\n	</li>\r\n	<li>\r\n	<p>WordPress Masterclass</p>\r\n	</li>\r\n	<li>\r\n	<p>SEO Masterclass</p>\r\n\r\n	<p>&nbsp;</p>\r\n	</li>\r\n</ol>\r\n\r\n<p><strong>- Lifetime Access to Future Updates</strong></p>\r\n\r\n<p><strong>- Tools, Articles &amp; Templates</strong></p>\r\n\r\n<p>-&nbsp;<strong>Quick &amp; Helpful Support in the Q&amp;A section</strong></p>\r\n\r\n<p>-&nbsp;<strong>Downloadable Certificate of Completion</strong></p>\r\n\r\n<p>-&nbsp;<strong>30 Day Money Back Guarantee (No Questions Asked)</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>This course will require you to sign up to Bluehost to follow our Digital Marketing strategy step-by-step.</p>\r\n\r\n<p>You will also need to sign up for ChatGPT which is completely free.</p>', 1, '341090511', '00:01:22', '2023-05-14 02:27:31', '2023-05-14 02:27:31', NULL),
(172, 18, 'Find Your Keywords Assignment', '<p><strong>Congratulations,&nbsp;You Found It!</strong></p>\r\n\r\n<p>The Most Complete Course on&nbsp;<strong>Digital Marketing</strong>, with&nbsp;<strong>24 Courses in 1!</strong></p>\r\n\r\n<p>Instead of buying 24 different Courses about Digital Marketing -<strong>&nbsp;<em>This Course Will Cover All Your Digital Marketing Needs.</em></strong></p>\r\n\r\n<p>This is a&nbsp;<strong>100% Practical Course</strong>&nbsp;- Get Ready for Hands-On Experience from the First Lecture!</p>\r\n\r\n<p><strong>Take A Look at&nbsp;These&nbsp;Top Rated Reviews...</strong></p>\r\n\r\n<p><em>This is a whole University degree, for such a little amount of money.</em>&nbsp;<strong>- Livingstone Ayehangane</strong></p>\r\n\r\n<p><em>Buying this course was the most important decision i ever made in my career.</em>&nbsp;<strong>- Mohamed Saeed</strong></p>\r\n\r\n<p><em>Robin and jesper are no doubt one of the best digital marketing experts and teachers out there, I love this course.</em>&nbsp;<strong>- Shaheer Farrukh</strong></p>\r\n\r\n<p><em>The best course ever. You can always come back to any part of the course if you need to. Amazing updates and golden value. This is my go to bible for everything I do. Would be lost without it.</em>&nbsp;<strong>- Rajaa Zaidi</strong></p>', 1, '341631029', '00:02:36', '2023-05-14 02:27:47', '2023-05-14 02:27:47', NULL),
(173, 73, 'Introducción', '<p><em>Do you want to Learn&nbsp;</em><strong><em>Web Designing</em></strong><em>&nbsp;from Scratch ?</em></p>\r\n\r\n<p><em>Do you want to&nbsp;</em><strong><em>Master Your Web Design Skill&nbsp;</em></strong><em>to Advanced Professional Level ?</em></p>\r\n\r\n<p><em>Welcome to One of the&nbsp;</em><strong><em>Biggest Web Designing Course !!!</em></strong></p>\r\n\r\n<p>This Course includes :</p>\r\n\r\n<ul>\r\n	<li>\r\n	<p><strong><em>14 Courses</em></strong></p>\r\n	</li>\r\n	<li>\r\n	<p><strong><em>400+ Video Lectures</em></strong></p>\r\n	</li>\r\n	<li>\r\n	<p><strong><em>4 Bonus Courses&nbsp;</em></strong>(all in all&nbsp;<strong><em>18 Courses in 1</em></strong>)</p>\r\n	</li>\r\n</ul>\r\n\r\n<p>Topics Covered in this Course :</p>\r\n\r\n<ul>\r\n	<li>\r\n	<p><strong><em>HTML&nbsp;</em></strong>Crash Course</p>\r\n	</li>\r\n	<li>\r\n	<p><strong><em>CSS Concepts</em></strong></p>\r\n	</li>\r\n	<li>\r\n	<p><strong><em>Javascript</em></strong></p>\r\n	</li>\r\n	<li>\r\n	<p><strong><em>Jquery</em></strong></p>\r\n	</li>\r\n	<li>\r\n	<p><strong><em>Ajax</em></strong></p>\r\n	</li>\r\n	<li>\r\n	<p><strong><em>Bootstrap</em></strong>&nbsp;(for Responsive Design)</p>\r\n	</li>\r\n</ul>', 1, '341090511', '00:10:36', '2023-05-13 10:54:26', '2023-05-13 10:54:26', NULL),
(174, 74, 'What is HTML ?', '<p><em>o you want to Learn&nbsp;</em><strong><em>Web Designing</em></strong><em>&nbsp;from Scratch ?</em></p>\r\n\r\n<p><em>Do you want to&nbsp;</em><strong><em>Master Your Web Design Skill&nbsp;</em></strong><em>to Advanced Professional Level ?</em></p>\r\n\r\n<p><em>Welcome to One of the&nbsp;</em><strong><em>Biggest Web Designing Course !!!</em></strong></p>\r\n\r\n<p>This Course includes :</p>\r\n\r\n<ul>\r\n	<li>\r\n	<p><strong><em>14 Courses</em></strong></p>\r\n	</li>\r\n	<li>\r\n	<p><strong><em>400+ Video Lectures</em></strong></p>\r\n	</li>\r\n	<li>\r\n	<p><strong><em>4 Bonus Courses&nbsp;</em></strong>(all in all&nbsp;<strong><em>18 Courses in 1</em></strong>)</p>\r\n	</li>\r\n</ul>', 1, '343467421', '00:07:36', '2023-05-13 10:56:43', '2023-05-13 10:56:43', NULL),
(175, 74, 'Creating a Basic HTML Document', '<p>Each and everything is explained in detail. Also if you need any help , I am always here to Clear your concept.</p>\r\n\r\n<p>So , what are you waiting for ?&nbsp;<strong><em>Enroll Now !!!&nbsp;</em></strong>and&nbsp;<strong><em>take your first step in Designing Awesome Professional Websites</em></strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li>\r\n	<p><strong><em>3 Mega PSD to Responsive Web Design Projects</em></strong></p>\r\n	</li>\r\n	<li>\r\n	<p>Creating websites with cool features like&nbsp;<strong><em>Ajax Contact Form</em></strong>&nbsp;,&nbsp;<strong><em>CSS Animations</em></strong>&nbsp;,<strong><em>&nbsp;Parallax Designs</em></strong></p>\r\n	</li>\r\n	<li>\r\n	<p>Creating&nbsp;<strong><em>Animated Sliders&nbsp;</em></strong><em>without any Jquery Plugin</em>&nbsp;(no need to pay for paid plugins when you can do it on your own !!!)</p>\r\n	</li>\r\n	<li>\r\n	<p><em>Many More important tips ,tricks,techniques are shared</em></p>\r\n	</li>\r\n</ul>', 1, '344610920', '00:06:36', '2023-05-13 10:57:34', '2023-05-13 10:57:34', NULL),
(176, 74, 'HTML Styles', '<p>Hi ,</p>\r\n\r\n<p><strong><em>Do you want to want to Learn Web Development from Scratch ?</em></strong></p>\r\n\r\n<p><em><strong>Do you want to become an Awesome Web Developer ?</strong></em></p>\r\n\r\n<p><em><strong>Do you want to Build Amazing Websites ?</strong></em></p>\r\n\r\n<p>If your answer to any of these questions is&nbsp;<strong>YES</strong>&nbsp;, then this course is definitely for you .</p>\r\n\r\n<p>Welcome to this&nbsp;<em><strong>Mega and Most Comprehensive Web Development Course</strong></em>&nbsp;, where you will learn everything starting from&nbsp;<em><strong>HTML, CSS, Javascript, Jquery, Ajax, Bootstrap, PHP, MYSQL, Wordpress</strong></em>.</p>\r\n\r\n<p><em>Each and every little concept and code is explained in detail</em></p>\r\n\r\n<p>You will also learn creating&nbsp;<em><strong>Amazing Unique Hover Effects</strong></em></p>', 1, '341631029', '00:10:36', '2023-05-13 10:58:24', '2023-05-13 10:58:24', NULL),
(177, 75, 'CSS Syntax', '<p>Hi ,</p>\r\n\r\n<p><strong><em>Do you want to want to Learn Web Development from Scratch ?</em></strong></p>\r\n\r\n<p><em><strong>Do you want to become an Awesome Web Developer ?</strong></em></p>\r\n\r\n<p><em><strong>Do you want to Build Amazing Websites ?</strong></em></p>\r\n\r\n<p>If your answer to any of these questions is&nbsp;<strong>YES</strong>&nbsp;, then this course is definitely for you .</p>\r\n\r\n<p>Welcome to this&nbsp;<em><strong>Mega and Most Comprehensive Web Development Course</strong></em>&nbsp;, where you will learn everything starting from&nbsp;<em><strong>HTML, CSS, Javascript, Jquery, Ajax, Bootstrap, PHP, MYSQL, Wordpress</strong></em>.</p>\r\n\r\n<p><em>Each and every little concept and code is explained in detail</em></p>\r\n\r\n<p>You will also learn creating&nbsp;<em><strong>Amazing Unique Hover Effects</strong></em></p>', 1, '332748369', '00:05:00', '2023-05-13 11:00:08', '2023-05-13 11:00:08', NULL),
(178, 75, 'Understanding children selectors using examples', '<p>Hi ,</p>\r\n\r\n<p><strong><em>Do you want to want to Learn Web Development from Scratch ?</em></strong></p>\r\n\r\n<p><em><strong>Do you want to become an Awesome Web Developer ?</strong></em></p>\r\n\r\n<p><em><strong>Do you want to Build Amazing Websites ?</strong></em></p>\r\n\r\n<p>If your answer to any of these questions is&nbsp;<strong>YES</strong>&nbsp;, then this course is definitely for you .</p>\r\n\r\n<p>Welcome to this&nbsp;<em><strong>Mega and Most Comprehensive Web Development Course</strong></em>&nbsp;, where you will learn everything starting from&nbsp;<em><strong>HTML, CSS, Javascript, Jquery, Ajax, Bootstrap, PHP, MYSQL, Wordpress</strong></em>.</p>\r\n\r\n<p><em>Each and every little concept and code is explained in detail</em></p>\r\n\r\n<p>You will also learn creating&nbsp;<em><strong>Amazing Unique Hover Effects</strong></em></p>', 1, '346943885', '00:05:00', '2023-05-13 11:00:39', '2023-05-13 11:00:39', NULL);
INSERT INTO `course_classes` (`id`, `course_section_id`, `name`, `description`, `state`, `vimeo_id`, `time`, `created_at`, `updated_at`, `deleted_at`) VALUES
(179, 75, 'Border , Border Radius and Outline', '<p>ou will also Learn Building&nbsp;<em><strong>Awesome Modern Looking Professional Websites</strong></em>&nbsp;with&nbsp;<em><strong>Cool Features</strong></em></p>\r\n\r\n<p>Some of the Website Projects that we have in this Course are as follows :</p>\r\n\r\n<ul>\r\n	<li><em>Project Spark :</em>&nbsp;<strong>Features :</strong>&nbsp;<em><strong>Modern Professional Look , Water Ripple Background, Awesome Unique Hover Effect</strong></em></li>\r\n	<li><em>Wordpress Project1 : Multipage Corporate Site :</em>&nbsp;<strong>Features :</strong>&nbsp;<em><strong>Cool Slider , Modern Look , Portfolio Filter Feature and contain all the required sections required for a&nbsp;Corporate Site</strong></em></li>\r\n	<li><em>Wordpress Project2 :</em>&nbsp;<em><strong>Multipage Portfolio Site</strong></em></li>\r\n	<li><em>Our Mega Project : PHP Multiuser Photogallery Site :</em>&nbsp;<em><strong>Features : Awesome Hover Effects, Pagination Feature in Gallery Page , Profile Image Feature / Avatar Image Feature handled with Ajax , Ajax Image Upload , Ajax Image Approval by Admin , Recent Uploads Feature , Tracking Number of Uploads by each User , Top Uploaders</strong></em></li>\r\n</ul>', 1, '346627381', '00:05:00', '2023-05-13 11:01:10', '2023-05-13 11:01:10', NULL),
(180, 76, 'What is Javascript and Why it is used ?', '<p>ou will also Learn Building&nbsp;<em><strong>Awesome Modern Looking Professional Websites</strong></em>&nbsp;with&nbsp;<em><strong>Cool Features</strong></em></p>\r\n\r\n<p>Some of the Website Projects that we have in this Course are as follows :</p>\r\n\r\n<ul>\r\n	<li><em>Project Spark :</em>&nbsp;<strong>Features :</strong>&nbsp;<em><strong>Modern Professional Look , Water Ripple Background, Awesome Unique Hover Effect</strong></em></li>\r\n	<li><em>Wordpress Project1 : Multipage Corporate Site :</em>&nbsp;<strong>Features :</strong>&nbsp;<em><strong>Cool Slider , Modern Look , Portfolio Filter Feature and contain all the required sections required for a&nbsp;Corporate Site</strong></em></li>\r\n	<li><em>Wordpress Project2 :</em>&nbsp;<em><strong>Multipage Portfolio Site</strong></em></li>\r\n	<li><em>Our Mega Project : PHP Multiuser Photogallery Site :</em>&nbsp;<em><strong>Features : Awesome Hover Effects, Pagination Feature in Gallery Page , Profile Image Feature / Avatar Image Feature handled with Ajax , Ajax Image Upload , Ajax Image Approval by Admin , Recent Uploads Feature , Tracking Number of Uploads by each User , Top Uploaders</strong></em></li>\r\n</ul>', 1, '348304224', '00:06:40', '2023-05-13 11:02:17', '2023-05-13 11:02:17', NULL),
(181, 77, 'Javascript Syntax', '<p>You will also Learn Building&nbsp;<em><strong>Awesome Modern Looking Professional Websites</strong></em>&nbsp;with&nbsp;<em><strong>Cool Features</strong></em></p>\r\n\r\n<p>Some of the Website Projects that we have in this Course are as follows :</p>\r\n\r\n<ul>\r\n	<li><em>Project Spark :</em>&nbsp;<strong>Features :</strong>&nbsp;<em><strong>Modern Professional Look , Water Ripple Background, Awesome Unique Hover Effect</strong></em></li>\r\n	<li><em>Wordpress Project1 : Multipage Corporate Site :</em>&nbsp;<strong>Features :</strong>&nbsp;<em><strong>Cool Slider , Modern Look , Portfolio Filter Feature and contain all the required sections required for a&nbsp;Corporate Site</strong></em></li>\r\n	<li><em>Wordpress Project2 :</em>&nbsp;<em><strong>Multipage Portfolio Site</strong></em></li>\r\n	<li><em>Our Mega Project : PHP Multiuser Photogallery Site :</em>&nbsp;<em><strong>Features : Awesome Hover Effects, Pagination Feature in Gallery Page , Profile Image Feature / Avatar Image Feature handled with Ajax , Ajax Image Upload , Ajax Image Approval by Admin , Recent Uploads Feature , Tracking Number of Uploads by each User , Top Uploaders</strong></em></li>\r\n</ul>\r\n\r\n<p><em><strong>After Completing this course along with these projects, you will have great knowledge about Web Development and enormous confidence&nbsp;in yourself , that you can also create Amazing Websites</strong></em></p>\r\n\r\n<p><em><strong>So why waiting , Enroll Now and take your first step to become an Awesome Web Developer</strong></em></p>', 1, '313045749', '00:06:40', '2023-05-13 11:02:37', '2023-05-13 11:02:37', NULL),
(182, 77, 'Interesting Concept : Adding Strings and Numbers', '<p>You will also Learn Building&nbsp;<em><strong>Awesome Modern Looking Professional Websites</strong></em>&nbsp;with&nbsp;<em><strong>Cool Features</strong></em></p>\r\n\r\n<p>Some of the Website Projects that we have in this Course are as follows :</p>\r\n\r\n<ul>\r\n	<li><em>Project Spark :</em>&nbsp;<strong>Features :</strong>&nbsp;<em><strong>Modern Professional Look , Water Ripple Background, Awesome Unique Hover Effect</strong></em></li>\r\n	<li><em>Wordpress Project1 : Multipage Corporate Site :</em>&nbsp;<strong>Features :</strong>&nbsp;<em><strong>Cool Slider , Modern Look , Portfolio Filter Feature and contain all the required sections required for a&nbsp;Corporate Site</strong></em></li>\r\n	<li><em>Wordpress Project2 :</em>&nbsp;<em><strong>Multipage Portfolio Site</strong></em></li>\r\n	<li><em>Our Mega Project : PHP Multiuser Photogallery Site :</em>&nbsp;<em><strong>Features : Awesome Hover Effects, Pagination Feature in Gallery Page , Profile Image Feature / Avatar Image Feature handled with Ajax , Ajax Image Upload , Ajax Image Approval by Admin , Recent Uploads Feature , Tracking Number of Uploads by each User , Top Uploaders</strong></em></li>\r\n</ul>\r\n\r\n<p><em><strong>After Completing this course along with these projects, you will have great knowledge about Web Development and enormous confidence&nbsp;in yourself , that you can also create Amazing Websites</strong></em></p>\r\n\r\n<p><em><strong>So why waiting , Enroll Now and take your first step to become an Awesome Web Developer</strong></em></p>', 1, '344610920', '00:06:36', '2023-05-13 11:02:56', '2023-05-13 11:02:56', NULL),
(183, 77, 'What is Jquery and why we use it ?', '<p>You will also Learn Building&nbsp;<em><strong>Awesome Modern Looking Professional Websites</strong></em>&nbsp;with&nbsp;<em><strong>Cool Features</strong></em></p>\r\n\r\n<p>Some of the Website Projects that we have in this Course are as follows :</p>\r\n\r\n<ul>\r\n	<li><em>Project Spark :</em>&nbsp;<strong>Features :</strong>&nbsp;<em><strong>Modern Professional Look , Water Ripple Background, Awesome Unique Hover Effect</strong></em></li>\r\n	<li><em>Wordpress Project1 : Multipage Corporate Site :</em>&nbsp;<strong>Features :</strong>&nbsp;<em><strong>Cool Slider , Modern Look , Portfolio Filter Feature and contain all the required sections required for a&nbsp;Corporate Site</strong></em></li>\r\n	<li><em>Wordpress Project2 :</em>&nbsp;<em><strong>Multipage Portfolio Site</strong></em></li>\r\n	<li><em>Our Mega Project : PHP Multiuser Photogallery Site :</em>&nbsp;<em><strong>Features : Awesome Hover Effects, Pagination Feature in Gallery Page , Profile Image Feature / Avatar Image Feature handled with Ajax , Ajax Image Upload , Ajax Image Approval by Admin , Recent Uploads Feature , Tracking Number of Uploads by each User , Top Uploaders</strong></em></li>\r\n</ul>\r\n\r\n<p><em><strong>After Completing this course along with these projects, you will have great knowledge about Web Development and enormous confidence&nbsp;in yourself , that you can also create Amazing Websites</strong></em></p>\r\n\r\n<p><em><strong>So why waiting , Enroll Now and take your first step to become an Awesome Web Developer</strong></em></p>', 1, '341090511', '00:10:36', '2023-05-13 11:03:40', '2023-05-13 11:03:40', NULL),
(184, 77, 'Using Jquery in Website', '<p>You will also Learn Building&nbsp;<em><strong>Awesome Modern Looking Professional Websites</strong></em>&nbsp;with&nbsp;<em><strong>Cool Features</strong></em></p>\r\n\r\n<p>Some of the Website Projects that we have in this Course are as follows :</p>\r\n\r\n<ul>\r\n	<li><em>Project Spark :</em>&nbsp;<strong>Features :</strong>&nbsp;<em><strong>Modern Professional Look , Water Ripple Background, Awesome Unique Hover Effect</strong></em></li>\r\n	<li><em>Wordpress Project1 : Multipage Corporate Site :</em>&nbsp;<strong>Features :</strong>&nbsp;<em><strong>Cool Slider , Modern Look , Portfolio Filter Feature and contain all the required sections required for a&nbsp;Corporate Site</strong></em></li>\r\n	<li><em>Wordpress Project2 :</em>&nbsp;<em><strong>Multipage Portfolio Site</strong></em></li>\r\n	<li><em>Our Mega Project : PHP Multiuser Photogallery Site :</em>&nbsp;<em><strong>Features : Awesome Hover Effects, Pagination Feature in Gallery Page , Profile Image Feature / Avatar Image Feature handled with Ajax , Ajax Image Upload , Ajax Image Approval by Admin , Recent Uploads Feature , Tracking Number of Uploads by each User , Top Uploaders</strong></em></li>\r\n</ul>\r\n\r\n<p><em><strong>After Completing this course along with these projects, you will have great knowledge about Web Development and enormous confidence&nbsp;in yourself , that you can also create Amazing Websites</strong></em></p>\r\n\r\n<p><em><strong>So why waiting , Enroll Now and take your first step to become an Awesome Web Developer</strong></em></p>', 1, '344610920', '00:05:00', '2023-05-13 11:03:55', '2023-05-13 11:03:55', NULL),
(185, 77, 'Removing HTML Content using Jquery', '<p>You will also Learn Building&nbsp;<em><strong>Awesome Modern Looking Professional Websites</strong></em>&nbsp;with&nbsp;<em><strong>Cool Features</strong></em></p>\r\n\r\n<p>Some of the Website Projects that we have in this Course are as follows :</p>\r\n\r\n<ul>\r\n	<li><em>Project Spark :</em>&nbsp;<strong>Features :</strong>&nbsp;<em><strong>Modern Professional Look , Water Ripple Background, Awesome Unique Hover Effect</strong></em></li>\r\n	<li><em>Wordpress Project1 : Multipage Corporate Site :</em>&nbsp;<strong>Features :</strong>&nbsp;<em><strong>Cool Slider , Modern Look , Portfolio Filter Feature and contain all the required sections required for a&nbsp;Corporate Site</strong></em></li>\r\n	<li><em>Wordpress Project2 :</em>&nbsp;<em><strong>Multipage Portfolio Site</strong></em></li>\r\n	<li><em>Our Mega Project : PHP Multiuser Photogallery Site :</em>&nbsp;<em><strong>Features : Awesome Hover Effects, Pagination Feature in Gallery Page , Profile Image Feature / Avatar Image Feature handled with Ajax , Ajax Image Upload , Ajax Image Approval by Admin , Recent Uploads Feature , Tracking Number of Uploads by each User , Top Uploaders</strong></em></li>\r\n</ul>\r\n\r\n<p><em><strong>After Completing this course along with these projects, you will have great knowledge about Web Development and enormous confidence&nbsp;in yourself , that you can also create Amazing Websites</strong></em></p>\r\n\r\n<p><em><strong>So why waiting , Enroll Now and take your first step to become an Awesome Web Developer</strong></em></p>', 1, '346943885', '00:05:30', '2023-05-13 11:04:11', '2023-05-13 11:04:11', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `course_classe_files`
--

CREATE TABLE `course_classe_files` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `course_clase_id` bigint(20) UNSIGNED NOT NULL,
  `name_file` varchar(250) NOT NULL,
  `size` varchar(50) NOT NULL,
  `time` varchar(50) DEFAULT NULL,
  `resolution` varchar(20) DEFAULT NULL,
  `file` varchar(250) NOT NULL,
  `type` varchar(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `course_classe_files`
--

INSERT INTO `course_classe_files` (`id`, `course_clase_id`, `name_file`, `size`, `time`, `resolution`, `file`, `type`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'INSTITUCIONES-FOCALIZADAS-UGEL-ANTONIO-RAIMONDI.pdf', '101241', NULL, NULL, 'clases_files/7zSl64F8wRuJfFRC9ExbsArqi48EpbUUOljwe3r3.jpg', 'pdf', '2023-05-13 05:54:30', '2023-05-13 05:54:30', NULL),
(2, 2, 'INSTITUCIONES-FOCALIZADAS-UGEL-ANTONIO-RAIMONDI.pdf', '101241', NULL, NULL, 'clases_files/fWuUxB6KJ7OcI4k6nnLDwEeAdpMVxyFBsXLdE6kp.pdf', 'pdf', '2023-05-13 05:56:43', '2023-05-13 05:56:43', NULL),
(3, 3, 'banner14.webp', '121418', NULL, NULL, 'clases_files/kWo6JtoOZHcjq7FiFO8l0xHabuc3lIszQXespiay.webp', 'webp', '2023-05-13 05:57:34', '2023-05-13 05:57:34', NULL),
(4, 3, 'INSTITUCIONES-FOCALIZADAS-UGEL-ANTONIO-RAIMONDI.pdf', '101241', NULL, NULL, 'clases_files/QyR2f3T9jbXbbNkGeedfCbcjaC1wbSFSoZjBRs7F.pdf', 'pdf', '2023-05-13 05:57:34', '2023-05-13 05:57:34', NULL),
(5, 4, '221a469a-a382-409e-b7c7-5ecd6baf7e98.jpg', '105681', NULL, '503 X 1280', 'clases_files/7wv99bnZ68RDcicSeDBsCXzT6e5OxlyzQ6ByDftN.jpg', 'jpg', '2023-05-13 05:58:24', '2023-05-13 05:58:24', NULL),
(6, 5, 'INSTITUCIONES-FOCALIZADAS-UGEL-ANTONIO-RAIMONDI.pdf', '101241', NULL, NULL, 'clases_files/dTouEtSw7kNVjFXtGsjgcMmlOwsvPaduvP85eBIU.pdf', 'pdf', '2023-05-13 06:00:08', '2023-05-13 06:00:08', NULL),
(7, 6, 'PORTADA_ECOMMERCE_L_A.png', '1262045', NULL, '1778 X 1044', 'clases_files/9KbizcrcBA0hv6K1riDEIR5EfRA15Yx8cOn4ESRo.png', 'png', '2023-05-13 06:00:39', '2023-05-13 06:00:39', NULL),
(8, 7, 'ecommerce_banner.png', '582527', NULL, '2000 X 1127', 'clases_files/iL0EdgiOF45l602ZdBsvnaZdegRus4e8grzaHVDU.png', 'png', '2023-05-13 06:01:10', '2023-05-13 06:01:10', NULL),
(9, 8, 'ecommerce_banner_1.png', '858573', NULL, '2000 X 1125', 'clases_files/FuDBRL3c9HisspRLUYYfYPivJJUHXEmIRlUJgbu2.png', 'png', '2023-05-13 06:02:17', '2023-05-13 06:02:17', NULL),
(10, 9, 'afiliado.PNG', '275171', NULL, '1322 X 629', 'clases_files/cyNsnFIqvXzarTe7CcpCToyZMXovFOduu5cgcmK3.png', 'PNG', '2023-05-13 06:02:37', '2023-05-13 06:02:37', NULL),
(11, 10, 'INSTITUCIONES-FOCALIZADAS-UGEL-ANTONIO-RAIMONDI.pdf', '101241', NULL, NULL, 'clases_files/Zv5hm2E2QKjywKW3QavxvaOXZH5rwhEO7iYE8RNW.pdf', 'pdf', '2023-05-13 06:02:56', '2023-05-13 06:02:56', NULL),
(12, 11, '915b8367-97f4-46e4-8454-b1f90d513413.jpg', '112790', NULL, '1185 X 1600', 'clases_files/AUxkNpADoshaFJFy213ZuLxGjkNoXwg3Sdukn8iU.jpg', 'jpg', '2023-05-13 06:03:40', '2023-05-13 06:03:40', NULL),
(13, 12, '79731568097599.5b50bca477735.jpg', '91544', NULL, '1200 X 267', 'clases_files/2RkQsTsbu7o94IDfJEASWsmdLTGsD9wInPHSfEed.jpg', 'jpg', '2023-05-13 06:03:55', '2023-05-13 06:03:55', NULL),
(14, 13, '17838614_1.jpg', '16825', NULL, '800 X 800', 'clases_files/GmVeFu8eZImTm6BM1wz3MmwNOkm4KoHZx1f4v1RS.jpg', 'jpg', '2023-05-13 06:04:11', '2023-05-13 06:04:11', NULL),
(15, 40, 'INSTITUCIONES-FOCALIZADAS-UGEL-ANTONIO-RAIMONDI.pdf', '101241', NULL, NULL, 'clases_files/7adcIaBh7Tde4I0lWv35QAZ8ekhecVEDC8owxKsz.pdf', 'pdf', '2023-05-14 01:51:59', '2023-05-14 01:51:59', NULL),
(16, 41, 'PORTADA_ECOMMERCE_L_A.png', '1262045', NULL, '1778 X 1044', 'clases_files/5MAYdUWzB6p3RlafqBSIEhR4ITTVYME5yD5RLuEF.png', 'png', '2023-05-14 01:52:55', '2023-05-14 01:52:55', NULL),
(17, 42, 'ecommerce_banner.png', '582527', NULL, '2000 X 1127', 'clases_files/BbNQli6pnfHGL1dfMV5vBCkq1UCevYib1Fw2xaLk.png', 'png', '2023-05-14 01:53:16', '2023-05-14 01:53:16', NULL),
(18, 43, 'INSTITUCIONES-FOCALIZADAS-UGEL-ANTONIO-RAIMONDI.pdf', '101241', NULL, NULL, 'clases_files/hY5PyvUhaE5olAVV0RHYorTdxgdk9YFj8eear7jZ.pdf', 'pdf', '2023-05-14 01:53:48', '2023-05-14 01:53:48', NULL),
(19, 44, 'banner15.webp', '105356', NULL, NULL, 'clases_files/HcSkN6pteRlwcKyJtHhb45cZNoRU6vGtc794OUc9.webp', 'webp', '2023-05-14 01:54:08', '2023-05-14 01:54:08', NULL),
(20, 45, '915b8367-97f4-46e4-8454-b1f90d513413.jpg', '112790', NULL, '1185 X 1600', 'clases_files/dugAobhyBJUXnf2CdOruQaJT0hMkboFgrk7UyQ29.jpg', 'jpg', '2023-05-14 01:55:12', '2023-05-14 01:55:12', NULL),
(21, 46, 'INSTITUCIONES-FOCALIZADAS-UGEL-ANTONIO-RAIMONDI.pdf', '101241', NULL, NULL, 'clases_files/iBSi0d89unF9ydhqczxZWBzWzCCGfdPRJ3e2V37B.pdf', 'pdf', '2023-05-14 01:56:07', '2023-05-14 01:56:07', NULL),
(22, 47, '1366_2000.jpg', '51743', NULL, '1000 X 700', 'clases_files/7BCqsHSY3J2ah5ffX2LrTaRViog5nxpfH82VXvDs.jpg', 'jpg', '2023-05-14 01:56:37', '2023-05-14 01:56:37', NULL),
(23, 47, 'INSTITUCIONES-FOCALIZADAS-UGEL-ANTONIO-RAIMONDI.pdf', '101241', NULL, NULL, 'clases_files/QpLafYAlPgiNZ7KsQRmBO6HjaYks5ZYCxRhfccuO.pdf', 'pdf', '2023-05-14 01:56:37', '2023-05-14 01:56:37', NULL),
(24, 48, '11.jpg', '56746', NULL, '1500 X 702', 'clases_files/4j3PN9W866LzXlYjThxQyq9LITiaQBgJbsYToiVt.jpg', 'jpg', '2023-05-14 01:57:02', '2023-05-14 01:57:02', NULL),
(25, 49, 'INSTITUCIONES-FOCALIZADAS-UGEL-ANTONIO-RAIMONDI.pdf', '101241', NULL, NULL, 'clases_files/LktR69eITgoH0z2jIkpgvr1uXw6XNhaXihaF4eqx.pdf', 'pdf', '2023-05-14 01:57:35', '2023-05-14 01:57:35', NULL),
(26, 50, 'banner15.webp', '105356', NULL, NULL, 'clases_files/B6HAJMUo0Q67bdgpHcLB8SoH9RbSSSqDlvDpv3Nn.webp', 'webp', '2023-05-14 01:58:07', '2023-05-14 01:58:07', NULL),
(27, 51, 'ecommerce_banner_1.png', '858573', NULL, '2000 X 1125', 'clases_files/y9qRbIdfzT0BV4xGIyBuVmyupEW3R3nX9m1CumwV.png', 'png', '2023-05-14 01:58:26', '2023-05-14 01:58:26', NULL),
(28, 52, '221a469a-a382-409e-b7c7-5ecd6baf7e98.jpg', '105681', NULL, '503 X 1280', 'clases_files/tyFqnIKzwbOB71rySLpMkS2uFS7rm9FQgmZrwqVI.jpg', 'jpg', '2023-05-14 02:01:20', '2023-05-14 02:01:20', NULL),
(29, 53, 'banner16.webp', '221308', NULL, NULL, 'clases_files/t5QDvMLpbCdr1TRHj33IxPRoSt0ia3YNIWpahDMS.webp', 'webp', '2023-05-14 02:01:49', '2023-05-14 02:01:49', NULL),
(30, 54, 'covid-2019.jpg', '121666', NULL, '791 X 511', 'clases_files/s2Mu4p6l3w2JImEip9rtE7uHtvl4NjhM7pxo47nT.jpg', 'jpg', '2023-05-14 02:02:27', '2023-05-14 02:02:27', NULL),
(31, 55, '17838614_1.jpg', '16825', NULL, '800 X 800', 'clases_files/4VPMkq6XHzDGSZpS9EimbWOAkA6gnTAiJNMv738h.jpg', 'jpg', '2023-05-14 02:02:46', '2023-05-14 02:02:46', NULL),
(32, 56, 'INSTITUCIONES-FOCALIZADAS-UGEL-ANTONIO-RAIMONDI.pdf', '101241', NULL, NULL, 'clases_files/eTnpc4wMVeK3WBth65Gm3mEPMWMeKOaMDTBXoY1Q.pdf', 'pdf', '2023-05-14 02:03:07', '2023-05-14 02:03:07', NULL),
(33, 57, 'afiliado.PNG', '275171', NULL, '1322 X 629', 'clases_files/RQR6dPiCkT2agxHoHjfIVb3XETsJKtBZppKraRCY.png', 'PNG', '2023-05-14 02:03:35', '2023-05-14 02:03:35', NULL),
(34, 58, 'INSTITUCIONES-FOCALIZADAS-UGEL-ANTONIO-RAIMONDI.pdf', '101241', NULL, NULL, 'clases_files/MUpoCsdt56Ocl9K1EIWWg5HW4RcHrJbR3oEDCwTP.pdf', 'pdf', '2023-05-14 02:07:19', '2023-05-14 02:07:19', NULL),
(35, 59, 'ecommerce_banner.png', '582527', NULL, '2000 X 1127', 'clases_files/oZ0QuFKnDGkPWwQfbIgU70xMyNCTvK0BI1XSMGEa.png', 'png', '2023-05-14 02:07:39', '2023-05-14 02:07:39', NULL),
(36, 60, '130309307_3737903689606719_3703914123236261716_n.png', '376430', NULL, '800 X 800', 'clases_files/ujT2hc4vacgHqc327ntpAuSaixXYuiniWEWliTBm.png', 'png', '2023-05-14 02:08:02', '2023-05-14 02:08:02', NULL),
(37, 61, 'INSTITUCIONES-FOCALIZADAS-UGEL-ANTONIO-RAIMONDI.pdf', '101241', NULL, NULL, 'clases_files/j31oEJKoOxxhq3AskiIwzkt49SiYqhArMjUs3Y69.pdf', 'pdf', '2023-05-14 02:09:00', '2023-05-14 02:09:00', NULL),
(38, 62, 'banner16.webp', '221308', NULL, NULL, 'clases_files/As4qo20Fqq0hwDcIc8PGgAprgCxZH835zajkF790.webp', 'webp', '2023-05-14 02:09:18', '2023-05-14 02:09:18', NULL),
(39, 63, 'INSTITUCIONES-FOCALIZADAS-UGEL-ANTONIO-RAIMONDI.pdf', '101241', NULL, NULL, 'clases_files/nHvQfsOmZVzXVT51tVbvzhaNr3jvAg3gdDAw6QU8.pdf', 'pdf', '2023-05-14 02:11:04', '2023-05-14 02:11:04', NULL),
(40, 64, '220980.png', '8966', NULL, '512 X 512', 'clases_files/7qR821i2U9cEXazRwJc8ehLF09EPFM7Ym5ffjv4o.png', 'png', '2023-05-14 02:11:24', '2023-05-14 02:11:24', NULL),
(41, 65, '221a469a-a382-409e-b7c7-5ecd6baf7e98.jpg', '105681', NULL, '503 X 1280', 'clases_files/DnaDWGVs8XOofz0D4hFarxEJF9Jg3gps5dAr1ORX.jpg', 'jpg', '2023-05-14 02:11:41', '2023-05-14 02:11:41', NULL),
(42, 66, '5ff46c5e6f0b1_720_960!.jpg', '79641', NULL, '720 X 960', 'clases_files/h26IwcxXKr4U6JaPILeS4MOc19sLEvRYl9KHm3Sz.jpg', 'jpg', '2023-05-14 02:12:09', '2023-05-14 02:12:09', NULL),
(43, 67, '1366_2000.jpg', '51743', NULL, '1000 X 700', 'clases_files/hoyNTyJDl7oJQfuDxPwWd9MfGqmLGHLS9tH3IU92.jpg', 'jpg', '2023-05-14 02:15:23', '2023-05-14 02:15:23', NULL),
(44, 68, 'INSTITUCIONES-FOCALIZADAS-UGEL-ANTONIO-RAIMONDI.pdf', '101241', NULL, NULL, 'clases_files/iSUrpvURYVxh2Pr3WZj8tfK9Ycj5KFYwoezwKP52.pdf', 'pdf', '2023-05-14 02:15:49', '2023-05-14 02:15:49', NULL),
(45, 69, 'ecommerce_banner_1.png', '858573', NULL, '2000 X 1125', 'clases_files/LxaB3lFcaLCZa3qz5CB21mp4cfyk8OVKl5VTfoON.png', 'png', '2023-05-14 02:16:09', '2023-05-14 02:16:09', NULL),
(46, 70, 'banner15.webp', '105356', NULL, NULL, 'clases_files/2sXGbMSsAhOPPCzULNBZtP9cf5hQ3dv9z1d5pcWU.webp', 'webp', '2023-05-14 02:16:36', '2023-05-14 02:16:36', NULL),
(47, 71, 'INSTITUCIONES-FOCALIZADAS-UGEL-ANTONIO-RAIMONDI.pdf', '101241', NULL, NULL, 'clases_files/YQsoCiXzXSF8qVzYYgRzLjC7V5GlURgG8I9vVGu7.pdf', 'pdf', '2023-05-14 02:17:03', '2023-05-14 02:17:03', NULL),
(48, 72, '130309307_3737903689606719_3703914123236261716_n.png', '376430', NULL, '800 X 800', 'clases_files/CLmY6gsxejA8QRb8YXUJwHFJVZY30zHRImbExOoB.png', 'png', '2023-05-14 02:17:33', '2023-05-14 02:17:33', NULL),
(49, 73, 'banner18.webp', '112200', NULL, NULL, 'clases_files/WnmvpO4ov4xuwojd6y9lASinAdTHnlUy03y3G671.webp', 'webp', '2023-05-14 02:17:51', '2023-05-14 02:17:51', NULL),
(50, 74, '17838614_1.jpg', '16825', NULL, '800 X 800', 'clases_files/IzneVakS3LT0bTBOzAhC7NGKfzXMx30ZpC66U3Q9.jpg', 'jpg', '2023-05-14 02:18:09', '2023-05-14 02:18:09', NULL),
(51, 75, 'INSTITUCIONES-FOCALIZADAS-UGEL-ANTONIO-RAIMONDI.pdf', '101241', NULL, NULL, 'clases_files/7yPf2W3XhMfVT0AUoUJYPbHWAWnc8uYLG5lTj30J.pdf', 'pdf', '2023-05-14 02:19:50', '2023-05-14 02:19:50', NULL),
(52, 76, '17838614_1.jpg', '16825', NULL, '800 X 800', 'clases_files/SyCSvF6QZQG9jr2c2pyRkpRumnQJ9H0JQlgnnOUi.jpg', 'jpg', '2023-05-14 02:20:05', '2023-05-14 02:20:05', NULL),
(53, 77, 'ecommerce_banner.png', '582527', NULL, '2000 X 1127', 'clases_files/9p9aV01idC21e8tCTavxuwUFmGmFtn96tcQSMlyw.png', 'png', '2023-05-14 02:23:08', '2023-05-14 02:23:08', NULL),
(54, 78, 'INSTITUCIONES-FOCALIZADAS-UGEL-ANTONIO-RAIMONDI.pdf', '101241', NULL, NULL, 'clases_files/iiR9xvbPr1f7glWKY7XG5JyMbX3eABcStZgbkzNQ.pdf', 'pdf', '2023-05-14 02:23:22', '2023-05-14 02:23:22', NULL),
(55, 79, '4726010.png', '10645', NULL, '512 X 512', 'clases_files/r2Lp0ashm4bw6EwfhhMDddElcSZWcK0NblEAMdID.png', 'png', '2023-05-14 02:23:42', '2023-05-14 02:23:42', NULL),
(56, 80, 'ecommerce_banner_1.png', '858573', NULL, '2000 X 1125', 'clases_files/sCIAMBqNLctwVPmuluYCeIPGVZrVUZ5Uw7WptPlb.png', 'png', '2023-05-14 02:24:10', '2023-05-14 02:24:10', NULL),
(57, 81, 'INSTITUCIONES-FOCALIZADAS-UGEL-ANTONIO-RAIMONDI.pdf', '101241', NULL, NULL, 'clases_files/QMFLWuMYAsk6T7zdP7vXWd1g9lTCIUcvKHTIKVEv.pdf', 'pdf', '2023-05-14 02:24:35', '2023-05-14 02:24:35', NULL),
(58, 82, 'INSTITUCIONES-FOCALIZADAS-UGEL-ANTONIO-RAIMONDI.pdf', '101241', NULL, NULL, 'clases_files/Rru9ItYCZ11R0wXST76jtmUgbRZeRZyYUWx1x8S5.pdf', 'pdf', '2023-05-14 02:25:09', '2023-05-14 02:25:09', NULL),
(59, 83, 'INSTITUCIONES-FOCALIZADAS-UGEL-ANTONIO-RAIMONDI.pdf', '101241', NULL, NULL, 'clases_files/s3g8RwapyojpAtamfrA6OV4QdQLcpRsPrvHzQ4bc.pdf', 'pdf', '2023-05-14 02:25:45', '2023-05-14 02:25:45', NULL),
(60, 84, 'ecommerce_banner_1.png', '858573', NULL, '2000 X 1125', 'clases_files/LJFfx12fx5ENaRAy0DChfwwfiKEhlVWUQ0zdBzcW.png', 'png', '2023-05-14 02:26:08', '2023-05-14 02:26:08', NULL),
(61, 85, 'formulario_apunte_1_a.PNG', '46454', NULL, '789 X 925', 'clases_files/51x6M7G9GkvcZtxigEAHDJlOWj7obf5KKAYB1NmV.png', 'PNG', '2023-05-14 02:26:45', '2023-05-14 07:26:53', '2023-05-14 07:26:53'),
(62, 85, '130309307_3737903689606719_3703914123236261716_n.png', '376430', NULL, '800 X 800', 'clases_files/wqXXJY8XvfECNuLcELAVl7QUkpwMKVeUc1LTkZTB.png', 'png', '2023-05-14 02:26:45', '2023-05-14 02:26:45', NULL),
(63, 86, '5ff46c5e6f0b1_720_960!.jpg', '79641', NULL, '720 X 960', 'clases_files/UlEchmSdgY4hGTwOFhaRImDLtOquiVpvWr45Feo3.jpg', 'jpg', '2023-05-14 02:27:31', '2023-05-14 02:27:31', NULL),
(64, 87, 'afiliado.PNG', '275171', NULL, '1322 X 629', 'clases_files/5s2ZLzPUv7WJvICbGF7zMXPJfZVRPRwml75BxlPR.png', 'PNG', '2023-05-14 02:27:47', '2023-05-14 02:27:47', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `course_sections`
--

CREATE TABLE `course_sections` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `course_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(250) NOT NULL,
  `state` tinyint(1) UNSIGNED NOT NULL DEFAULT '1' COMMENT '1 es activo',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `course_sections`
--

INSERT INTO `course_sections` (`id`, `course_id`, `name`, `state`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 2, 'Introduction', 1, '2023-05-13 05:50:37', '2023-05-13 05:50:37', NULL),
(2, 2, 'Course1 : HTML Crash Course', 1, '2023-05-13 05:50:44', '2023-05-13 05:50:44', NULL),
(3, 2, 'Course2 : CSS Crash Course', 1, '2023-05-13 05:50:52', '2023-05-13 05:50:52', NULL),
(4, 2, 'Course3 : Complete Javascript Course', 1, '2023-05-13 05:51:27', '2023-05-13 05:51:27', NULL),
(5, 2, 'Course6 : Complete Bootstrap Course', 1, '2023-05-13 05:51:40', '2023-05-13 05:51:40', NULL),
(6, 3, 'Introduction', 1, '2023-05-13 05:50:37', '2023-05-13 05:50:37', NULL),
(7, 3, 'Course1 : HTML Crash Course', 1, '2023-05-13 05:50:44', '2023-05-13 05:50:44', NULL),
(8, 3, 'Course2 : CSS Crash Course', 1, '2023-05-13 05:50:52', '2023-05-13 05:50:52', NULL),
(9, 3, 'Course3 : Complete Javascript Course', 1, '2023-05-13 05:51:27', '2023-05-13 05:51:27', NULL),
(10, 3, 'Course6 : Complete Bootstrap Course', 1, '2023-05-13 05:51:40', '2023-05-13 05:51:40', NULL),
(11, 4, 'Introduction', 1, '2023-05-13 05:50:37', '2023-05-13 05:50:37', NULL),
(12, 4, 'Course1 : HTML Crash Course', 1, '2023-05-13 05:50:44', '2023-05-13 05:50:44', NULL),
(13, 4, 'Course2 : CSS Crash Course', 1, '2023-05-13 05:50:52', '2023-05-13 05:50:52', NULL),
(14, 4, 'Course3 : Complete Javascript Course', 1, '2023-05-13 05:51:27', '2023-05-13 05:51:27', NULL),
(15, 4, 'Course6 : Complete Bootstrap Course', 1, '2023-05-13 05:51:40', '2023-05-13 05:51:40', NULL),
(16, 5, 'Day 1 Transform Your Life to Improve Yourself and the World', 1, '2023-05-14 01:48:44', '2023-05-14 01:48:44', NULL),
(17, 5, 'Day 2 The Solution to Overabundance in Your Life', 1, '2023-05-14 01:49:02', '2023-05-14 01:49:02', NULL),
(18, 5, 'Joining the Creative Class', 1, '2023-05-14 01:49:09', '2023-05-14 01:49:09', NULL),
(19, 5, 'Day 4 Transforming Your Life One New Daily Habit at a Time', 1, '2023-05-14 01:49:17', '2023-05-14 01:49:17', NULL),
(20, 5, 'Day 5 Unleashing Your Creative Forces', 1, '2023-05-14 01:49:26', '2023-05-14 01:49:26', NULL),
(21, 6, 'Getting Started', 1, '2023-05-14 02:00:35', '2023-05-14 02:00:35', NULL),
(22, 6, 'How English Works - A Quick Review', 1, '2023-05-14 02:00:42', '2023-05-14 02:00:42', NULL),
(23, 6, 'English Grammar Section', 1, '2023-05-14 02:00:49', '2023-05-14 02:00:49', NULL),
(24, 10, 'Introduction', 1, '2023-05-14 02:06:32', '2023-05-14 02:06:32', NULL),
(25, 10, 'Laravel Introduction', 1, '2023-05-14 02:06:39', '2023-05-14 02:06:39', NULL),
(26, 10, 'Database Basics', 1, '2023-05-14 02:06:45', '2023-05-14 02:06:45', NULL),
(27, 10, 'Authentication Basics', 1, '2023-05-14 02:06:57', '2023-05-14 02:06:57', NULL),
(28, 12, 'Course Intro - Understand the Basics of Personal Finance', 1, '2023-05-14 02:14:33', '2023-05-14 02:14:33', NULL),
(29, 12, 'Budgets, Savings, Reducing Expenses', 1, '2023-05-14 02:14:40', '2023-05-14 02:14:40', NULL),
(30, 12, 'Grow Your Income: Make More Money Doing What You Love', 1, '2023-05-14 02:14:46', '2023-05-14 02:14:46', NULL),
(31, 12, 'Credit Cards: Understand How to Master Using Credit Cards', 1, '2023-05-14 02:14:57', '2023-05-14 02:14:57', NULL),
(32, 16, 'Introduction', 1, '2023-05-14 02:22:07', '2023-05-14 02:22:07', NULL),
(33, 16, 'Market Research', 1, '2023-05-14 02:22:12', '2023-05-14 02:22:12', NULL),
(34, 16, 'STRATEGY', 1, '2023-05-14 02:22:25', '2023-05-14 02:22:25', NULL),
(35, 16, 'Build a Website', 1, '2023-05-14 02:22:32', '2023-05-14 02:22:32', NULL),
(36, 16, 'SEO (Search Engine Optimization)', 1, '2023-05-14 02:22:40', '2023-05-14 02:22:40', NULL),
(37, 13, 'Day 1 Transform Your Life to Improve Yourself and the World', 1, '2023-05-14 01:48:44', '2023-05-14 01:48:44', NULL),
(38, 13, 'Day 2 The Solution to Overabundance in Your Life', 1, '2023-05-14 01:49:02', '2023-05-14 01:49:02', NULL),
(39, 13, 'Joining the Creative Class', 1, '2023-05-14 01:49:09', '2023-05-14 01:49:09', NULL),
(40, 13, 'Day 4 Transforming Your Life One New Daily Habit at a Time', 1, '2023-05-14 01:49:17', '2023-05-14 01:49:17', NULL),
(41, 13, 'Day 5 Unleashing Your Creative Forces', 1, '2023-05-14 01:49:26', '2023-05-14 01:49:26', NULL),
(42, 8, 'Getting Started', 1, '2023-05-14 02:00:35', '2023-05-14 02:00:35', NULL),
(43, 8, 'How English Works - A Quick Review', 1, '2023-05-14 02:00:42', '2023-05-14 02:00:42', NULL),
(44, 8, 'English Grammar Section', 1, '2023-05-14 02:00:49', '2023-05-14 02:00:49', NULL),
(45, 9, 'Introduction', 1, '2023-05-13 05:50:37', '2023-05-13 05:50:37', NULL),
(46, 9, 'Course1 : HTML Crash Course', 1, '2023-05-13 05:50:44', '2023-05-13 05:50:44', NULL),
(47, 9, 'Course2 : CSS Crash Course', 1, '2023-05-13 05:50:52', '2023-05-13 05:50:52', NULL),
(48, 9, 'Course3 : Complete Javascript Course', 1, '2023-05-13 05:51:27', '2023-05-13 05:51:27', NULL),
(49, 9, 'Course6 : Complete Bootstrap Course', 1, '2023-05-13 05:51:40', '2023-05-13 05:51:40', NULL),
(50, 15, 'Introduction', 1, '2023-05-14 02:06:32', '2023-05-14 02:06:32', NULL),
(51, 15, 'Laravel Introduction', 1, '2023-05-14 02:06:39', '2023-05-14 02:06:39', NULL),
(52, 15, 'Database Basics', 1, '2023-05-14 02:06:45', '2023-05-14 02:06:45', NULL),
(53, 15, 'Authentication Basics', 1, '2023-05-14 02:06:57', '2023-05-14 02:06:57', NULL),
(54, 7, 'Introduction', 1, '2023-05-13 05:50:37', '2023-05-13 05:50:37', NULL),
(55, 7, 'Course1 : HTML Crash Course', 1, '2023-05-13 05:50:44', '2023-05-13 05:50:44', NULL),
(56, 7, 'Course2 : CSS Crash Course', 1, '2023-05-13 05:50:52', '2023-05-13 05:50:52', NULL),
(57, 7, 'Course3 : Complete Javascript Course', 1, '2023-05-13 05:51:27', '2023-05-13 05:51:27', NULL),
(58, 7, 'Course6 : Complete Bootstrap Course', 1, '2023-05-13 05:51:40', '2023-05-13 05:51:40', NULL),
(59, 14, 'Course Intro - Understand the Basics of Personal Finance', 1, '2023-05-14 02:14:33', '2023-05-14 02:14:33', NULL),
(60, 14, 'Budgets, Savings, Reducing Expenses', 1, '2023-05-14 02:14:40', '2023-05-14 02:14:40', NULL),
(61, 14, 'Grow Your Income: Make More Money Doing What You Love', 1, '2023-05-14 02:14:46', '2023-05-14 02:14:46', NULL),
(62, 14, 'Credit Cards: Understand How to Master Using Credit Cards', 1, '2023-05-14 02:14:57', '2023-05-14 02:14:57', NULL),
(63, 17, 'Introduction', 1, '2023-05-14 02:22:07', '2023-05-14 02:22:07', NULL),
(64, 17, 'Market Research', 1, '2023-05-14 02:22:12', '2023-05-14 02:22:12', NULL),
(65, 17, 'STRATEGY', 1, '2023-05-14 02:22:25', '2023-05-14 02:22:25', NULL),
(66, 17, 'Build a Website', 1, '2023-05-14 02:22:32', '2023-05-14 02:22:32', NULL),
(67, 17, 'SEO (Search Engine Optimization)', 1, '2023-05-14 02:22:40', '2023-05-14 02:22:40', NULL),
(68, 18, 'Introduction', 1, '2023-05-14 02:22:07', '2023-05-14 02:22:07', NULL),
(69, 18, 'Market Research', 1, '2023-05-14 02:22:12', '2023-05-14 02:22:12', NULL),
(70, 18, 'STRATEGY', 1, '2023-05-14 02:22:25', '2023-05-14 02:22:25', NULL),
(71, 18, 'Build a Website', 1, '2023-05-14 02:22:32', '2023-05-14 02:22:32', NULL),
(72, 18, 'SEO (Search Engine Optimization)', 1, '2023-05-14 02:22:40', '2023-05-14 02:22:40', NULL),
(73, 11, 'Introduction', 1, '2023-05-13 05:50:37', '2023-05-13 05:50:37', NULL),
(74, 11, 'Course1 : HTML Crash Course', 1, '2023-05-13 05:50:44', '2023-05-13 05:50:44', NULL),
(75, 11, 'Course2 : CSS Crash Course', 1, '2023-05-13 05:50:52', '2023-05-13 05:50:52', NULL),
(76, 11, 'Course3 : Complete Javascript Course', 1, '2023-05-13 05:51:27', '2023-05-13 05:51:27', NULL),
(77, 11, 'Course6 : Complete Bootstrap Course', 1, '2023-05-13 05:51:40', '2023-05-13 05:51:40', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `deliveries`
--

CREATE TABLE `deliveries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `titulo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `precio` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dias` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tiempo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `deliveries`
--

INSERT INTO `deliveries` (`id`, `titulo`, `precio`, `dias`, `tiempo`, `created_at`, `updated_at`) VALUES
(2, 'Camion', '5', '2', '2', '2023-11-22 22:25:54', '2023-11-22 22:25:54'),
(3, 'Gratis', '0', '1', '1', '2023-11-25 06:44:16', '2023-11-25 06:44:16'),
(4, 'Ridery', '10', '1', '2horas', '2023-12-21 01:43:09', '2023-12-21 01:43:09');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `direccions`
--

CREATE TABLE `direccions` (
  `id` bigint(20) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `direccion` text,
  `referencia` text,
  `ciudad` varchar(255) DEFAULT NULL,
  `zip` varchar(255) DEFAULT NULL,
  `googlemaps` longtext NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `direccions`
--

INSERT INTO `direccions` (`id`, `title`, `user_id`, `direccion`, `referencia`, `ciudad`, `zip`, `googlemaps`, `created_at`, `updated_at`) VALUES
(4, 'Casa', 12, 'Av Lecuna Edif.Catuche piso 19', 'Residencias', 'Caracas', '1010', '[\"-66.9024979\",\"10.4985345\",\"-66.9024979\",\"10.4985345\"]', '2023-12-24 19:52:54', '2023-12-24 19:52:54'),
(6, 'Trabajo', 12, 'Av. Ppal El Cafetal, CC El Cafetal', 'Cc El Cafetal', 'caracas', '1010a', '[\"-66.9024979\",\"10.4985345\"]', '2023-12-24 23:12:15', '2023-12-24 23:12:15');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `discounts`
--

CREATE TABLE `discounts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(250) NOT NULL,
  `type_discount` tinyint(1) UNSIGNED NOT NULL DEFAULT '1' COMMENT '1 es porcentaje y 2 es por monto fijo',
  `discount` double NOT NULL DEFAULT '0',
  `start_date` timestamp NULL DEFAULT NULL,
  `end_date` timestamp NULL DEFAULT NULL,
  `discount_type` tinyint(1) UNSIGNED NOT NULL DEFAULT '1' COMMENT '1:curso 2:categoria',
  `type_campaing` tinyint(1) UNSIGNED DEFAULT '1' COMMENT '1:normal 2:flash 3:banner',
  `discount_type_product` tinyint(1) UNSIGNED DEFAULT '1' COMMENT '1:product 2:categoria',
  `type_campaing_product` tinyint(1) UNSIGNED NOT NULL DEFAULT '1' COMMENT '1:normal 2:flash 3:banner',
  `state` tinyint(1) UNSIGNED NOT NULL DEFAULT '1' COMMENT '1Activo, 2 Inactivo',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `discounts`
--

INSERT INTO `discounts` (`id`, `code`, `type_discount`, `discount`, `start_date`, `end_date`, `discount_type`, `type_campaing`, `discount_type_product`, `type_campaing_product`, `state`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '6539c63ccdbb8', 1, 3, '2023-11-01 04:00:00', '2023-11-23 04:00:00', 1, 1, 0, 0, 1, '2023-10-25 02:59:11', '2023-11-03 01:19:54', NULL),
(2, '65386933f169e', 1, 4, '2023-10-24 04:00:00', '2023-11-01 04:00:00', 2, 1, 0, 0, 1, '2023-10-25 03:15:10', '2023-10-28 20:24:49', NULL),
(3, '65399a1f7372c', 1, 35, '2023-11-03 04:00:00', '2023-11-10 04:00:00', 1, 2, 0, 0, 1, '2023-10-25 03:24:34', '2023-11-04 18:38:24', NULL),
(4, '6538526c80b76', 1, 30, '2023-10-29 04:00:00', '2023-11-08 04:00:00', 1, 3, 0, 0, 1, '2023-10-25 03:25:32', '2023-10-31 01:37:13', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `discount_categories`
--

CREATE TABLE `discount_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `discount_id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `discount_categories`
--

INSERT INTO `discount_categories` (`id`, `discount_id`, `category_id`, `created_at`, `updated_at`) VALUES
(12, 2, 2, '2023-10-28 20:24:49', '2023-10-28 20:24:49'),
(13, 2, 1, '2023-10-28 20:24:49', '2023-10-28 20:24:49'),
(14, 2, 8, '2023-10-28 20:24:49', '2023-10-28 20:24:49');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `discount_categories_products`
--

CREATE TABLE `discount_categories_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `discount_id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `discount_categories_products`
--

INSERT INTO `discount_categories_products` (`id`, `discount_id`, `category_id`, `created_at`, `updated_at`) VALUES
(12, 2, 2, '2023-10-28 20:24:49', '2023-10-28 20:24:49'),
(13, 2, 1, '2023-10-28 20:24:49', '2023-10-28 20:24:49'),
(14, 2, 8, '2023-10-28 20:24:49', '2023-10-28 20:24:49');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `discount_courses`
--

CREATE TABLE `discount_courses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `discount_id` bigint(20) UNSIGNED DEFAULT NULL,
  `course_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `discount_courses`
--

INSERT INTO `discount_courses` (`id`, `discount_id`, `course_id`, `created_at`, `updated_at`) VALUES
(42, 4, 1, '2023-10-31 01:37:13', '2023-10-31 01:37:13'),
(43, 4, 2, '2023-10-31 01:37:13', '2023-10-31 01:37:13'),
(44, 4, 12, '2023-10-31 01:37:13', '2023-10-31 01:37:13'),
(45, 1, 17, '2023-11-03 01:19:54', '2023-11-03 01:19:54'),
(46, 1, 14, '2023-11-03 01:19:54', '2023-11-03 01:19:54'),
(47, 1, 9, '2023-11-03 01:19:54', '2023-11-03 01:19:54'),
(48, 1, 7, '2023-11-03 01:19:54', '2023-11-03 01:19:54'),
(49, 1, 5, '2023-11-03 01:19:54', '2023-11-03 01:19:54'),
(50, 1, 3, '2023-11-03 01:19:54', '2023-11-03 01:19:54'),
(51, 1, 4, '2023-11-03 01:19:54', '2023-11-03 01:19:54'),
(52, 1, 2, '2023-11-03 01:19:54', '2023-11-03 01:19:54'),
(53, 1, 1, '2023-11-03 01:19:54', '2023-11-03 01:19:54'),
(54, 3, 2, '2023-11-04 18:38:24', '2023-11-04 18:38:24'),
(55, 3, 1, '2023-11-04 18:38:24', '2023-11-04 18:38:24'),
(56, 3, 4, '2023-11-04 18:38:24', '2023-11-04 18:38:24'),
(57, 3, 9, '2023-11-04 18:38:24', '2023-11-04 18:38:24');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `discount_products`
--

CREATE TABLE `discount_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `discount_id` bigint(20) UNSIGNED DEFAULT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `discount_products`
--

INSERT INTO `discount_products` (`id`, `discount_id`, `product_id`, `created_at`, `updated_at`) VALUES
(42, 4, 1, '2023-10-31 01:37:13', '2023-10-31 01:37:13'),
(43, 4, 2, '2023-10-31 01:37:13', '2023-10-31 01:37:13'),
(44, 4, 12, '2023-10-31 01:37:13', '2023-10-31 01:37:13'),
(45, 1, 17, '2023-11-03 01:19:54', '2023-11-03 01:19:54'),
(46, 1, 14, '2023-11-03 01:19:54', '2023-11-03 01:19:54'),
(47, 1, 9, '2023-11-03 01:19:54', '2023-11-03 01:19:54'),
(48, 1, 7, '2023-11-03 01:19:54', '2023-11-03 01:19:54'),
(49, 1, 5, '2023-11-03 01:19:54', '2023-11-03 01:19:54'),
(50, 1, 3, '2023-11-03 01:19:54', '2023-11-03 01:19:54'),
(51, 1, 4, '2023-11-03 01:19:54', '2023-11-03 01:19:54'),
(52, 1, 2, '2023-11-03 01:19:54', '2023-11-03 01:19:54'),
(53, 1, 1, '2023-11-03 01:19:54', '2023-11-03 01:19:54'),
(54, 3, 2, '2023-11-04 18:38:24', '2023-11-04 18:38:24'),
(55, 3, 1, '2023-11-04 18:38:24', '2023-11-04 18:38:24'),
(56, 3, 4, '2023-11-04 18:38:24', '2023-11-04 18:38:24'),
(57, 3, 9, '2023-11-04 18:38:24', '2023-11-04 18:38:24');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `endesarollos`
--

CREATE TABLE `endesarollos` (
  `id` bigint(11) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` text,
  `imagen` varchar(255) DEFAULT NULL,
  `state` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
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
-- Estructura de tabla para la tabla `pickups`
--

CREATE TABLE `pickups` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombreCompleto` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `idNumber` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `portafolios`
--

CREATE TABLE `portafolios` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `isFeatured` tinyint(1) NOT NULL,
  `popup` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `youtubeurl` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `imagen` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `category_portafolio_id` bigint(20) UNSIGNED NOT NULL,
  `status` enum('PUBLISHED','PENDING','REJECTED') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'PENDING',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `portafolios`
--

INSERT INTO `portafolios` (`id`, `title`, `description`, `slug`, `isFeatured`, `popup`, `url`, `youtubeurl`, `imagen`, `user_id`, `category_portafolio_id`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Tortas La Abuela Isabel', '<p>Tecnolog&iacute;a:&nbsp;Html5, css3, js, bootstrap, jquery, php,</p>\r\n\r\n<p>Descripci&oacute;n:&nbsp;Cat&aacute;logo de Productos</p>', 'tortas-la-abuela-isabel', 1, 'torta-la-abuela-isabel', 'null', 'null', 'portafolios/WvhPRSpec25O2xVV6oYf0ijrWadgsCRWqDJeHKaf.jpg', 1, 9, 'PUBLISHED', '2023-11-19 04:30:32', '2023-11-19 04:30:51'),
(2, 'Adm Condominium Services', '<p>Html5, css3, js, bootstrap, jquery, php, wordpress,</p>\r\n\r\n<p>Cat&aacute;logo de Productos y Servicios</p>', 'adm-condominium-services', 1, 'adm-condominum', 'https://cms.com.pa/', 'null', 'portafolios/QX0s8FcwHEN2PoIPae2WZXcT03aRNFqly7yWkOOy.jpg', 1, 9, 'PUBLISHED', '2023-11-19 04:58:48', '2023-11-19 05:49:11'),
(3, 'Corporación TMV', '<p>Html5, css3, js, bootstrap, jquery, php, wordpress,</p>\r\n\r\n<p>Cat&aacute;logo de Productos y Servicios</p>', 'corporacion-tmv', 1, 'corp-tmv', 'https://www.corporaciontmv.com/', 'null', 'portafolios/05Q6OG6vRRps8FmBrfh9JJEyw4GFnwXGRYgnwROx.png', 1, 9, 'PUBLISHED', '2023-11-19 05:01:35', '2023-11-19 05:49:09'),
(4, 'Art of Cold Calling', '<p>Html5, css3, bootstrap, js, php, mysql,</p>\r\n\r\n<p>Cat&aacute;logo de Servicios y promoci&oacute;n de Producto</p>', 'art-of-cold-calling', 1, 'art-of-cold-calling', 'https://theartofcoldcalling.com/', 'null', 'portafolios/YLUqulWf88zTAR9uCyII6jjCTDDiAmPgkxetoXDf.jpg', 1, 9, 'PUBLISHED', '2023-11-19 05:03:39', '2023-11-19 05:49:07'),
(5, 'Asincro', '<p>Html5, css3, bootstrap, js, php, wordpress,</p>\r\n\r\n<p>Cat&aacute;logo de Servicios</p>', 'asincro', 1, 'asincro', 'https://asincro.com', 'null', 'portafolios/534GwaIlp7XHfheDpuW0GV9GFRPxhbLak2K9XQgi.jpg', 1, 9, 'PUBLISHED', '2023-11-19 05:04:31', '2023-11-19 05:49:06'),
(6, 'Bariatrico', '<p>Html5, css3, bootstrap, js, php, mysql,</p>\r\n\r\n<p>Cat&aacute;logo de Servicios, Medicina</p>', 'bariatrico', 1, 'bariatrico', 'https://www.bariatrico.com/', 'null', 'portafolios/Lwj1o662nasdMcMVlp2ALApuYLciuRUbOnvitRvu.jpg', 1, 9, 'PUBLISHED', '2023-11-19 05:05:26', '2023-11-19 05:49:03'),
(7, 'Boca Beach', '<p>Html5, css3, bootstrap, js, php,</p>\r\n\r\n<p>Cat&aacute;logo de Servicios</p>', 'boca-beach', 1, 'boca-beach', 'https://malcolmcordova.com/landingpages/boca-beach-house/index.php', 'null', 'portafolios/5S3ZpC1P60kLMNHnmUZhyiGqxOQzs5frQQNc9PEN.jpg', 1, 11, 'PUBLISHED', '2023-11-19 05:06:30', '2023-11-19 05:49:02'),
(8, 'Clean & Clean', '<p>Html5, css3, bootstrap, js, php,</p>\r\n\r\n<p>Cat&aacute;logo de Servicios</p>', 'clean-clean', 1, 'clean-clean', 'null', 'null', 'portafolios/4TKrFdDtJrCHi2m7j3W1mbYyImyknU7ONoDikIHE.jpg', 1, 9, 'PUBLISHED', '2023-11-19 05:07:15', '2023-11-19 05:48:59'),
(9, 'Eccogreen', '<p>Html5, css3, bootstrap, js, php, wordpress,</p>\r\n\r\n<p>Cat&aacute;logo de Servicios y productos</p>', 'eccogreen', 0, 'ecoogreen', 'null', 'null', 'portafolios/Ey8zh9MEaEUNmjGYK4B67hGPedisBhJP4lnTrBt3.jpg', 1, 9, 'PUBLISHED', '2023-11-19 05:11:14', '2023-11-19 05:48:57'),
(10, 'Esperanté', '<p>Html5, css3, bootstrap, js, php, wordpress,</p>\r\n\r\n<p>Cat&aacute;logo de Servicios y productos</p>', 'esperante', 0, 'esperante', 'null', 'null', 'portafolios/7F4E0e8oIlI7etwQlLdl9yf911AKbsJHsT5TfDd9.jpg', 1, 9, 'PUBLISHED', '2023-11-19 05:13:32', '2023-11-19 05:48:54'),
(11, 'Global Sat', '<p>Html5, css3, bootstrap, js, php,</p>\r\n\r\n<p>Cat&aacute;logo de Servicios y productos</p>', 'global-sat', 0, 'global-sat', 'null', 'null', 'portafolios/v9HmdfRYI5WBEe1O68QzMggRp9IZrJEqXG5BEVBH.jpg', 1, 9, 'PUBLISHED', '2023-11-19 05:14:58', '2023-11-19 05:48:52'),
(12, 'Libro Real de la música venezolana', '<p>Html5, css3, bootstrap, js, php,mysql</p>\r\n\r\n<p>Directorio de partituras de m&uacute;sica venezolana</p>', 'libro-real-de-la-musica-venezolana', 1, 'el-libro-real', 'https://libroreal.com/', 'null', 'portafolios/2V2WvRDMU6L5qzwBHrT4CZA05QBhhHwHSpIGNtsR.jpg', 1, 9, 'PUBLISHED', '2023-11-19 05:16:38', '2023-11-19 05:48:50'),
(13, 'La Lombarda', '<p>Html5, css3, bootstrap, js, php,mysql,</p>\r\n\r\n<p>Cat&aacute;logo de Productos</p>', 'la-lombarda', 0, 'la-lombarda', 'null', 'null', 'portafolios/Q5Z1A3Vv8ua8j7xNPRlsmmlO0Ca6aRerw8kudeLt.png', 1, 9, 'PUBLISHED', '2023-11-19 05:17:37', '2023-11-19 05:48:49'),
(14, 'LTS Lights', '<p>Html5, css3, bootstrap, js, php, opencart,</p>\r\n\r\n<p>Cat&aacute;logo de Productos</p>', 'lts-lights', 0, 'lts-lights', 'null', 'null', 'portafolios/AzzVRKsBuot5sdqjjQXhKnHR0XyHuIDIHpVamAUk.jpg', 1, 9, 'PUBLISHED', '2023-11-19 05:18:53', '2023-11-19 05:48:46'),
(15, 'Mafe Accessories', '<p>Html5, css3, bootstrap, js, php, mysql,</p>\r\n\r\n<p>Tienda en l&iacute;nea</p>', 'mafe-accessories', 1, 'mafe', 'null', 'null', 'portafolios/dyFA16yvpM7SGKe7fdoCKikn06Zg4YvK7uftJaJq.png', 1, 9, 'PUBLISHED', '2023-11-19 05:20:07', '2023-11-19 05:48:44'),
(16, 'Marpha Open', '<p>Html5, css3, bootstrap, js, php, mysql,</p>\r\n\r\n<p>Cat&aacute;logo de Eventos</p>', 'marpha-open', 0, 'marpha', 'https://www.marfaopen.org/', 'null', 'portafolios/G23gBNN46LpGyd2h6SjiZU7D0Ny2R7lrQKGqUDYg.jpg', 1, 9, 'PUBLISHED', '2023-11-19 05:21:58', '2023-11-19 05:48:42'),
(17, 'Mery Godigna Collet', '<p>Html5, css3, bootstrap, js, php, mysql,</p>\r\n\r\n<p>Galer&iacute;a de Arte</p>', 'mery-godigna-collet', 1, 'mery-godigna', 'https://merygodignacollet.com', 'null', 'portafolios/KjYjc7Ya9LEWHc8gNpQQ6hWRwIeCGVYjKVWpw8Oi.jpg', 1, 9, 'PUBLISHED', '2023-11-19 05:23:24', '2023-11-19 05:48:40'),
(18, 'Mildred Latin Show', '<p>Html5, css3, bootstrap, js, php,</p>\r\n\r\n<p>Cat&aacute;logo de Servicios</p>', 'mildred-latin-show', 0, 'mildred', 'null', 'null', 'portafolios/u06tGKtWYe9H9DLXSu4XCDciS3Im4uImYrIZtGxS.jpg', 1, 9, 'PUBLISHED', '2023-11-19 05:24:12', '2023-11-19 05:48:38'),
(19, 'C.C. Millennium Mall Caracas', '<p>Html5, css3, bootstrap, js, perl, angularjs, laravel,</p>\r\n\r\n<p>Web Oficial Centro Comercial</p>', 'cc-millennium-mall-caracas', 1, 'millenium-mall-caracas', 'https://millenniummall.com', 'null', 'portafolios/NNnZjZQMuZ1RAiQVOX5bnpQk0MsDfeku71QKQp9w.jpg', 1, 9, 'PUBLISHED', '2023-11-19 05:25:47', '2023-11-19 05:48:36'),
(20, 'NatuPros Panamá', '<p>Html5, css3, bootstrap, js, php</p>', 'natupros-panama', 0, 'natupros', 'null', 'null', 'portafolios/epL0gzo0lVYAOydBMerfbcaREn45UMiNOWTc0WcJ.jpg', 1, 3, 'PUBLISHED', '2023-11-19 05:26:35', '2023-11-19 05:48:34'),
(21, 'Norwegian Bliss Landing Promo', '<p>Html5, css3, bootstrap, js, php,</p>\r\n\r\n<p>Landing Page, con formulario BD</p>', 'norwegian-bliss-landing-promo', 1, 'norwegian-bliss', 'http://malcolmcordova.com/landingpages/alaska/index.html', 'null', 'portafolios/fGWyDWsgomvlypVZElgRuBlomtRN9mPcUUThfYyc.jpg', 1, 11, 'PUBLISHED', '2023-11-19 05:27:52', '2023-11-19 05:48:32'),
(22, 'Portonovo', '<p>Html5, css3, bootstrap, js, php,</p>\r\n\r\n<p>Cat&aacute;logo de Productos</p>', 'portonovo', 0, 'portonovo', 'null', 'null', 'portafolios/K5Qd3XjylWRvv0H38Ec079C263fT2pWpukkp6DKo.jpg', 1, 9, 'PUBLISHED', '2023-11-19 05:28:43', '2023-11-19 05:48:30'),
(23, 'Hotel Punta Palma', '<p>Html5, css3, bootstrap, js, php,</p>\r\n\r\n<p>Cat&aacute;logo de Servicios</p>', 'hotel-punta-palma', 0, 'punta-palma', 'null', 'null', 'portafolios/HQMRWOpggjaFYiNM76JwjomcDYtH2SA6kBkkVmCB.jpg', 1, 3, 'PUBLISHED', '2023-11-19 05:29:30', '2023-11-19 05:48:28'),
(24, 'SVCBMF Oficial', '<p>Html5, css3, bootstrap, js, php, angular +10, mysql, Laravel 10,</p>\r\n\r\n<p>Directorio de Miembros de la sociedad</p>', 'svcbmf-oficial', 1, 'svcbmf', 'https://www.svcbmf.org', 'null', 'portafolios/MSgNjyXiEpTOSC6aC01xmnwGNYmVMfjAGo3CUTFT.jpg', 1, 9, 'PUBLISHED', '2023-11-19 05:31:17', '2023-11-19 05:48:27'),
(25, 'Urban Living Panamá', '<p>Html5, css3, bootstrap, js, php, mysql,</p>\r\n\r\n<p>Landing Promo Ventas Apartamentos</p>', 'urban-living-panama', 1, 'urban-living', 'http://malcolmcordova.com/landingpages/urban-living/index.php', 'null', 'portafolios/CDhPVHDHSwxBXWCu3FLn41hVv9qBqzrNKmoUSwQJ.jpg', 1, 11, 'PUBLISHED', '2023-11-19 05:32:10', '2023-11-19 05:48:24'),
(27, 'Vieras', '<p>Html5, css3, bootstrap, js, php, wordpress,</p>\r\n\r\n<p>Cat&aacute;logo de Servicios y productos</p>', 'vieras', 1, 'vieras', 'null', 'null', 'portafolios/0vkTLgeLKi6l5yMeawjznD8tCg7josE2SayvkQ2Y.jpg', 1, 9, 'PUBLISHED', '2023-11-19 05:33:46', '2023-11-19 05:48:20'),
(28, 'Warrior Vending Machines', '<p>Html5, css3, bootstrap, js, php,</p>\r\n\r\n<p>Cat&aacute;logo de Servicios y productos</p>', 'warrior-vending-machines', 1, 'warrior', 'null', 'null', 'portafolios/AASWf94DFUDMBKwKNDO0gf4MoSl1ES9senINpG81.jpg', 1, 9, 'PUBLISHED', '2023-11-19 05:35:04', '2023-11-19 05:48:17'),
(29, 'WFort lauderdale hotel landing', '<p>Html5, css3, bootstrap, js, php,</p>\r\n\r\n<p>Landing promo hotel</p>', 'wfort-lauderdale-hotel-landing', 1, 'wfort', 'http://malcolmcordova.com/landingpages/fortlauderdale-residences/index.php', 'null', 'portafolios/jcoWBJrojxlKaiDSXG0V4L3VtwZaP2xSk3gzcfY5.jpg', 1, 11, 'PUBLISHED', '2023-11-19 05:36:00', '2023-11-19 05:48:15'),
(30, 'Englatina Zingg', '<p>Html5, css3, bootstrap, js, php,</p>\r\n\r\n<p>Cat&aacute;logo de Productos</p>', 'englatina-zingg', 1, 'englatina', 'null', 'null', 'portafolios/fqfORus3GmHczAAkTzGY1fRDQ1Q30ffTLcam984B.png', 1, 9, 'PUBLISHED', '2023-11-19 05:37:02', '2023-11-19 05:48:14'),
(31, 'Full Technology-landing', '<p>Html5, css3, bootstrap, js, php,</p>\r\n\r\n<p>Cat&aacute;logo de Productos</p>', 'full-technology-landing', 1, 'full-technology', 'http://malcolmcordova.com/landingpages/fulltechnology/index.html', 'null', 'portafolios/65isyOvAMNkWwtTloKnSmWB4dprMwYpsswotqsPJ.png', 1, 11, 'PUBLISHED', '2023-11-19 05:38:06', '2023-11-19 05:48:12'),
(33, 'malcolmcordova.com', '<p>Html5, css3, jJs, Ts, Angular 14, laravel 10, mysql, postman, github</p>', 'malcolmcordovacom', 1, 'malcolm', 'https://malcolmcordova.com', 'null', 'portafolios/KfrGVbvTDXBIaT3bCrZ37lqSY01i7LIUfLMhtC4o.png', 1, 12, 'PUBLISHED', '2023-11-19 08:29:53', '2023-11-19 08:32:59'),
(34, 'Vali Spa PWA', '<p>Html5, css3, Js, Ts, Angular 10, Codeiginiter 3, mysql</p>', 'vali-spa-pwa', 1, 'vali-spa-pwa', 'null', 'null', 'portafolios/5Ptv2e3tjtXr0VDppkEurLqWzpW6V650FKYvnW2C.jpg', 1, 12, 'PUBLISHED', '2023-11-19 08:32:48', '2023-11-19 08:32:57'),
(35, 'SVCBMF PWA', '<p>Html5, Css,Js, Ts, Angular 10, PWA, Codeigniter 3, Mysql</p>', 'svcbmf-pwa', 1, 'svcbmf-pwa', 'https://www.svcbmf.org/directorio', 'null', 'portafolios/Cas9dH7LBhu1hVZQ3zpxj73K5EbWCH4Z7rbYy9Tj.png', 1, 12, 'PUBLISHED', '2023-11-19 08:36:48', '2023-11-19 08:42:09'),
(36, 'Taller de Orfebrería Ursi Galletti', '<p>Html5, css3, js, ts, Angular 14, Laravel 10, mysql, paypal,</p>\r\n\r\n<p>Ecommerce con carrito, tipos de usuario: admin, cliente, desarrollo hecho a la medida,&nbsp;</p>', 'taller-de-orfebreria-ursi-galletti', 1, 'ursi-galletti', 'https://ursigalletti.net/', 'null', 'portafolios/6ojZWf9KGiwta4uLufD22lMN9EN33E3t9RxgBEMu.png', 1, 12, 'PUBLISHED', '2023-11-19 08:42:02', '2023-11-19 08:42:12'),
(37, 'prueba', '<p>Hello World!</p>', 'prueba', 0, 'esto-prueba', 'null', 'GeECl5Xio0A', 'portafolios/zS7zT9FQrGkocsJkDaqzCIn8vmeJk5RzcO3ipkb3.jpg', 1, 3, 'PENDING', '2023-11-20 06:24:37', '2023-11-20 06:35:32'),
(38, 'prueba nueva', '<p>Hello World!</p>', 'prueba-nueva', 1, 'prueba-web', 'null', 'null', 'portafolios/2Eoi7vZr7V263qkwvvLgXXIQLyoUN8t8XWBDoINE.png', 1, 3, 'PENDING', '2023-11-20 04:58:25', '2023-11-20 05:38:32'),
(39, 'Flyer fulltechnolgy', '<p>Dise&ntilde;o grafico: photoshop, illustrator</p>\r\n\r\n<p>&nbsp;</p>', 'flyer-fulltechnolgy', 1, 'Flyer-full', 'null', 'null', 'portafolios/dzMyJG57waE14vjN9UboCe6wbSu5XfFw0ji97LWc.jpg', 1, 8, 'PUBLISHED', '2023-11-20 09:18:18', '2023-11-20 09:18:40'),
(40, 'Flyer Fulltechnology c', '<p>Flyer Cuadrado: photoshop</p>', 'flyer-fulltechnology-c', 1, 'Flyer-fulldos', 'null', 'null', 'portafolios/cUKkwBGb2fh7CzYRArlmGBQiu02pj5OtzG4ZuPmy.jpg', 1, 8, 'PUBLISHED', '2023-11-20 09:20:22', '2023-11-20 09:20:38'),
(41, 'Tarjeta Eunice', '<p>Dise&ntilde;o de tarjeta y/o etiqueta adesiva con codigo QR</p>', 'tarjeta-eunice', 1, 'Tarjeta-eunice', 'null', 'null', 'portafolios/iHu4zsa5ZLxxNdCQZijQ1Hxhs1MiKQ9jcSbUkDK8.jpg', 1, 2, 'PUBLISHED', '2023-11-20 09:22:33', '2023-11-20 09:22:47'),
(42, 'Tarjeta eunice color', '<p>Tarjeta en color, con codigo Qr</p>', 'tarjeta-eunice-color', 1, 'Tar-eunice-color', 'null', 'null', 'portafolios/Bys6zHDPTkoEm7Fpxf57rkzssbY9v3puaJ3qj0BK.jpg', 1, 2, 'PUBLISHED', '2023-11-20 09:24:15', '2023-11-20 09:24:32'),
(43, 'Promocion producto', '<p>Banner para redes sociales</p>', 'promocion-producto', 1, 'Promo-full', 'null', 'null', 'portafolios/BQlleOWbgy10BJSV3KsVjyTJ6q1kDJBOD1k2uJ2B.jpg', 1, 8, 'PUBLISHED', '2023-11-20 09:25:40', '2023-11-20 09:25:54'),
(44, 'Banner Promocion', '<p>Banner para redes sociales y web</p>', 'banner-promocion', 1, 'Bann-prom', 'null', 'null', 'portafolios/2T5PGXvThIXjY03A0ZK1hNU8kzsuNZD9YNmkN31h.jpg', 1, 8, 'PUBLISHED', '2023-11-20 09:28:20', '2023-11-20 09:28:41'),
(45, 'Banner web', '<p>Banner web</p>', 'banner-web', 1, 'Bann-web gatos', 'null', 'null', 'portafolios/RbDK2GPwq6r51l3ds5V7BF5uWwfx8VROo6cgAzu6.jpg', 1, 2, 'PUBLISHED', '2023-11-20 09:29:55', '2023-11-20 09:30:11'),
(46, 'Banner web color', '<p>Dise&ntilde;o &nbsp;banner&nbsp;</p>', 'banner-web-color', 1, 'Banner-web', 'null', 'null', 'portafolios/WB9EwzOaX9P97956CLPcAGFJGbpfWgdN55hPnhVW.jpg', 1, 2, 'PUBLISHED', '2023-11-20 09:31:33', '2023-11-20 09:34:17'),
(47, 'Banner promo redes sociales', '<p>Banner promo miscotas</p>', 'banner-promo-redes-sociales', 1, 'Bann-promo', 'null', 'null', 'portafolios/fLNQdiylXBFQhcfKrt8ChjmHUANFsi99FLiXP0XS.jpg', 1, 8, 'PUBLISHED', '2023-11-20 09:33:34', '2023-11-20 09:34:12'),
(48, 'Newsletter email bienvenida registro', '<p>Dise&ntilde;o para email&nbsp;</p>', 'newsletter-email-bienvenida-registro', 1, 'News-emailuno', 'null', 'null', 'portafolios/AsfhRBkWR8SOtXj5fXjymaE6RZqV36Au18mbceL5.jpg', 1, 13, 'PUBLISHED', '2023-11-20 09:54:25', '2023-11-20 09:54:42'),
(49, 'Email promo', '<p>Promo para email</p>', 'email-promo', 1, 'Email-promo', 'null', 'null', 'portafolios/SCifRbppYaMEpO9eEd3XixoJBq0lwsD9ljrq6v2K.jpg', 1, 13, 'PUBLISHED', '2023-11-20 10:00:07', '2023-11-20 10:00:21');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(250) NOT NULL,
  `slug` text NOT NULL,
  `subtitle` text NOT NULL,
  `imagen` varchar(250) DEFAULT NULL,
  `price_usd` double NOT NULL DEFAULT '0',
  `price_bves` double NOT NULL DEFAULT '0',
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `category_product_id` bigint(20) UNSIGNED DEFAULT NULL,
  `sub_category_id` bigint(20) UNSIGNED NOT NULL,
  `category_sale_id` bigint(20) UNSIGNED NOT NULL,
  `vimeo_id` varchar(50) DEFAULT NULL,
  `time` varchar(50) DEFAULT NULL,
  `description` longtext CHARACTER SET utf8 NOT NULL,
  `requirements` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `who_is_it_for` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `colors` longtext NOT NULL,
  `peso` longtext NOT NULL,
  `medida` longtext NOT NULL,
  `material` longtext NOT NULL,
  `state` tinyint(1) UNSIGNED NOT NULL DEFAULT '1' COMMENT '1:prueba 2:publico',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `products`
--

INSERT INTO `products` (`id`, `title`, `slug`, `subtitle`, `imagen`, `price_usd`, `price_bves`, `user_id`, `category_product_id`, `sub_category_id`, `category_sale_id`, `vimeo_id`, `time`, `description`, `requirements`, `who_is_it_for`, `colors`, `peso`, `medida`, `material`, `state`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Boxer Caballero', 'boxer-caballero', 'Boxer CK 3x10', 'products/HpOZDE26boIV6N4qURJo45czYf8YmHbMF3IBGJE5.jpg', 10, 400, 1, 3, 9, 0, NULL, NULL, '<p>Comodos boxer en varias tallas y colores en promocion navide&ntilde;a</p>', '[\"\"]', '[\"Hombres \",\"Publico en General Adulto\"]', '[\"#c74848\"]', '[\"das\"]', '[\"das\"]', '[\"madera\"]', 2, '2023-12-20 04:51:44', '2023-12-20 04:56:02', NULL),
(2, 'Brugesic', 'brugesic', '500Mg', 'products/XpJfV1rtKZsIhyZ6HtWNCoGeXc6OemT5SJqrcTiC.jpg', 30, 400, 1, 11, 12, 1, NULL, NULL, '<p>asdkjhaksjhkf</p>', '[\"Caja de 10 pastillas de 500 mg\",\"Alivio del dolor\"]', '[\"Publico en General\"]', '[\"\"]', '[\"\"]', '[\"\"]', '[\"\"]', 2, '2023-12-20 04:59:41', '2023-12-24 00:31:03', NULL),
(3, 'Milanesa Plumrose', 'milanesa-plumrose', '500g de milanesa rebanada', 'products/Xc9VxWf5cHkzpOIAyPGOQJxEXighhistEUBowhOu.jpg', 6, 400, 1, 13, 14, 1, NULL, NULL, '<p>Fresca milanesoa empaquetadas x 6</p>', '[\"ads\"]', '[\"das\"]', '[\"#893434\",\"#d23232\"]', '[\"das\"]', '[\"das\"]', '[\"sd\"]', 2, '2023-12-20 05:20:40', '2023-12-24 00:30:36', NULL),
(4, 'Pantaletas', 'pantaletas', 'Varios Modelos 3x10', 'products/YOfngma58ughHS4uNH1O2R7ayBq7ReGiCQoUXtRc.jpg', 10, 300, 1, 2, 18, 1, NULL, NULL, '<p>dsaasd</p>', '[\"adsdas\"]', '[\"dasasd\"]', '[\"#eed2d2\",\"#1b1818\",\"#e21212\",\"#eff312\",\"#f9f6f6\"]', '[\"\"]', '[\"S\",\"M\",\"L\"]', '[\"Seda\",\"Algodon\"]', 2, '2023-12-20 05:34:54', '2023-12-24 00:30:51', NULL),
(5, 'Papel Lustrillo', 'papel-lustrillo', 'Varios Colores 5x20', 'products/oROwAB9pbqZsdgHCXfs25p6JSASrl196tsjR8PRL.jpg', 20, 400, 1, 19, 20, 1, NULL, NULL, '<p>saddasHello World!</p>', '[\"\"]', '[\"Publico en General\",\"Decoraci\\u00f3n\"]', '[\"#f01414\",\"#3c43aa\",\"#c3e41b\"]', '[\"\"]', '[\"100Cmx200Cm\"]', '[\"Papel Lustrillo\"]', 2, '2023-12-20 05:37:27', '2023-12-24 00:30:24', NULL),
(6, 'Acetaminofen', 'acetaminofen', '500mg', 'products/NSeGKcr6SSClyOwJvfQ62RwnKPGJybOzy9vWW84R.jpg', 6, 30, 1, 11, 12, 1, NULL, NULL, '<p>Pastillas Acetaminofen</p>', '[\"\"]', '[\"Publico en general\"]', '[\"\"]', '[\"500mg\"]', '[\"\"]', '[\"\"]', 2, '2023-12-20 05:38:44', '2023-12-24 00:30:11', NULL),
(7, 'Play Station 5', 'play-station-5', 'Consola Play Station 5', 'products/SqEeNDUOXxPw5CcxKQLHkFFzm6IiSnjXT1UldF65.jpg', 200, 6000, 5, 21, 1, 1, NULL, NULL, '<p>das</p>', '[\"Consola con 2 Controles\",\"Cables de conexion\",\"1 Juego Incluido\"]', '[\"P\\u00fablico en General\"]', '[\"#b93737\",\"#1b1818\",\"#4f63c4\"]', '[\"3kg\"]', '[\"40x40x35cm\"]', '[\"\"]', 2, '2023-12-20 05:42:53', '2023-12-24 00:29:47', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `products_students`
--

CREATE TABLE `products_students` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `clases_checkeds` text,
  `state` tinyint(1) UNSIGNED DEFAULT NULL COMMENT '1:iniciado 2:terminado',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `products_students`
--

INSERT INTO `products_students` (`id`, `product_id`, `user_id`, `clases_checkeds`, `state`, `created_at`, `updated_at`) VALUES
(1, 1, 9, NULL, NULL, '2023-11-04 03:23:04', '2023-11-04 03:23:04'),
(2, 1, 10, NULL, NULL, '2023-11-04 03:28:28', '2023-11-04 03:28:28'),
(3, 2, 10, NULL, NULL, '2023-11-04 03:31:17', '2023-11-04 03:31:17'),
(4, 12, 10, NULL, NULL, '2023-11-04 03:32:48', '2023-11-04 03:32:48'),
(5, 6, 10, NULL, NULL, '2023-11-04 03:36:06', '2023-11-04 03:36:06'),
(6, 2, 12, NULL, NULL, '2023-11-06 18:22:03', '2023-11-06 18:22:03');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `product_classes`
--

CREATE TABLE `product_classes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_section_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(250) NOT NULL,
  `description` longtext NOT NULL,
  `state` tinyint(1) UNSIGNED NOT NULL DEFAULT '1' COMMENT '1 es activo',
  `vimeo_id` varchar(50) DEFAULT NULL,
  `time` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `product_classe_files`
--

CREATE TABLE `product_classe_files` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_clase_id` bigint(20) UNSIGNED NOT NULL,
  `name_file` varchar(250) NOT NULL,
  `size` varchar(50) NOT NULL,
  `time` varchar(50) DEFAULT NULL,
  `resolution` varchar(20) DEFAULT NULL,
  `file` varchar(250) NOT NULL,
  `type` varchar(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reviews`
--

CREATE TABLE `reviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `course_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `sale_detail_id` bigint(20) UNSIGNED NOT NULL,
  `message` text NOT NULL,
  `rating` tinyint(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '1: 1estrella,2 ...',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `reviews`
--

INSERT INTO `reviews` (`id`, `course_id`, `product_id`, `user_id`, `sale_detail_id`, `message`, `rating`, `created_at`, `updated_at`) VALUES
(1, 2, NULL, 12, 38, 'muy Bueno!', 5, '2023-11-06 18:27:27', '2023-11-06 18:27:27'),
(2, 17, NULL, 12, 50, 'donde esta el CD?', 3, '2023-12-25 04:26:33', '2023-12-25 04:26:33'),
(3, 4, NULL, 12, 49, 'bueno, pero le falto algo..', 4, '2023-12-25 04:26:55', '2023-12-25 04:26:55');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reviews_products`
--

CREATE TABLE `reviews_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `sale_detail_id` bigint(20) UNSIGNED NOT NULL,
  `message` text NOT NULL,
  `rating` tinyint(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '1: 1estrella,2 ...',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `reviews_products`
--

INSERT INTO `reviews_products` (`id`, `product_id`, `user_id`, `sale_detail_id`, `message`, `rating`, `created_at`, `updated_at`) VALUES
(1, 2, 12, 38, 'muy Bueno!', 5, '2023-11-06 18:27:27', '2023-11-06 18:27:27');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(200) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'ADMIN', NULL, NULL),
(2, 'CLIENTE', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sales`
--

CREATE TABLE `sales` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `method_payment` varchar(50) NOT NULL,
  `currency_total` varchar(10) NOT NULL,
  `currency_payment` varchar(10) NOT NULL,
  `total` double NOT NULL,
  `status` tinyint(1) DEFAULT '1' COMMENT '1:pendiente, 2:entregado, 3:cancelado',
  `price_dolar` double DEFAULT NULL,
  `n_transaccion` varchar(50) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `sales`
--

INSERT INTO `sales` (`id`, `user_id`, `method_payment`, `currency_total`, `currency_payment`, `total`, `status`, `price_dolar`, `n_transaccion`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 9, 'PAYPAL', 'USD', 'USD', 7, 2, 10, '30N39457WY655144J', '2023-11-04 03:23:04', '2023-12-24 06:18:57', NULL),
(2, 10, 'PAYPAL', 'USD', 'USD', 7, 2, 10, '0FD8503343061135D', '2023-11-04 03:28:28', '2023-12-24 06:19:00', NULL),
(3, 10, 'PAYPAL', 'USD', 'USD', 48.5, 2, 50, '07E92058WP536992A', '2023-11-04 03:31:17', '2023-12-24 01:23:28', NULL),
(4, 10, 'PAYPAL', 'USD', 'USD', 175, 2, 250, '55W270611D7285948', '2023-11-04 03:32:48', '2023-12-24 06:19:06', NULL),
(5, 10, 'PAYPAL', 'USD', 'USD', 65, 2, 65, '08560576WJ789772G', '2023-11-04 03:36:06', '2023-12-24 02:33:05', NULL),
(6, 12, 'PAYPAL', 'USD', 'USD', 35, 3, 50, '50U898426D4381946', '2023-11-06 18:22:03', '2023-12-24 20:04:08', NULL),
(19, 12, 'PAYPAL', 'USD', 'USD', 30, 1, NULL, '5CA47141875928412', '2023-12-24 07:09:47', '2023-12-24 07:09:47', NULL),
(20, 12, 'PAYPAL', 'USD', 'USD', 175, 1, NULL, '1GB27288L4170920L', '2023-12-24 08:04:31', '2023-12-24 08:04:31', NULL),
(22, 12, 'PAYPAL', 'USD', 'USD', 135, 1, NULL, '4AM92977LB769943X', '2023-12-25 05:05:26', '2023-12-25 05:05:26', NULL),
(23, 12, 'PAYPAL', 'USD', 'USD', 6, 1, NULL, '0BP31210KF622405X', '2023-12-25 05:17:03', '2023-12-25 05:17:03', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sale_details`
--

CREATE TABLE `sale_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sale_id` bigint(20) UNSIGNED NOT NULL,
  `course_id` bigint(20) UNSIGNED DEFAULT NULL,
  `product_id` bigint(20) UNSIGNED DEFAULT NULL,
  `type_discount` tinyint(1) UNSIGNED DEFAULT NULL COMMENT '1 es porcentaje y 2 es moneda',
  `discount` double DEFAULT NULL,
  `type_campaing` tinyint(1) DEFAULT NULL,
  `code_cupon` varchar(50) DEFAULT NULL,
  `code_discount` varchar(50) DEFAULT NULL,
  `precio_unitario` double NOT NULL,
  `total` double NOT NULL,
  `tipo_envio` varchar(255) DEFAULT NULL,
  `precio_envio` varchar(255) DEFAULT NULL,
  `tracking_number` varchar(255) DEFAULT NULL,
  `tiempo_estimado` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `sale_details`
--

INSERT INTO `sale_details` (`id`, `sale_id`, `course_id`, `product_id`, `type_discount`, `discount`, `type_campaing`, `code_cupon`, `code_discount`, `precio_unitario`, `total`, `tipo_envio`, `precio_envio`, `tracking_number`, `tiempo_estimado`, `created_at`, `updated_at`, `deleted_at`) VALUES
(33, 1, 1, 0, 1, 30, 3, NULL, '6538526c80b76', 10, 7, NULL, NULL, NULL, NULL, '2023-11-04 03:23:04', '2023-11-04 03:23:04', NULL),
(34, 2, 1, 0, 1, 30, 3, NULL, '6538526c80b76', 10, 7, NULL, NULL, NULL, NULL, '2023-11-04 03:28:28', '2023-11-04 03:28:28', NULL),
(35, 3, 2, 0, 1, 3, 1, NULL, '6539c63ccdbb8', 50, 48.5, NULL, NULL, NULL, NULL, '2023-11-04 03:31:17', '2023-11-04 03:31:17', NULL),
(36, 4, 12, 0, 1, 30, 3, NULL, '6538526c80b76', 250, 175, NULL, NULL, NULL, NULL, '2023-11-04 03:32:48', '2023-11-04 03:32:48', NULL),
(37, 5, 6, 0, NULL, NULL, NULL, NULL, NULL, 65, 65, NULL, NULL, NULL, NULL, '2023-11-04 03:36:06', '2023-11-04 03:36:06', NULL),
(38, 6, 2, 0, 1, 30, 3, NULL, '6538526c80b76', 50, 35, NULL, NULL, NULL, NULL, '2023-11-06 18:22:03', '2023-11-06 18:22:03', NULL),
(39, 11, NULL, 1, NULL, NULL, NULL, NULL, NULL, 10, 10, NULL, NULL, NULL, NULL, '2023-12-24 05:27:31', '2023-12-24 05:27:31', NULL),
(40, 12, NULL, 1, NULL, NULL, NULL, NULL, NULL, 10, 10, NULL, NULL, NULL, NULL, '2023-12-24 05:48:05', '2023-12-24 05:48:05', NULL),
(49, 19, 4, NULL, NULL, NULL, NULL, NULL, NULL, 30, 30, NULL, NULL, NULL, NULL, '2023-12-24 07:09:47', '2023-12-24 07:09:47', NULL),
(50, 20, 17, NULL, NULL, NULL, NULL, NULL, NULL, 175, 175, NULL, NULL, NULL, NULL, '2023-12-24 08:04:31', '2023-12-24 08:04:31', NULL),
(52, 22, NULL, 1, NULL, NULL, NULL, NULL, NULL, 10, 10, NULL, NULL, NULL, NULL, '2023-12-25 05:05:26', '2023-12-25 05:05:26', NULL),
(53, 22, 18, NULL, NULL, NULL, NULL, NULL, NULL, 125, 125, NULL, NULL, NULL, NULL, '2023-12-25 05:05:26', '2023-12-25 05:05:26', NULL),
(54, 23, NULL, 6, NULL, NULL, NULL, NULL, NULL, 6, 6, NULL, NULL, NULL, NULL, '2023-12-25 05:17:03', '2023-12-25 05:17:03', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `subcripcions`
--

CREATE TABLE `subcripcions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `subcripcions`
--

INSERT INTO `subcripcions` (`id`, `email`, `email_verified_at`, `created_at`, `updated_at`) VALUES
(1, 'prueba@gmail.com', NULL, '2023-11-24 20:46:53', '2023-11-24 20:46:53');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `todos`
--

CREATE TABLE `todos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `titulo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('activo','pending','terminado','urgente') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `todos`
--

INSERT INTO `todos` (`id`, `titulo`, `description`, `status`, `created_at`, `updated_at`) VALUES
(5, 'shared en blog', '<p>instalar modulo shared rrss</p>', 'pending', '2023-11-28 03:51:52', '2023-11-28 03:51:52'),
(6, 'aplicar manejo de lenguaje', '<p>lenguaje en store y en admin</p>', 'pending', '2023-11-28 03:57:55', '2023-11-29 03:27:28'),
(7, 'bug actualizar portafolio', '<p>error al actualzar portafolio</p>', 'pending', '2023-11-29 00:30:59', '2023-12-20 08:15:26'),
(8, 'actualizar y detalle tareas', '<p>error al actualzar tareas</p>', 'terminado', '2023-11-29 00:31:48', '2023-11-29 03:07:29'),
(9, 'Ventas', '<p>seccion ventas</p>', 'activo', '2023-11-29 00:32:29', '2023-12-24 02:42:40'),
(10, 'Usuario detalle', '<p>colocar info del usuario en pagina perfil</p>', 'terminado', '2023-11-29 00:33:13', '2023-12-25 03:36:37'),
(11, 'crear categoria blog', '<p>Crear back y. front cat blog</p>', 'pending', '2023-11-29 00:33:57', '2023-11-29 00:33:57'),
(12, 'Progreso curso estudiante', '<p>hacer crud para el manejo del progreso del estudiante</p>', 'urgente', '2023-11-29 00:35:09', '2023-11-29 00:35:09'),
(13, 'mapa en delivery', '<p>mostrar mapa de la bd en un google map o lo que venga</p>', 'activo', '2023-11-29 00:36:07', '2023-11-29 00:36:07'),
(14, 'App delivery', '<p>hacer la version para el delivery</p>', 'urgente', '2023-11-29 00:36:45', '2023-12-24 03:46:00'),
(15, 'agregar modificaciones a productos', '<p>agregar peso, medidas, color a crear producto</p>', 'terminado', '2023-11-29 00:43:08', '2023-12-24 03:21:26'),
(16, 'notif. usuario', '<p>revisar notificaciones, la mayoria dice usuario registrado cuando no lo es</p>', 'pending', '2023-11-29 00:44:15', '2023-11-29 03:07:04'),
(17, 'elementos dashboard', '<p>traer elementos al dashboard</p>', 'activo', '2023-11-29 03:08:13', '2023-11-29 03:08:13'),
(18, 'revisar delivery', '<p>tarda la carga y la actualizacion</p>', 'terminado', '2023-11-29 03:09:49', '2023-12-25 03:36:24'),
(19, 'traer avatar admin', '<p>traer la foto del admin</p>', 'pending', '2023-11-29 03:10:54', '2023-11-29 03:10:54'),
(20, 'app reservas', '<p>app reserva, citas medicas</p>', 'terminado', '2023-11-29 03:14:15', '2023-12-19 20:19:52'),
(21, 'app envio correo', '<p>traer app, envio de correo</p>\r\n\r\n<p>&nbsp;</p>', 'pending', '2023-11-29 03:16:22', '2023-11-29 03:16:22'),
(22, 'mailmarketing', '<p>crear campa&ntilde;a de email:</p>\r\n\r\n<p>email, promo, rrss, etc</p>\r\n\r\n<p>&nbsp;</p>', 'pending', '2023-11-29 03:17:05', '2023-12-24 02:56:31'),
(23, 'boton volver en cursos', '<p>Colocar boton volver en seccion cursos</p>', 'terminado', '2023-11-29 03:23:20', '2023-12-24 02:46:53'),
(24, 'correo detail', '<p>terminar seccion contacto</p>', 'pending', '2023-11-29 03:25:27', '2023-12-24 03:51:43'),
(25, 'prueba', '<p>esto es una prueba</p>', 'terminado', '2023-12-24 02:48:18', '2023-12-24 03:49:01');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `avatar` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `surname` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `isInstructor` tinyint(1) DEFAULT NULL COMMENT 'null: instructor 1 no es instructor',
  `profesion` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `state` tinyint(1) UNSIGNED NOT NULL DEFAULT '1',
  `type_user` tinyint(1) UNSIGNED NOT NULL DEFAULT '1' COMMENT '1 es cliente 2 es admin',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `role_id`, `name`, `email`, `email_verified_at`, `avatar`, `phone`, `surname`, `password`, `isInstructor`, `profesion`, `description`, `state`, `type_user`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 1, 'Malcolm', 'superadmin@superadmin.com', NULL, 'users/XFdWch6JxNUrGKtiNacW5EKkuQ3BKHwTbRAIHrT8.jpg', NULL, 'Cordova', '$2y$10$aIbp/LS3fqchbyLMD6/o/eqjeg1GxZW/..OtnGQ06k5avr4Z1QAra', 1, 'Web Development', 'Diseñador gráfico y web,', 2, 2, NULL, '2023-10-12 18:39:50', '2023-11-19 07:24:26'),
(2, 2, 'prueba', 'prueba@prueba.com', NULL, NULL, NULL, NULL, '$2y$10$L3oNdjw8LBywCq0Ri.0N8e8Yiqf1OF3nCyAfebFIwH9npaOlZzFw.', NULL, NULL, '', 1, 1, NULL, '2023-10-12 21:24:20', '2023-10-12 21:24:20'),
(3, 2, 'prueba', 'prueba1@prueba.com', NULL, NULL, NULL, NULL, '$2y$10$7X7hDDF8W1uNZNB26F4DuuprxO5yn6V6ooRBcY8/so.sHBPDC6ROe', NULL, NULL, '', 1, 1, NULL, '2023-10-12 21:26:58', '2023-10-12 21:26:58'),
(4, 1, 'dsaads', 'dsaads@dsaads.com', NULL, 'users/cPeeboXGP1ok3cgHuzujdjJAnENMdb7kVu5md1tq.png', NULL, 'dsaads', '$2y$10$78n1F/45vTl5k/1Rf435UOTiJVHxkF0HyKN.0eQRqF.5kerfyBNFe', 1, 'RRHH', 'admin', 2, 2, NULL, '2023-10-13 21:13:20', '2023-12-20 06:04:54'),
(5, 1, 'admin', 'admin@admin.com', NULL, 'users/2zHHl3YN93LHRRQ2prCxUJ3qt8N8oEK5mCr4nnrF.jpg', NULL, 'admin', '$2y$10$.3gv43EQr5ozY6ZxflL4.uSfNyNJN584tXlUZf.K4hA8xmFzwkoTy', 1, 'SEO', 'es el admin', 2, 2, NULL, '2023-10-15 20:48:19', '2023-10-25 21:40:56'),
(6, 2, 'invitado', 'invitado@invitado.com', NULL, NULL, NULL, NULL, '$2y$10$z9reK6d/G.V2LMWNN//JuO2sXxr6tgXiLfUFKa0M9yVwa05MJu9TC', NULL, NULL, NULL, 1, 1, NULL, '2023-10-31 01:29:43', '2023-10-31 01:29:43'),
(7, 2, 'prueba', 'pruebaregistro@pruebaregistro.com', NULL, NULL, NULL, NULL, '$2y$10$ZnKnNmcSZlcRYZooKqM84.BmvRa36wkEhLwiW8aNclfyEr4X0AtHq', NULL, NULL, NULL, 1, 1, NULL, '2023-10-31 18:14:32', '2023-10-31 18:14:32'),
(9, 2, 'malc', 'mercadocreativo@hotmail.com', NULL, NULL, NULL, 'Cord', '$2y$10$nxvMQIL9eU3.sLQW4t5pUO8zkM4y.IzCyA7IGwXNJZwMoENPoMwX6', NULL, NULL, NULL, 1, 1, NULL, '2023-11-04 03:21:38', '2023-11-04 03:21:38'),
(12, 2, 'Malcolm', 'mercadocreativo@gmail.com', NULL, 'users/VviwwShJeF7wWIIxJMSFYneK6EL4EeA4zYVicPmR.jpg', '04241874370', 'Cordova', '$2y$10$V3uWMAKtX.xsAbMv7BswFOFEUWQ/HYMC4/M.Hzg8KVRQjzrncOKUy', NULL, 'Dsesarrollador Web', 'creador de este app', 1, 1, NULL, '2023-11-06 18:19:05', '2023-11-23 17:55:54'),
(13, 2, 'pruebacliente', 'pruebacliente@gmail.com', NULL, NULL, NULL, 'pruebacliente', '$2y$10$NoEZvfmRe.ktc.8WN4Xp7eiIiRyUbyJLzisnZ7g3nvb.VT4WPWAe2', NULL, NULL, NULL, 1, 1, NULL, '2023-11-25 00:06:11', '2023-11-25 00:06:11');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `blogs`
--
ALTER TABLE `blogs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `posts_user_id_foreign` (`user_id`),
  ADD KEY `posts_category_id_foreign` (`category_id`);

--
-- Indices de la tabla `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `categoria_ventas`
--
ALTER TABLE `categoria_ventas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `category_products`
--
ALTER TABLE `category_products`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `coupon_categories`
--
ALTER TABLE `coupon_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `coupon_categories_products`
--
ALTER TABLE `coupon_categories_products`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `coupon_courses`
--
ALTER TABLE `coupon_courses`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `coupon_products`
--
ALTER TABLE `coupon_products`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `courses_students`
--
ALTER TABLE `courses_students`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `course_classes`
--
ALTER TABLE `course_classes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `course_classe_files`
--
ALTER TABLE `course_classe_files`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `course_sections`
--
ALTER TABLE `course_sections`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `deliveries`
--
ALTER TABLE `deliveries`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `direccions`
--
ALTER TABLE `direccions`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `discounts`
--
ALTER TABLE `discounts`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `discount_categories`
--
ALTER TABLE `discount_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `discount_categories_products`
--
ALTER TABLE `discount_categories_products`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `discount_courses`
--
ALTER TABLE `discount_courses`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `discount_products`
--
ALTER TABLE `discount_products`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `endesarollos`
--
ALTER TABLE `endesarollos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indices de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indices de la tabla `pickups`
--
ALTER TABLE `pickups`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `portafolios`
--
ALTER TABLE `portafolios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `posts_user_id_foreign` (`user_id`),
  ADD KEY `posts_category_id_foreign` (`category_portafolio_id`);

--
-- Indices de la tabla `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `products_students`
--
ALTER TABLE `products_students`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `product_classes`
--
ALTER TABLE `product_classes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `product_classe_files`
--
ALTER TABLE `product_classe_files`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `reviews_products`
--
ALTER TABLE `reviews_products`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `sale_details`
--
ALTER TABLE `sale_details`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `subcripcions`
--
ALTER TABLE `subcripcions`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `todos`
--
ALTER TABLE `todos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `blogs`
--
ALTER TABLE `blogs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `carts`
--
ALTER TABLE `carts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `categoria_ventas`
--
ALTER TABLE `categoria_ventas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT de la tabla `category_products`
--
ALTER TABLE `category_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT de la tabla `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `coupon_categories`
--
ALTER TABLE `coupon_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `coupon_categories_products`
--
ALTER TABLE `coupon_categories_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `coupon_courses`
--
ALTER TABLE `coupon_courses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `coupon_products`
--
ALTER TABLE `coupon_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `courses`
--
ALTER TABLE `courses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `courses_students`
--
ALTER TABLE `courses_students`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `course_classes`
--
ALTER TABLE `course_classes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=186;

--
-- AUTO_INCREMENT de la tabla `course_classe_files`
--
ALTER TABLE `course_classe_files`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT de la tabla `course_sections`
--
ALTER TABLE `course_sections`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;

--
-- AUTO_INCREMENT de la tabla `deliveries`
--
ALTER TABLE `deliveries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `direccions`
--
ALTER TABLE `direccions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `discounts`
--
ALTER TABLE `discounts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `discount_categories`
--
ALTER TABLE `discount_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `discount_categories_products`
--
ALTER TABLE `discount_categories_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `discount_courses`
--
ALTER TABLE `discount_courses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT de la tabla `discount_products`
--
ALTER TABLE `discount_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT de la tabla `endesarollos`
--
ALTER TABLE `endesarollos`
  MODIFY `id` bigint(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pickups`
--
ALTER TABLE `pickups`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `portafolios`
--
ALTER TABLE `portafolios`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT de la tabla `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `products_students`
--
ALTER TABLE `products_students`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `product_classes`
--
ALTER TABLE `product_classes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `product_classe_files`
--
ALTER TABLE `product_classe_files`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `reviews_products`
--
ALTER TABLE `reviews_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `sales`
--
ALTER TABLE `sales`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT de la tabla `sale_details`
--
ALTER TABLE `sale_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT de la tabla `subcripcions`
--
ALTER TABLE `subcripcions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `todos`
--
ALTER TABLE `todos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
