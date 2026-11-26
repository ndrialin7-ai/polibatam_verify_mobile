// HM-07
import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/pv_button.dart';

/// R6 · Dialog Konfirmasi Logout untuk mengakhiri sesi verifikator.
class LogoutDialog extends StatelessWidget {
  const LogoutDialog({
    super.key,
    this.onCancel,
    this.onConfirmLogout,
  });

  final VoidCallback? onCancel;
  final VoidCallback? onConfirmLogout;

  /// Menampilkan dialog konfirmasi keluar dan mengembalikan `true` jika user memilih Logout.
  static Future<bool?> show(BuildContext context) {
    return showDialog<bool>(
      context: context,
      barrierColor: AppColors.textPrimary.withValues(alpha: 0.45),
      builder: (context) => LogoutDialog(
        onCancel: () => Navigator.of(context).pop(false),
        onConfirmLogout: () => Navigator.of(context).pop(true),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.surface,
      surfaceTintColor: Colors.transparent,
      insetPadding: const EdgeInsets.symmetric(horizontal: AppSpacing.space24),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSpacing.radiusCard),
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.space20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Keluar dari akun?',
              style: AppTextStyles.title,
            ),
            const SizedBox(height: AppSpacing.space8),
            const Text(
              'Sesi akan diakhiri. Data peserta tidak dapat diakses sampai Anda masuk kembali.',
              style: AppTextStyles.bodyMuted,
            ),
            const SizedBox(height: AppSpacing.space20),
            Row(
              children: [
                Expanded(
                  child: PvButton(
                    label: 'Batal',
                    variant: PvButtonVariant.secondary,
                    onPressed:
                        onCancel ?? () => Navigator.of(context).pop(false),
                  ),
                ),
                const SizedBox(width: AppSpacing.space12),
                Expanded(
                  child: PvButton(
                    label: 'Logout',
                    variant: PvButtonVariant.danger,
                    onPressed: onConfirmLogout ??
                        () => Navigator.of(context).pop(true),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
