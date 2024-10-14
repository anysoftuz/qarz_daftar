import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:qarz_daftar/application/auth/auth_bloc.dart';
import 'package:qarz_daftar/infrastructure/core/service_locator.dart';
import 'package:qarz_daftar/infrastructure/repo/auth_repo.dart';
import 'package:qarz_daftar/l10n/app_localizations.dart';
import 'package:qarz_daftar/presentation/routes/app_routes.dart';
import 'package:qarz_daftar/presentation/routes/route_name.dart';

import 'package:qarz_daftar/src/assets/themes/theme.dart';
import 'package:qarz_daftar/src/assets/themes/theme_changer.dart';

import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:qarz_daftar/src/settings/local_provider.dart';
import 'package:qarz_daftar/src/settings/settings_controller.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          AuthBloc(serviceLocator<AuthRepo>())..add(CheckUserEvent()),
      child: ChangeNotifierProvider<LocaleProvider>(
        create: (_) => LocaleProvider(),
        builder: (context, child) {
          return ListenableBuilder(
            listenable: serviceLocator<SettingsController>(),
            builder: (BuildContext context, Widget? child) {
              return MaterialApp.router(
                restorationScopeId: 'app',
                supportedLocales: AppLocalizations.supportedLocales,
                localizationsDelegates: AppLocalizations.localizationsDelegates,
                // locale: const Locale('ru'),
                locale: Provider.of<LocaleProvider>(context).locale,
                debugShowCheckedModeBanner: false,
                theme: AppTheme.lightTheme(),
                themeMode: AppScope.of(context).themeMode,
                darkTheme: AppTheme.darkTheme(),
                routerConfig: AppRouts.router,
                builder: (context, child) => BlocListener<AuthBloc, AuthState>(
                  listener: (context, state) {
                    debugPrint('STATE LISTENER ============> ${state.status}');
                    switch (state.status) {
                      case AuthenticationStatus.unauthenticated:
                        AppRouts.router.pushReplacement(AppRouteName.auth);
                        break;
                      case AuthenticationStatus.authenticated:
                        AppRouts.router.go(AppRouteName.home);
                        break;
                      case AuthenticationStatus.loading:
                      case AuthenticationStatus.cancelLoading:
                        break;
                    }
                  },
                  child: KeyboardDismisser(child: child),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
