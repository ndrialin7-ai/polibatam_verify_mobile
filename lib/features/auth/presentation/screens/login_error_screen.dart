// HM-03
import 'package:flutter/material.dart';

import '../../../../core/widgets/pv_alert_banner.dart';
import '../widgets/auth_login_form.dart';

/// L3 · Halaman Login saat terjadi kesalahan kredensial atau percobaan gagal.
class LoginErrorScreen extends StatelessWidget {
  const LoginErrorScreen({
    super.key,
    this.emailController,
    this.passwordController,
    this.initialEmail,
    this.initialPassword,
    this.errorMessage =
        'Email atau kata sandi salah. Sisa 2 percobaan — setelah 5 kali gagal, akun dikunci 15 menit.',
    this.isLoading = false,
    this.onSubmit,
  });

  final TextEditingController? emailController;
  final TextEditingController? passwordController;
  final String? initialEmail;
  final String? initialPassword;
  final String errorMessage;
  final bool isLoading;
  final void Function(String email, String password)? onSubmit;

  @override
  Widget build(BuildContext context) {
    return AuthLoginForm(
      emailController: emailController,
      passwordController: passwordController,
      initialEmail: initialEmail,
      initialPassword: initialPassword,
      hasError: true,
      isLoading: isLoading,
      onSubmit: onSubmit,
      banner: PvAlertBanner(
        message: errorMessage,
        type: PvAlertType.error,
        showIcon: false,
      ),
    );
  }
}
