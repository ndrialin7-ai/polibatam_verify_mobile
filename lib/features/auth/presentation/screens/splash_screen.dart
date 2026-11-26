// HM-01
import 'dart:async';

import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../widgets/auth_brand_header.dart';

/// H1 · Splash Screen — halaman pembuka aplikasi Polibatam Verify.
class SplashScreen extends StatefulWidget {
  const SplashScreen({
    super.key,
    this.onInitialized,
    this.delay = const Duration(seconds: 2),
    this.versionLabel = 'Versi 1.0.0 · Polibatam',
  });

  final VoidCallback? onInitialized;
  final Duration delay;
  final String versionLabel;

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    if (widget.onInitialized != null) {
      _timer = Timer(widget.delay, () {
        if (mounted) {
          widget.onInitialized?.call();
        }
      });
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      body: SafeArea(
        child: Padding(
          padding: AppSpacing.screenPadding,
          child: Column(
            children: [
              const Spacer(),
              const Center(child: AuthBrandHeader()),
              const Spacer(),
              const SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(
                  strokeWidth: 2.5,
                  color: AppColors.accentCyan,
                ),
              ),
              const SizedBox(height: AppSpacing.space12),
              Text(
                widget.versionLabel,
                style: AppTextStyles.micro,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: AppSpacing.space32),
            ],
          ),
        ),
      ),
    );
  }
}
