// HM-06
import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/pv_app_bar.dart';

/// R2 · Profil Akun — menampilkan informasi akun verifikator secara read-only.
class ProfilScreen extends StatelessWidget {
  const ProfilScreen({
    super.key,
    this.nama = 'Rina Lestari',
    this.akun = 'rina.lestari',
    this.peran = 'Admin SILAU',
    this.unit = 'Pusat Informasi',
    this.footerNote =
        'Data akun hanya dapat dilihat. Perubahan profil dikelola Super Admin; ubah kata sandi dilakukan melalui aplikasi web.',
    this.onBackPressed,
  });

  final String nama;
  final String akun;
  final String peran;
  final String unit;
  final String footerNote;
  final VoidCallback? onBackPressed;

  @override
  Widget build(BuildContext context) {
    final fields = [
      (label: 'Nama', value: nama),
      (label: 'Akun', value: akun),
      (label: 'Peran', value: peran),
      (label: 'Unit', value: unit),
    ];

    return Scaffold(
      backgroundColor: AppColors.surface,
      appBar: PvAppBar(
        title: 'Profil Akun',
        onBackPressed: onBackPressed,
      ),
      body: SafeArea(
        top: false,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(AppSpacing.space20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              for (final field in fields) ...[
                _ReadOnlyProfileField(
                  label: field.label,
                  value: field.value,
                ),
                const SizedBox(height: AppSpacing.space16),
              ],
              const SizedBox(height: AppSpacing.space4),
              Text(
                footerNote,
                style: AppTextStyles.caption,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ReadOnlyProfileField extends StatelessWidget {
  const _ReadOnlyProfileField({
    required this.label,
    required this.value,
  });

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(label, style: AppTextStyles.label),
        const SizedBox(height: AppSpacing.space8),
        Container(
          width: double.infinity,
          constraints: const BoxConstraints(minHeight: AppSpacing.minInputHeight),
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.space16,
            vertical: AppSpacing.space12,
          ),
          decoration: BoxDecoration(
            color: AppColors.surfaceSubtle,
            borderRadius: BorderRadius.circular(AppSpacing.radiusControl),
            border: Border.all(color: AppColors.divider, width: 1),
          ),
          alignment: Alignment.centerLeft,
          child: Text(
            value,
            style: AppTextStyles.body.copyWith(color: AppColors.textPrimary),
          ),
        ),
      ],
    );
  }
}
