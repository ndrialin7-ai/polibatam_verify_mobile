import 'package:flutter/material.dart';

/// 01 · Color System — Polibatam Verify Mobile.
/// Disusun mengikuti hierarki: Primitive -> Semantic -> Component.
abstract final class AppColors {
  // 01 / Brand & interaksi
  /// Aksi utama (tombol utama, header dasbor, tab aktif).
  static const Color primary = Color(0xFF1D386D);
  static const Color primaryDark = Color(0xFF162A54);

  /// Aksen brand (garis fokus input, aksen header).
  static const Color accentCyan = Color(0xFF52C9E7);

  /// Kartu interaktif / sorotan kartu statistik.
  static const Color interactiveCard = Color(0xFFEEF6FF);
  static const Color primaryTint = interactiveCard;

  /// Latar item navigasi bawah yang sedang aktif.
  static const Color activeNav = Color(0xFFECF3FD);

  // 02 / Netral & permukaan
  /// Teks utama.
  static const Color textPrimary = Color(0xFF162C4D);

  /// Teks sekunder / keterangan pendukung.
  static const Color textSecondary = Color(0xFF64748B);

  /// Latar utama halaman aplikasi.
  static const Color background = Color(0xFFF8F9FD);

  /// Permukaan kartu, sheet, dan input.
  static const Color surface = Color(0xFFFFFFFF);
  static const Color surfaceSubtle = Color(0xFFF7F9FC);

  /// Garis pemisah & batas default kartu/kontainer.
  static const Color divider = Color(0xFFE0E9F0);
  static const Color border = divider;

  /// Batas normal (ikon non-aktif, border sekunder).
  static const Color borderNormal = Color(0xFF92A4B8);
  static const Color textMuted = borderNormal;

  /// Batas lebih tegas (drag handle sheet, kartu tersorot).
  static const Color borderStrong = Color(0xFFB7C8DC);

  /// Latar pratinjau dokumen (KTP, Ijazah, Bukti Transfer).
  static const Color documentPreview = Color(0xFFE2F2FC);
  static const Color accentCyanLight = documentPreview;

  // 03 / Status & feedback
  /// Status Diterima / Lunas — teks & ikon.
  static const Color success = Color(0xFF15803C);

  /// Status Diterima / Lunas — latar.
  static const Color successBg = Color(0xFFEAF9F0);
  static const Color successBorder = Color(0xFFBAE7C8);

  /// Status Menunggu / Tunda — teks & ikon.
  static const Color warning = Color(0xFF92410F);

  /// Status Menunggu / Tunda — latar.
  static const Color warningBg = Color(0xFFFFF5E4);
  static const Color warningBorder = Color(0xFFF2DFCB);

  /// Status Ditolak / Error — teks & ikon.
  static const Color danger = Color(0xFFDB2527);
  static const Color dangerDark = Color(0xFFB91C1C);

  /// Status Ditolak / Error — latar.
  static const Color dangerBg = Color(0xFFFFF2F2);

  /// Error isian / batas status ditolak.
  static const Color errorFill = Color(0xFFFDCACC);
  static const Color dangerBorder = errorFill;

  /// Batas aksen lembut untuk elemen informasional.
  static const Color accentBorder = Color(0xFFD5E2F4);
}
