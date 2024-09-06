import 'package:flutter/material.dart';
import 'package:qarz_daftar/presentation/routes/app_routes.dart';
import 'package:qarz_daftar/src/assets/colors/colors.dart';
import 'package:qarz_daftar/src/localization/localization.dart';

import 'src/settings/settings_controller.dart';

import 'package:keyboard_dismisser/keyboard_dismisser.dart';

class MyApp extends StatefulWidget {
  const MyApp({
    super.key,
    required this.settingsController,
  });

  final SettingsController settingsController;
  static _MyAppState of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>()!;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: widget.settingsController,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp.router(
          restorationScopeId: 'app',
          supportedLocales: Localization.supportedLocales,
          localizationsDelegates: Localization.localizationsDelegates,
          theme: ThemeData(
            colorSchemeSeed: mainBlue,
            scaffoldBackgroundColor: whiteSmoke,
            appBarTheme: const AppBarTheme(
              backgroundColor: white,
              shadowColor: white,
              surfaceTintColor: white,
              centerTitle: true,
              elevation: 1,
            ),
            dividerTheme: const DividerThemeData(color: Color(0xFFEAEEF2)),
          ),
          darkTheme: ThemeData.dark(),
          themeMode: widget.settingsController.themeMode,
          debugShowCheckedModeBanner: false,
          routerConfig: AppRouts.router,
          builder: (context, child) => KeyboardDismisser(child: child),
        );
      },
    );
  }
}
