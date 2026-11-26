import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';

/// Data item navigasi untuk [PvBottomNav].
class PvBottomNavItem {
  const PvBottomNavItem({
    required this.label,
    required this.icon,
    this.activeIcon,
    this.badgeCount = 0,
  });

  final String label;
  final IconData icon;
  final IconData? activeIcon;
  final int badgeCount;
}

/// Bilah navigasi bawah dengan sorotan latar biru lembut pada tab aktif.
class PvBottomNav extends StatelessWidget {
  const PvBottomNav({
    super.key,
    required this.currentIndex,
    required this.onTap,
    this.items = defaultItems,
  });

  static const List<PvBottomNavItem> defaultItems = [
    PvBottomNavItem(
      label: 'Dasbor',
      icon: Icons.home_outlined,
      activeIcon: Icons.home_rounded,
    ),
    PvBottomNavItem(
      label: 'Verifikasi',
      icon: Icons.assignment_outlined,
      activeIcon: Icons.assignment_rounded,
    ),
    PvBottomNavItem(
      label: 'Profil',
      icon: Icons.person_outline_rounded,
      activeIcon: Icons.person_rounded,
    ),
  ];

  final int currentIndex;
  final ValueChanged<int> onTap;
  final List<PvBottomNavItem> items;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.surface,
        border: Border(
          top: BorderSide(color: AppColors.border, width: 1),
        ),
      ),
      child: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          child: Row(
            children: List.generate(items.length, (index) {
              final item = items[index];
              final isActive = index == currentIndex;
              final color =
                  isActive ? AppColors.primary : AppColors.textSecondary;

              return Expanded(
                child: InkWell(
                  onTap: () => onTap(index),
                  borderRadius: BorderRadius.circular(10),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 160),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: isActive
                          ? AppColors.primaryTint
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Icon(
                              isActive
                                  ? (item.activeIcon ?? item.icon)
                                  : item.icon,
                              size: 20,
                              color: color,
                            ),
                            if (item.badgeCount > 0)
                              Positioned(
                                right: -8,
                                top: -4,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 4,
                                    vertical: 1,
                                  ),
                                  decoration: BoxDecoration(
                                    color: AppColors.danger,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Text(
                                    item.badgeCount > 99
                                        ? '99+'
                                        : '${item.badgeCount}',
                                    style: AppTextStyles.caption.copyWith(
                                      color: AppColors.surface,
                                      fontSize: 9,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Text(
                          item.label,
                          style: AppTextStyles.caption.copyWith(
                            color: color,
                            fontWeight:
                                isActive ? FontWeight.w700 : FontWeight.w500,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
