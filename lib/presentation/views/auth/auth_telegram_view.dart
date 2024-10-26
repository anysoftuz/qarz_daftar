import 'package:flutter/material.dart';
import 'package:qarz_daftar/application/auth/auth_bloc.dart';
import 'package:qarz_daftar/l10n/app_localizations.dart';
import 'package:qarz_daftar/presentation/views/auth/confirmation_login_view.dart';
import 'package:qarz_daftar/presentation/widgets/w_button.dart';
import 'package:qarz_daftar/src/assets/colors/colors.dart';
import 'package:qarz_daftar/src/assets/images.dart';

class AuthTelegramView extends StatefulWidget {
  const AuthTelegramView({super.key});

  @override
  State<AuthTelegramView> createState() => _AuthTelegramViewState();
}

class _AuthTelegramViewState extends State<AuthTelegramView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF102750),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppImages.banner.imgAsset(width: double.infinity),
          const SizedBox(height: 32),
          Text(
            AppLocalizations.of(context)!.loginToTheSystem,
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w500,
              color: white,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Text(
              AppLocalizations.of(context)!.loginDescription,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: white,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 40),
          WButton(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            onTap: () async {
              final connection = await isInternetConnected();
              if (connection) {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const ConfirmationLoginView(),
                ));
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Internet mavjud emas")));
              }
            },
            color: white,
            textColor: black,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppImages.telegram.imgAsset(height: 24),
                const SizedBox(width: 8),
                Text(AppLocalizations.of(context)!.loginTelegram)
              ],
            ),
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}
