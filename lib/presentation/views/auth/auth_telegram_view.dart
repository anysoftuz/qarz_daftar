import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:qarz_daftar/presentation/routes/route_name.dart';
import 'package:qarz_daftar/presentation/widgets/w_button.dart';
import 'package:qarz_daftar/src/assets/colors/colors.dart';
import 'package:qarz_daftar/src/assets/images.dart';
import 'package:qarz_daftar/utils/caller.dart';

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
          const Text(
            "Тизимга кириш",
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w500,
              color: white,
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 32),
            child: Text(
              "Тизимга кириш учун телефонингизда телеграм мессенжери ўрнатилган ва телеграм аккаунтингиз бўлиши керак",
              style: TextStyle(
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
            onTap: () {
              Caller.launchUrlWeb("https://t.me/qarz_daftar1_bot");
              context.go(AppRouteName.confirmLogin);
            },
            color: white,
            textColor: black,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppImages.telegram.imgAsset(height: 24),
                const SizedBox(width: 8),
                const Text("Телеграм орқали кириш")
              ],
            ),
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}
