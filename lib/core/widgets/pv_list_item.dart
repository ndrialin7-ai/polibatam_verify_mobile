import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';
import 'pv_badge.dart';
import 'pv_card.dart';

/// Item daftar pendaftar/tagihan berbentuk kartu berbingkai dengan badge dan panah kanan.
class PvListItem extends StatelessWidget {
  const PvListItem({
    super.key,
    required this.title,
    required this.subtitle,
    this.meta,
    this.leading,
    this.badge,
    this.showChevron = true,
    this.onTap,
  });

  final String title;
  final String subtitle;
  final String? meta;
  final Widget? leading;
  final PvBadge? badge;
  final bool showChevron;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return PvCard(
      onTap: onTap,
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      child: Row(
        children: [
          if (leading != null) ...[
            leading!,
            const SizedBox(width: 12),
          ],
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  style: AppTextStyles.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 3),
                Text(
                  subtitle,
                  style: AppTextStyles.bodyMuted,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                if (meta != null && meta!.isNotEmpty) ...[
                  const SizedBox(height: 2),
                  Text(
                    meta!,
                    style: AppTextStyles.caption,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ],
            ),
          ),
          if (badge != null || showChevron) const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              if (badge != null) badge!,
              if (badge != null && showChevron) const SizedBox(height: 6),
              if (showChevron)
                const Icon(
                  Icons.chevron_right_rounded,
                  size: 18,
                  color: AppColors.textSecondary,
                ),
            ],
          ),
        ],
      ),
    );
  }
}
