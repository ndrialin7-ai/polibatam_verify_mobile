import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';

/// Kontainer kartu dasar berbingkai tipis sesuai sistem desain.
class PvCard extends StatelessWidget {
  const PvCard({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(14),
    this.backgroundColor = AppColors.surface,
    this.borderColor = AppColors.border,
    this.borderRadius = 12,
    this.onTap,
  });

  final Widget child;
  final EdgeInsetsGeometry padding;
  final Color backgroundColor;
  final Color borderColor;
  final double borderRadius;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final radius = BorderRadius.circular(borderRadius);
    final decoration = BoxDecoration(
      color: backgroundColor,
      borderRadius: radius,
      border: Border.all(color: borderColor, width: 1),
    );

    if (onTap == null) {
      return Container(
        padding: padding,
        decoration: decoration,
        child: child,
      );
    }

    return Material(
      color: Colors.transparent,
      borderRadius: radius,
      child: InkWell(
        onTap: onTap,
        borderRadius: radius,
        child: Ink(
          padding: padding,
          decoration: decoration,
          child: child,
        ),
      ),
    );
  }
}

/// Kartu statistik ringkas pada dasbor (misalnya 128 Total Pendaftar, 24 Menunggu Verifikasi).
class PvStatCard extends StatelessWidget {
  const PvStatCard({
    super.key,
    required this.value,
    required this.label,
    required this.icon,
    this.iconColor = AppColors.textSecondary,
    this.highlighted = false,
    this.onTap,
  });

  final String value;
  final String label;
  final IconData icon;
  final Color iconColor;
  final bool highlighted;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return PvCard(
      onTap: onTap,
      backgroundColor:
          highlighted ? AppColors.primaryTint : AppColors.surface,
      borderColor:
          highlighted ? AppColors.borderStrong : AppColors.border,
      padding: const EdgeInsets.all(14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 18, color: iconColor),
          const SizedBox(height: 10),
          Text(value, style: AppTextStyles.statNumber),
          const SizedBox(height: 2),
          Text(
            label,
            style: AppTextStyles.bodyMuted,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}

/// Pasangan label dan nilai untuk ditampilkan di dalam [PvInfoCard].
class PvKeyValueItem {
  const PvKeyValueItem({
    required this.label,
    required this.value,
    this.valueColor,
  });

  final String label;
  final String value;
  final Color? valueColor;
}

/// Kartu informasi terstruktur dengan judul bagian dan daftar baris key-value.
class PvInfoCard extends StatelessWidget {
  const PvInfoCard({
    super.key,
    this.title,
    this.trailingAction,
    required this.items,
  });

  final String? title;
  final Widget? trailingAction;
  final List<PvKeyValueItem> items;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (title != null || trailingAction != null) ...[
          Row(
            children: [
              if (title != null)
                Expanded(
                  child: Text(title!, style: AppTextStyles.label),
                ),
              ?trailingAction,
            ],
          ),
          const SizedBox(height: 8),
        ],
        PvCard(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(items.length, (index) {
              final item = items[index];
              final isLast = index == items.length - 1;
              return Padding(
                padding: EdgeInsets.only(bottom: isLast ? 0 : 8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 4,
                      child: Text(item.label, style: AppTextStyles.bodyMuted),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      flex: 6,
                      child: Text(
                        item.value,
                        textAlign: TextAlign.right,
                        style: AppTextStyles.body.copyWith(
                          fontWeight: FontWeight.w600,
                          color: item.valueColor ?? AppColors.textPrimary,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }),
          ),
        ),
      ],
    );
  }
}
