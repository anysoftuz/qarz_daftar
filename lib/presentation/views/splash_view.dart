import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qarz_daftar/presentation/views/auth/auth_telegram_view.dart';
import 'package:qarz_daftar/src/assets/colors/colors.dart';
import 'package:qarz_daftar/src/assets/images.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 1)).then(
      (value) {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const AuthTelegramView(),
        ));
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.transparent,
      ),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: const Color(0xFF102750),
        body: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppImages.logo.imgAsset(height: 116),
              const SizedBox(height: 32),
              AppImages.qarz.imgAsset(height: 20),
              const SizedBox(height: 8),
              const Text(
                "Hisobli do'st ayrilmas",
                style: TextStyle(
                  color: white,
                  fontSize: 16,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
