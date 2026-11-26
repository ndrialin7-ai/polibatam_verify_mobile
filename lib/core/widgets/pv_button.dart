import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';

/// Varian tampilan tombol utama Polibatam Verify.
enum PvButtonVariant {
  primary,
  danger,
  warning,
  secondary,
}

/// Ukuran tombol [PvButton].
enum PvButtonSize {
  small,
  medium,
  large,
}

class _ButtonStyleSpec {
  const _ButtonStyleSpec({
    required this.background,
    required this.foreground,
    this.borderColor,
  });

  final Color background;
  final Color foreground;
  final Color? borderColor;
}

const Map<PvButtonVariant, _ButtonStyleSpec> _buttonSpecs = {
  PvButtonVariant.primary: _ButtonStyleSpec(
    background: AppColors.primary,
    foreground: AppColors.surface,
  ),
  PvButtonVariant.danger: _ButtonStyleSpec(
    background: AppColors.dangerBg,
    foreground: AppColors.danger,
    borderColor: AppColors.dangerBorder,
  ),
  PvButtonVariant.warning: _ButtonStyleSpec(
    background: AppColors.warningBg,
    foreground: AppColors.warning,
    borderColor: AppColors.warningBorder,
  ),
  PvButtonVariant.secondary: _ButtonStyleSpec(
    background: AppColors.surface,
    foreground: AppColors.textPrimary,
    borderColor: AppColors.border,
  ),
};

/// Tombol standar dengan varian primary (navy), danger (tolak), warning (tunda), dan secondary (batal).
class PvButton extends StatelessWidget {
  const PvButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.variant = PvButtonVariant.primary,
    this.size = PvButtonSize.medium,
    this.icon,
    this.isLoading = false,
    this.isFullWidth = false,
  });

  final String label;
  final VoidCallback? onPressed;
  final PvButtonVariant variant;
  final PvButtonSize size;
  final IconData? icon;
  final bool isLoading;
  final bool isFullWidth;

  EdgeInsets get _padding => switch (size) {
        PvButtonSize.small =>
          const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        PvButtonSize.medium =>
          const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        PvButtonSize.large =>
          const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      };

  double get _minHeight => switch (size) {
        PvButtonSize.small => 36,
        PvButtonSize.medium => 44,
        PvButtonSize.large => 48,
      };

  @override
  Widget build(BuildContext context) {
    final spec = _buttonSpecs[variant]!;
    final effectiveOnPressed = isLoading ? null : onPressed;

    final button = ElevatedButton(
      onPressed: effectiveOnPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: spec.background,
        foregroundColor: spec.foreground,
        disabledBackgroundColor: spec.background.withValues(alpha: 0.55),
        disabledForegroundColor: spec.foreground.withValues(alpha: 0.65),
        elevation: 0,
        shadowColor: Colors.transparent,
        padding: _padding,
        minimumSize: Size(isFullWidth ? double.infinity : 0, _minHeight),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: spec.borderColor != null
              ? BorderSide(color: spec.borderColor!, width: 1)
              : BorderSide.none,
        ),
      ),
      child: isLoading
          ? SizedBox(
              width: 18,
              height: 18,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                color: spec.foreground,
              ),
            )
          : Row(
              mainAxisSize:
                  isFullWidth ? MainAxisSize.max : MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (icon != null) ...[
                  Icon(icon, size: 17, color: spec.foreground),
                  const SizedBox(width: 8),
                ],
                Flexible(
                  child: Text(
                    label,
                    style: AppTextStyles.button.copyWith(
                      color: spec.foreground,
                      fontSize: size == PvButtonSize.small ? 12 : 13,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
    );

    if (isFullWidth) {
      return SizedBox(width: double.infinity, child: button);
    }
    return button;
  }
}
