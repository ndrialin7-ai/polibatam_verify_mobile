import 'package:flutter/material.dart';

/// 03 · Spacing & Grid System — Polibatam Verify Mobile.
/// Berbasis kelipatan 4 px untuk menjaga konsistensi tata letak mobile.
abstract final class AppSpacing {
  // 01 / Skala spacing
  /// 4 px — jarak ikon dengan label kecil.
  static const double space4 = 4;

  /// 8 px — jarak elemen terkait / internal kecil.
  static const double space8 = 8;

  /// 12 px — jarak antar kartu / gutter kolom & baris.
  static const double space12 = 12;

  /// 16 px — padding internal komponen & jarak antar blok kecil.
  static const double space16 = 16;

  /// 20 px — margin horizontal layar mobile (kiri & kanan).
  static const double space20 = 20;

  /// 24 px — jarak antar bagian konten utama.
  static const double space24 = 24;

  /// 32 px — jarak pemisah antar section besar.
  static const double space32 = 32;

  /// 40 px — jarak atas/bawah area kosong atau modal.
  static const double space40 = 40;

  /// 48 px — tinggi area sentuh minimal kontrol interaktif.
  static const double space48 = 48;

  /// 64 px — jarak ruang lega halaman (splash / empty state).
  static const double space64 = 64;

  // 02 / Grid mobile (390 - 40 = 350 px)
  static const double mobileViewportWidth = 390;
  static const double screenMargin = space20;
  static const double contentWidth = 350;
  static const int gridColumns = 4;
  static const double cardGutter = space12;
  static const double statCardWidth = 169;

  static const EdgeInsets screenPadding = EdgeInsets.symmetric(
    horizontal: screenMargin,
  );

  // 03 / Radius & ukuran kontrol
  /// 6 px — radius untuk badge status.
  static const double radiusBadge = 6;

  /// 8 px — radius untuk tombol dan kolom input.
  static const double radiusControl = 8;

  /// 12 px — radius untuk kartu dan dialog.
  static const double radiusCard = 12;

  /// 16 px — radius sudut atas bottom sheet.
  static const double radiusBottomSheet = 16;

  /// Ukuran area sentuh minimal untuk tombol & kontrol (48 px).
  static const double minTouchTarget = 48;

  /// Tinggi minimal input teks (44 px).
  static const double minInputHeight = 44;
}
