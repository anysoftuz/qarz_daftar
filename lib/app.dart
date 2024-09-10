import 'package:flutter/material.dart';
import 'package:qarz_daftar/presentation/routes/app_routes.dart';

import 'package:qarz_daftar/src/assets/themes/theme.dart';
import 'package:qarz_daftar/src/assets/themes/theme_changer.dart';
import 'package:qarz_daftar/src/localization/localization.dart';

import 'package:keyboard_dismisser/keyboard_dismisser.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      restorationScopeId: 'app',
      supportedLocales: Localization.supportedLocales,
      localizationsDelegates: Localization.localizationsDelegates,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme(),
      themeMode: AppScope.of(context).themeMode,
      darkTheme: AppTheme.darkTheme(),
      routerConfig: AppRouts.router,
      builder: (context, child) => KeyboardDismisser(child: child),
    );
  }
}
