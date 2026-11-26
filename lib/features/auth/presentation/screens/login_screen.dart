// HM-02
import 'package:flutter/material.dart';

import '../../../../core/widgets/pv_alert_banner.dart';
import '../widgets/auth_login_form.dart';

/// L1, L2 & L4 · Halaman Login (normal, terisi, maupun setelah logout).
class LoginScreen extends StatelessWidget {
  const LoginScreen({
    super.key,
    this.emailController,
    this.passwordController,
    this.initialEmail,
    this.initialPassword,
    this.showLogoutBanner = false,
    this.logoutMessage =
        'Anda telah keluar. Silakan masuk kembali untuk mengakses data peserta.',
    this.isLoading = false,
    this.onSubmit,
  });

  final TextEditingController? emailController;
  final TextEditingController? passwordController;
  final String? initialEmail;
  final String? initialPassword;
  final bool showLogoutBanner;
  final String logoutMessage;
  final bool isLoading;
  final void Function(String email, String password)? onSubmit;

  @override
  Widget build(BuildContext context) {
    return AuthLoginForm(
      emailController: emailController,
      passwordController: passwordController,
      initialEmail: initialEmail,
      initialPassword: initialPassword,
      isLoading: isLoading,
      onSubmit: onSubmit,
      banner: showLogoutBanner
          ? PvAlertBanner(
              message: logoutMessage,
              type: PvAlertType.info,
              showIcon: false,
            )
          : null,
    );
  }
}
