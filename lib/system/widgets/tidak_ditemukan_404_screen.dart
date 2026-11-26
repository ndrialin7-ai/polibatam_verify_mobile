import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';
import '../../core/theme/app_spacing.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/widgets/pv_button.dart';

/// H2 · 404 — halaman sistem ketika tautan kedaluwarsa atau halaman tidak ditemukan.
class TidakDitemukan404Screen extends StatelessWidget {
  const TidakDitemukan404Screen({
    super.key,
    this.onBackHome,
    this.onRefresh,
  });

  final VoidCallback? onBackHome;
  final VoidCallback? onRefresh;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.space20,
              vertical: AppSpacing.space24,
            ),
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: AppSpacing.contentWidth,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: 112,
                    height: 112,
                    child: CustomPaint(
                      painter: const _DashedCirclePainter(),
                      child: Center(
                        child: Text(
                          '404',
                          style: AppTextStyles.display.copyWith(
                            fontSize: 32,
                            color: AppColors.primary,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: AppSpacing.space24),
                  const Text(
                    'Halaman Tidak Ditemukan',
                    style: AppTextStyles.heading,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: AppSpacing.space8),
                  const Text(
                    'Maaf, tautan yang Anda akses mungkin sudah kedaluwarsa atau halaman tidak tersedia di perangkat verifikator.',
                    style: AppTextStyles.bodyMuted,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: AppSpacing.space24),
                  PvButton(
                    label: 'Kembali Ke Beranda',
                    variant: PvButtonVariant.primary,
                    size: PvButtonSize.large,
                    isFullWidth: true,
                    onPressed:
                        onBackHome ?? () => Navigator.of(context).maybePop(),
                  ),
                  const SizedBox(height: AppSpacing.space12),
                  PvButton(
                    label: 'Segarkan Halaman',
                    variant: PvButtonVariant.secondary,
                    size: PvButtonSize.large,
                    isFullWidth: true,
                    onPressed: onRefresh ?? () {},
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _DashedCirclePainter extends CustomPainter {
  const _DashedCirclePainter();

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = (math.min(size.width, size.height) / 2) - 2;

    final fillPaint = Paint()
      ..color = AppColors.surfaceSubtle
      ..style = PaintingStyle.fill;
    canvas.drawCircle(center, radius, fillPaint);

    final dashPaint = Paint()
      ..color = AppColors.borderStrong
      ..strokeWidth = 1.5
      ..style = PaintingStyle.stroke;

    const dashCount = 36;
    const step = (2 * math.pi) / dashCount;
    const dashSweep = step * 0.55;
    final rect = Rect.fromCircle(center: center, radius: radius);

    for (var i = 0; i < dashCount; i++) {
      canvas.drawArc(rect, i * step, dashSweep, false, dashPaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
