import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:test_case/custom/custom_app_bar.dart';
import 'package:test_case/features/profile/presentation/providers/profile_provider.dart';
import 'package:test_case/features/profile/presentation/widgets/profile_header.dart';

import '../../../../router/router.dart';

@RoutePage()
class ProfilePage extends ConsumerWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(profileProvider);
    return Scaffold(
      appBar: CustomAppBar(
        leading: SizedBox.shrink(),
        title: 'profile'.tr(),
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          ProfileHeader(
            name: state.profile.name,
            id: state.profile.id,
            imageUrl: state.profile.photoUrl,
            isProfile: true,
          ),
          const SizedBox(height: 20),
          _LanguageDropdown(),
          _ProfileOptionWidget(
            title: 'change_password'.tr(),
            icon: Icons.lock,
            onTap: () {},
          ),
          _ProfileOptionWidget(
            title: 'account_settings'.tr(),
            icon: Icons.settings,
            onTap: () {},
          ),
          _ProfileOptionWidget(
            title: 'notifications'.tr(),
            icon: Icons.notifications,
            onTap: () {},
          ),
          _ProfileOptionWidget(
            title: 'logout'.tr(),
            icon: Icons.exit_to_app,
            onTap: () async {
              await ref.read(profileProvider.notifier).logout();

              state.failure.fold(
                () {
                  context.router.replaceAll([const LoginRoute()]);
                },
                (failure) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(failure.message),
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}

class _LanguageDropdown extends ConsumerWidget {
  const _LanguageDropdown({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final supportedLocales = context.supportedLocales;
    final currentLocale = context.locale;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.language, size: 24),
          const SizedBox(width: 10),
          DropdownButton<Locale>(
            value: supportedLocales.contains(currentLocale)
                ? currentLocale
                : supportedLocales.first,
            onChanged: (Locale? newLocale) {
              if (newLocale != null) {
                context.setLocale(newLocale);
                ref.read(profileProvider.notifier).setLanguageChanged();
              }
            },
            items: supportedLocales.map((locale) {
              return DropdownMenuItem(
                value: locale,
                child: Text(locale.languageCode == 'en' ? 'English' : 'Türkçe'),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

class _ProfileOptionWidget extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  const _ProfileOptionWidget({
    Key? key,
    required this.title,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        leading: Icon(icon, color: Theme.of(context).primaryColor),
        title: Text(title, style: TextStyle(fontSize: 16)),
        trailing: Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
        onTap: onTap,
      ),
    );
  }
}
