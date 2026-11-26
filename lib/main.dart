import 'package:flutter/material.dart';

import 'core/theme/app_colors.dart';
import 'core/theme/app_spacing.dart';
import 'core/theme/app_text_styles.dart';
import 'core/theme/app_theme.dart';
import 'core/widgets/pv_alert_banner.dart';
import 'core/widgets/pv_app_bar.dart';
import 'core/widgets/pv_badge.dart';
import 'core/widgets/pv_bottom_nav.dart';
import 'core/widgets/pv_bottom_sheet.dart';
import 'core/widgets/pv_button.dart';
import 'core/widgets/pv_card.dart';
import 'core/widgets/pv_empty_state.dart';
import 'core/widgets/pv_list_item.dart';
import 'core/widgets/pv_search_field.dart';
import 'features/auth/presentation/screens/login_error_screen.dart';
import 'features/auth/presentation/screens/login_screen.dart';
import 'features/auth/presentation/screens/logout_dialog.dart';
import 'features/auth/presentation/screens/splash_screen.dart';
import 'features/profil/presentation/screens/profil_screen.dart';
import 'system/widgets/tidak_ditemukan_404_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Polibatam Verify',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      home: const _PreviewLauncherScreen(),
    );
  }
}

class _PreviewLauncherScreen extends StatelessWidget {
  const _PreviewLauncherScreen();

  void _open(BuildContext context, Widget page) {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) => page));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PvAppBar(
        title: 'Preview Polibatam Verify',
        subtitle: 'Auth Screens, Theme & Core Widgets',
        showBackButton: false,
      ),
      body: ListView(
        padding: const EdgeInsets.all(AppSpacing.space20),
        children: [
          const PvGreetingHeader(
            greeting: 'Preview UI Polibatam Verify',
            subtitle: 'Pilih halaman atau galeri komponen di bawah ini',
          ),
          const SizedBox(height: AppSpacing.space20),
          const Text('Halaman Auth (lib/features/auth)', style: AppTextStyles.label),
          const SizedBox(height: AppSpacing.space8),
          PvListItem(
            title: 'H1 · Splash Screen',
            subtitle: 'splash_screen.dart (HM-01)',
            badge: const PvBadge(label: 'HM-01', variant: PvBadgeVariant.info, compact: true),
            onTap: () => _open(context, const SplashScreen()),
          ),
          const SizedBox(height: AppSpacing.space8),
          PvListItem(
            title: 'L1 · Login (Kosong)',
            subtitle: 'login_screen.dart (HM-02)',
            badge: const PvBadge(label: 'HM-02', variant: PvBadgeVariant.info, compact: true),
            onTap: () => _open(context, const LoginScreen()),
          ),
          const SizedBox(height: AppSpacing.space8),
          PvListItem(
            title: 'L2 · Login (Terisi)',
            subtitle: 'login_screen.dart dengan email & sandi terisi',
            badge: const PvBadge(label: 'HM-02', variant: PvBadgeVariant.info, compact: true),
            onTap: () => _open(
              context,
              const LoginScreen(
                initialEmail: 'rina.lestari@polibatam.ac.id',
                initialPassword: 'password123',
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.space8),
          PvListItem(
            title: 'L3 · Login · Kredensial Salah',
            subtitle: 'login_error_screen.dart (HM-03)',
            badge: const PvBadge(label: 'HM-03', variant: PvBadgeVariant.rejected, compact: true),
            onTap: () => _open(
              context,
              const LoginErrorScreen(initialPassword: 'salah123'),
            ),
          ),
          const SizedBox(height: AppSpacing.space8),
          PvListItem(
            title: 'L4 · Setelah Logout',
            subtitle: 'login_screen.dart dengan banner info logout',
            badge: const PvBadge(label: 'HM-02', variant: PvBadgeVariant.info, compact: true),
            onTap: () => _open(
              context,
              const LoginScreen(showLogoutBanner: true),
            ),
          ),
          const SizedBox(height: AppSpacing.space8),
          PvListItem(
            title: 'R6 · Konfirmasi Logout',
            subtitle: 'logout_dialog.dart (HM-07)',
            badge: const PvBadge(label: 'HM-07', variant: PvBadgeVariant.pending, compact: true),
            onTap: () => LogoutDialog.show(context),
          ),
          const SizedBox(height: AppSpacing.space24),
          const Text('Komponen & Tema (lib/core)', style: AppTextStyles.label),
          const SizedBox(height: AppSpacing.space8),
          PvListItem(
            title: 'Galeri Core Widgets',
            subtitle: 'AppBar, BottomNav, Badge, Button, Card, Banner, Sheet',
            badge: const PvBadge(label: '10 Widget', variant: PvBadgeVariant.approved, compact: true),
            onTap: () => _open(context, const _WidgetGalleryScreen()),
          ),
        ],
      ),
    );
  }
}

class _WidgetGalleryScreen extends StatefulWidget {
  const _WidgetGalleryScreen();

  @override
  State<_WidgetGalleryScreen> createState() => _WidgetGalleryScreenState();
}

class _WidgetGalleryScreenState extends State<_WidgetGalleryScreen> {
  int _navIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PvAppBar(
        title: 'Galeri Core Widgets',
        subtitle: 'lib/core/widgets & lib/core/theme',
      ),
      bottomNavigationBar: PvBottomNav(
        currentIndex: _navIndex,
        onTap: (index) => setState(() => _navIndex = index),
      ),
      body: ListView(
        padding: const EdgeInsets.all(AppSpacing.space20),
        children: [
          const PvAlertBanner(
            title: '24 pendaftar menunggu verifikasi',
            message: 'Segera lakukan verifikasi',
            type: PvAlertType.warning,
          ),
          const SizedBox(height: AppSpacing.space12),
          const PvAlertBanner(
            message: 'Verifikasi tersimpan — Registrasi Selesai',
            type: PvAlertType.success,
          ),
          const SizedBox(height: AppSpacing.space16),
          const PvSearchField(),
          const SizedBox(height: AppSpacing.space16),
          const Row(
            children: [
              Expanded(
                child: PvStatCard(
                  value: '128',
                  label: 'Total Pendaftar',
                  icon: Icons.description_outlined,
                ),
              ),
              SizedBox(width: AppSpacing.space12),
              Expanded(
                child: PvStatCard(
                  value: '24',
                  label: 'Menunggu Verifikasi',
                  icon: Icons.schedule_rounded,
                  iconColor: AppColors.primary,
                  highlighted: true,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.space16),
          const Wrap(
            spacing: AppSpacing.space8,
            runSpacing: AppSpacing.space8,
            children: [
              PvBadge(label: 'Menunggu', variant: PvBadgeVariant.pending),
              PvBadge(label: 'Diterima', variant: PvBadgeVariant.approved, icon: Icons.check_rounded),
              PvBadge(label: 'Ditolak', variant: PvBadgeVariant.rejected),
              PvBadge(label: 'Info', variant: PvBadgeVariant.info),
            ],
          ),
          const SizedBox(height: AppSpacing.space16),
          Row(
            children: [
              Expanded(
                child: PvButton(
                  label: 'Tolak',
                  variant: PvButtonVariant.danger,
                  onPressed: () {
                    PvBottomSheet.show<void>(
                      context,
                      title: 'Tolak Pendaftaran',
                      subtitle: 'Contoh modal PvBottomSheet',
                      child: const Text(
                        'Pilih alasan penolakan atau tambahkan catatan untuk pendaftar.',
                        style: AppTextStyles.bodySmall,
                      ),
                      actions: [
                        PvButton(
                          label: 'Batal',
                          variant: PvButtonVariant.secondary,
                          onPressed: () => Navigator.of(context).pop(),
                        ),
                        PvButton(
                          label: 'Tolak Berkas',
                          variant: PvButtonVariant.danger,
                          onPressed: () => Navigator.of(context).pop(),
                        ),
                      ],
                    );
                  },
                ),
              ),
              const SizedBox(width: AppSpacing.space8),
              Expanded(
                child: PvButton(
                  label: 'Tunda',
                  variant: PvButtonVariant.warning,
                  onPressed: () {},
                ),
              ),
              const SizedBox(width: AppSpacing.space8),
              Expanded(
                child: PvButton(
                  label: 'Terima',
                  variant: PvButtonVariant.primary,
                  onPressed: () {},
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.space16),
          const PvInfoCard(
            title: 'Data Peserta',
            items: [
              PvKeyValueItem(label: 'Nama Lengkap', value: 'Andi Pratama'),
              PvKeyValueItem(label: 'NIK', value: '2171040001'),
              PvKeyValueItem(label: 'Program', value: 'D4 Informatika'),
            ],
          ),
          const SizedBox(height: AppSpacing.space16),
          const PvCard(
            child: PvEmptyState(
              title: 'Belum ada keputusan',
              subtitle: 'Riwayat verifikasi akan tampil di sini.',
              compact: true,
            ),
          ),
        ],
      ),
    );
  }
}
