import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_text_styles.dart';

/// Header logo Polibatam Verify dan tagline aplikasi untuk halaman autentikasi.
class AuthBrandHeader extends StatelessWidget {
  const AuthBrandHeader({
    super.key,
    this.tagline = 'Sistem Verifikasi Berkas & Pembayaran\nMicrocredential',
  });

  final String tagline;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              width: 38,
              height: 30,
              child: CustomPaint(painter: _PolibatamCheckPainter()),
            ),
            const SizedBox(width: AppSpacing.space8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                RichText(
                  text: TextSpan(
                    style: AppTextStyles.heading.copyWith(
                      fontSize: 22,
                      height: 1.05,
                      letterSpacing: -0.3,
                    ),
                    children: const [
                      TextSpan(
                        text: 'poli',
                        style: TextStyle(color: AppColors.primary),
                      ),
                      TextSpan(
                        text: 'batam',
                        style: TextStyle(color: AppColors.accentCyan),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 1),
                Text(
                  'Verify',
                  style: AppTextStyles.micro.copyWith(
                    color: AppColors.textSecondary,
                    fontWeight: FontWeight.w600,
                    height: 1.1,
                  ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: AppSpacing.space12),
        Text(
          tagline,
          textAlign: TextAlign.center,
          style: AppTextStyles.caption,
        ),
      ],
    );
  }
}

class _PolibatamCheckPainter extends CustomPainter {
  const _PolibatamCheckPainter();

  @override
  void paint(Canvas canvas, Size size) {
    final leftPaint = Paint()
      ..color = AppColors.primary
      ..strokeWidth = 7.5
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    final rightPaint = Paint()
      ..color = AppColors.accentCyan
      ..strokeWidth = 7.5
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    final pivot = Offset(size.width * 0.42, size.height * 0.80);
    canvas.drawLine(
      Offset(size.width * 0.14, size.height * 0.42),
      pivot,
      leftPaint,
    );
    canvas.drawLine(
      pivot,
      Offset(size.width * 0.86, size.height * 0.18),
      rightPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
