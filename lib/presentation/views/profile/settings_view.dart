import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:qarz_daftar/infrastructure/core/context_extension.dart';
import 'package:qarz_daftar/l10n/app_localizations.dart';
import 'package:qarz_daftar/presentation/routes/route_name.dart';
import 'package:qarz_daftar/src/assets/icons.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.of(context)!.settings)),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Column(
          children: [
            ListTile(
              onTap: () {
                context.push(AppRouteName.notificationSettings);
              },
              title: Text(
                AppLocalizations.of(context)!.notifications,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: context.color.white,
                ),
              ),
              leading: AppIcons.notification.svg(
                height: 24,
                width: 24,
                color: context.color.white,
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Divider(height: 1),
            ),
            ListTile(
              title: Text(
                AppLocalizations.of(context)!.changePhone,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: context.color.white,
                ),
              ),
              leading: AppIcons.phone.svg(
                height: 24,
                width: 24,
                color: context.color.white,
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Divider(height: 1),
            ),
            ListTile(
              onTap: () {
                context.push(AppRouteName.lenguage);
              },
              title: Text(
                AppLocalizations.of(context)!.lenguage,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: context.color.white,
                ),
              ),
              leading: AppIcons.globe.svg(
                height: 24,
                width: 24,
                color: context.color.white,
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Divider(height: 1),
            ),
            ListTile(
              onTap: () {
                context.push(AppRouteName.theme);
              },
              title: Text(
                AppLocalizations.of(context)!.theme,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: context.color.white,
                ),
              ),
              leading: AppIcons.moon.svg(
                height: 24,
                width: 24,
                color: context.color.white,
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Divider(height: 1),
            ),
          ],
        ),
      ),
    );
  }
}
