import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';

/// Varian semantik untuk [PvBadge].
enum PvBadgeVariant {
  pending,
  approved,
  rejected,
  info,
  neutral,
}

class _BadgePalette {
  const _BadgePalette({
    required this.background,
    required this.border,
    required this.foreground,
  });

  final Color background;
  final Color border;
  final Color foreground;
}

const Map<PvBadgeVariant, _BadgePalette> _badgePalettes = {
  PvBadgeVariant.pending: _BadgePalette(
    background: AppColors.warningBg,
    border: AppColors.warningBorder,
    foreground: AppColors.warning,
  ),
  PvBadgeVariant.approved: _BadgePalette(
    background: AppColors.successBg,
    border: AppColors.successBorder,
    foreground: AppColors.success,
  ),
  PvBadgeVariant.rejected: _BadgePalette(
    background: AppColors.dangerBg,
    border: AppColors.dangerBorder,
    foreground: AppColors.danger,
  ),
  PvBadgeVariant.info: _BadgePalette(
    background: AppColors.primaryTint,
    border: AppColors.borderStrong,
    foreground: AppColors.primary,
  ),
  PvBadgeVariant.neutral: _BadgePalette(
    background: AppColors.surfaceSubtle,
    border: AppColors.border,
    foreground: AppColors.textSecondary,
  ),
};

/// Label status pill seperti Menunggu, Diterima, Lunas, dan Ditolak.
class PvBadge extends StatelessWidget {
  const PvBadge({
    super.key,
    required this.label,
    this.variant = PvBadgeVariant.neutral,
    this.icon,
    this.compact = false,
  });

  final String label;
  final PvBadgeVariant variant;
  final IconData? icon;
  final bool compact;

  @override
  Widget build(BuildContext context) {
    final palette = _badgePalettes[variant]!;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: compact ? 8 : 10,
        vertical: compact ? 3 : 5,
      ),
      decoration: BoxDecoration(
        color: palette.background,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: palette.border, width: 1),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(icon, size: compact ? 12 : 14, color: palette.foreground),
            const SizedBox(width: 4),
          ],
          Text(
            label,
            style: AppTextStyles.caption.copyWith(
              color: palette.foreground,
              fontWeight: FontWeight.w600,
              fontSize: compact ? 11 : 12,
            ),
          ),
        ],
      ),
    );
  }
}

/// Chip filter dropdown ringkas (misalnya "Semua v").
class PvFilterChip extends StatelessWidget {
  const PvFilterChip({
    super.key,
    required this.label,
    required this.onTap,
    this.selected = false,
    this.trailingIcon = Icons.keyboard_arrow_down_rounded,
  });

  final String label;
  final VoidCallback onTap;
  final bool selected;
  final IconData? trailingIcon;

  @override
  Widget build(BuildContext context) {
    final borderColor = selected ? AppColors.primary : AppColors.border;
    final bgColor = selected ? AppColors.primaryTint : AppColors.surface;
    final fgColor = selected ? AppColors.primary : AppColors.textPrimary;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: borderColor, width: 1),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              label,
              style: AppTextStyles.caption.copyWith(
                color: fgColor,
                fontWeight: FontWeight.w600,
              ),
            ),
            if (trailingIcon != null) ...[
              const SizedBox(width: 4),
              Icon(trailingIcon, size: 16, color: fgColor),
            ],
          ],
        ),
      ),
    );
  }
}
