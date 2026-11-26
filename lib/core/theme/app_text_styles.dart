import 'package:flutter/material.dart';

import 'app_colors.dart';

/// 02 · Typography System — Polibatam Verify Mobile.
/// Menggunakan keluarga huruf tunggal `Plus Jakarta Sans` (Regular, Medium, SemiBold, Bold).
abstract final class AppTextStyles {
  static const String fontFamily = 'Plus Jakarta Sans';

  /// Display / angka utama (28 px / 1.2 · Bold) — contoh: "128".
  static const TextStyle display = TextStyle(
    fontFamily: fontFamily,
    fontSize: 28,
    fontWeight: FontWeight.w700,
    color: AppColors.textPrimary,
    height: 1.2,
  );

  /// Alias untuk angka statistik pada kartu dasbor.
  static const TextStyle statNumber = display;

  /// Heading (20 px / 1.3 · Bold) — contoh: "Dashboard Admin".
  static const TextStyle heading = TextStyle(
    fontFamily: fontFamily,
    fontSize: 20,
    fontWeight: FontWeight.w700,
    color: AppColors.textPrimary,
    height: 1.3,
  );

  static const TextStyle headingLarge = heading;

  /// Greeting (18 px / 1.3 · Bold) — contoh: "Halo, Rina Lestari".
  static const TextStyle greeting = TextStyle(
    fontFamily: fontFamily,
    fontSize: 18,
    fontWeight: FontWeight.w700,
    color: AppColors.textPrimary,
    height: 1.3,
  );

  static const TextStyle headingMedium = greeting;

  /// Title (16 px / 1.35 · SemiBold) — contoh: "Tolak Pendaftaran".
  static const TextStyle title = TextStyle(
    fontFamily: fontFamily,
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
    height: 1.35,
  );

  /// Subheading (15 px / 1.4 · SemiBold) — contoh: "Andi Pratama".
  static const TextStyle subheading = TextStyle(
    fontFamily: fontFamily,
    fontSize: 15,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
    height: 1.4,
  );

  /// Body (14 px / 1.5 · Regular).
  static const TextStyle body = TextStyle(
    fontFamily: fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.textPrimary,
    height: 1.5,
  );

  /// Body small (13 px / 1.45 · Regular).
  static const TextStyle bodySmall = TextStyle(
    fontFamily: fontFamily,
    fontSize: 13,
    fontWeight: FontWeight.w400,
    color: AppColors.textPrimary,
    height: 1.45,
  );

  /// Teks keterangan sekunder berbasis [bodySmall].
  static const TextStyle bodyMuted = TextStyle(
    fontFamily: fontFamily,
    fontSize: 13,
    fontWeight: FontWeight.w400,
    color: AppColors.textSecondary,
    height: 1.45,
  );

  /// Label (12 px / 1.4 · Medium) — contoh: "Alasan Penolakan *".
  static const TextStyle label = TextStyle(
    fontFamily: fontFamily,
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: AppColors.textPrimary,
    height: 1.4,
  );

  /// Button (14 px / 1.2 · SemiBold) — contoh: "Simpan Perubahan".
  static const TextStyle button = TextStyle(
    fontFamily: fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w600,
    height: 1.2,
  );

  /// Label compact (12 px / 1.3 · SemiBold) — contoh: "24 pendaftar menunggu verifikasi".
  static const TextStyle labelCompact = TextStyle(
    fontFamily: fontFamily,
    fontSize: 12,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
    height: 1.3,
  );

  /// Caption (12 px / 1.4 · Regular) — teks pendamping, waktu, deskripsi singkat.
  static const TextStyle caption = TextStyle(
    fontFamily: fontFamily,
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: AppColors.textSecondary,
    height: 1.4,
  );

  /// Micro (11 px / 1.3 · Medium) — badge status dan metadata kecil.
  static const TextStyle micro = TextStyle(
    fontFamily: fontFamily,
    fontSize: 11,
    fontWeight: FontWeight.w500,
    color: AppColors.textSecondary,
    height: 1.3,
  );
}
