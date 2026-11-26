import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/pv_button.dart';
import 'auth_brand_header.dart';

/// Formulir masuk bersama untuk halaman login normal, setelah logout, dan error kredensial.
class AuthLoginForm extends StatefulWidget {
  const AuthLoginForm({
    super.key,
    this.emailController,
    this.passwordController,
    this.initialEmail,
    this.initialPassword,
    this.banner,
    this.hasError = false,
    this.isLoading = false,
    this.onSubmit,
  });

  final TextEditingController? emailController;
  final TextEditingController? passwordController;
  final String? initialEmail;
  final String? initialPassword;
  final Widget? banner;
  final bool hasError;
  final bool isLoading;
  final void Function(String email, String password)? onSubmit;

  @override
  State<AuthLoginForm> createState() => _AuthLoginFormState();
}

class _AuthLoginFormState extends State<AuthLoginForm> {
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  late final bool _ownsEmail;
  late final bool _ownsPassword;
  bool _obscurePassword = true;

  @override
  void initState() {
    super.initState();
    _ownsEmail = widget.emailController == null;
    _ownsPassword = widget.passwordController == null;
    _emailController = widget.emailController ??
        TextEditingController(text: widget.initialEmail);
    _passwordController = widget.passwordController ??
        TextEditingController(text: widget.initialPassword);
  }

  @override
  void dispose() {
    if (_ownsEmail) _emailController.dispose();
    if (_ownsPassword) _passwordController.dispose();
    super.dispose();
  }

  OutlineInputBorder _inputBorder(Color color, {double width = 1.2}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppSpacing.radiusControl),
      borderSide: BorderSide(color: color, width: width),
    );
  }

  InputDecoration _decoration({
    required String hintText,
    Widget? suffixIcon,
  }) {
    final normalColor = widget.hasError ? AppColors.danger : AppColors.border;
    final focusColor =
        widget.hasError ? AppColors.danger : AppColors.accentCyan;

    return InputDecoration(
      hintText: hintText,
      hintStyle: AppTextStyles.bodyMuted,
      filled: true,
      fillColor: AppColors.surface,
      constraints: const BoxConstraints(minHeight: AppSpacing.minInputHeight),
      contentPadding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.space16,
        vertical: AppSpacing.space12,
      ),
      suffixIcon: suffixIcon,
      border: _inputBorder(normalColor),
      enabledBorder: _inputBorder(normalColor, width: widget.hasError ? 1.4 : 1.2),
      focusedBorder: _inputBorder(focusColor, width: 1.5),
    );
  }

  void _handleSubmit() {
    widget.onSubmit?.call(
      _emailController.text.trim(),
      _passwordController.text,
    );
  }

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
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Center(child: AuthBrandHeader()),
                  const SizedBox(height: AppSpacing.space32),
                  if (widget.banner != null) ...[
                    widget.banner!,
                    const SizedBox(height: AppSpacing.space16),
                  ],
                  const Text('Email', style: AppTextStyles.label),
                  const SizedBox(height: AppSpacing.space8),
                  TextField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    style: AppTextStyles.body,
                    decoration: _decoration(hintText: 'Masukkan email'),
                  ),
                  const SizedBox(height: AppSpacing.space16),
                  const Text('Kata Sandi', style: AppTextStyles.label),
                  const SizedBox(height: AppSpacing.space8),
                  TextField(
                    controller: _passwordController,
                    obscureText: _obscurePassword,
                    textInputAction: TextInputAction.done,
                    onSubmitted: (_) => _handleSubmit(),
                    style: AppTextStyles.body,
                    decoration: _decoration(
                      hintText: 'Masukkan kata sandi',
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _obscurePassword = !_obscurePassword;
                          });
                        },
                        icon: Icon(
                          _obscurePassword
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined,
                          size: 18,
                          color: AppColors.textSecondary,
                        ),
                        tooltip: _obscurePassword
                            ? 'Tampilkan kata sandi'
                            : 'Sembunyikan kata sandi',
                      ),
                    ),
                  ),
                  const SizedBox(height: AppSpacing.space24),
                  PvButton(
                    label: 'Masuk',
                    isFullWidth: true,
                    size: PvButtonSize.large,
                    isLoading: widget.isLoading,
                    onPressed: _handleSubmit,
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
