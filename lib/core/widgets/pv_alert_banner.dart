import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';

/// Jenis semantik banner notifikasi / peringatan untuk [PvAlertBanner].
enum PvAlertType {
  warning,
  error,
  success,
  info,
}

class _AlertPalette {
  const _AlertPalette({
    required this.background,
    required this.border,
    required this.foreground,
    required this.defaultIcon,
  });

  final Color background;
  final Color border;
  final Color foreground;
  final IconData defaultIcon;
}

const Map<PvAlertType, _AlertPalette> _alertPalettes = {
  PvAlertType.warning: _AlertPalette(
    background: AppColors.warningBg,
    border: AppColors.warningBorder,
    foreground: AppColors.warning,
    defaultIcon: Icons.schedule_rounded,
  ),
  PvAlertType.error: _AlertPalette(
    background: AppColors.dangerBg,
    border: AppColors.dangerBorder,
    foreground: AppColors.danger,
    defaultIcon: Icons.error_outline_rounded,
  ),
  PvAlertType.success: _AlertPalette(
    background: AppColors.successBg,
    border: AppColors.successBorder,
    foreground: AppColors.success,
    defaultIcon: Icons.check_circle_outline_rounded,
  ),
  PvAlertType.info: _AlertPalette(
    background: AppColors.primaryTint,
    border: AppColors.borderStrong,
    foreground: AppColors.primary,
    defaultIcon: Icons.info_outline_rounded,
  ),
};

/// Banner peringatan/status (kuning menunggu, merah ditolak/error, hijau tersimpan, biru info).
class PvAlertBanner extends StatelessWidget {
  const PvAlertBanner({
    super.key,
    required this.message,
    this.title,
    this.type = PvAlertType.info,
    this.icon,
    this.showIcon = true,
    this.trailing,
    this.onTap,
  });

  final String message;
  final String? title;
  final PvAlertType type;
  final IconData? icon;
  final bool showIcon;
  final Widget? trailing;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final palette = _alertPalettes[type]!;
    final radius = BorderRadius.circular(10);

    final content = Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: palette.background,
        borderRadius: radius,
        border: Border.all(color: palette.border, width: 1),
      ),
      child: Row(
        crossAxisAlignment: title != null
            ? CrossAxisAlignment.start
            : CrossAxisAlignment.center,
        children: [
          if (showIcon) ...[
            Padding(
              padding: EdgeInsets.only(top: title != null ? 1 : 0),
              child: Icon(
                icon ?? palette.defaultIcon,
                size: 17,
                color: palette.foreground,
              ),
            ),
            const SizedBox(width: 8),
          ],
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                if (title != null && title!.isNotEmpty) ...[
                  Text(
                    title!,
                    style: AppTextStyles.label.copyWith(
                      color: palette.foreground,
                    ),
                  ),
                  const SizedBox(height: 2),
                ],
                Text(
                  message,
                  style: AppTextStyles.caption.copyWith(
                    color: palette.foreground,
                    fontWeight:
                        title != null ? FontWeight.w400 : FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          if (trailing != null) ...[
            const SizedBox(width: 8),
            trailing!,
          ],
        ],
      ),
    );

    if (onTap == null) {
      return content;
    }

    return InkWell(
      onTap: onTap,
      borderRadius: radius,
      child: content,
    );
  }
}
