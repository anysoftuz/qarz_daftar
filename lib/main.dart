import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qarz_daftar/app.dart';
import 'package:qarz_daftar/infrastructure/core/service_locator.dart';
import 'package:qarz_daftar/infrastructure/repo/storage_repository.dart';
import 'package:qarz_daftar/src/assets/constants/storage_keys.dart';
import 'package:qarz_daftar/src/assets/themes/theme_changer.dart';
import 'package:qarz_daftar/utils/bloc_logger.dart';
import 'package:qarz_daftar/utils/log_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();
  await StorageRepository.getInstance();
  await StorageRepository.putString(
    StorageKeys.TOKEN,
    "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOjEsImlzc3VlciI6ImZyb250LWFwcC11cmwiLCJ1c2VyIjp7ImlkIjoxLCJmdWxsX25hbWUiOiJCZXNobWF0RXNobWF0b3YiLCJyb2xlIjoic3VwZXJfYWRtaW4iLCJmaXJzdF9uYW1lIjoiQmVzaG1hdCIsImxhc3RfbmFtZSI6IkVzaG1hdG92IiwicGhvbmUiOiI5OTg5OTk5OTk5OTkiLCJhdmF0YXIiOiJodHRwczovL3BpY3N1bS5waG90b3MvNTAwLzMwMCJ9LCJpYXQiOjE3MjcyNTM0NjcsImV4cCI6MTcyNzI4OTQ2N30.ic3JCSBc6U0qjwBITJSmBpnRamd8T1i3cTVXAgp23YI",
  );
  setupLocator();
  if (kDebugMode) {
    Bloc.observer = LogBlocObserver();
  }

  runApp(DependencyScope(
    initialModel: AppScope(
      themeMode: getTheme(StorageRepository.getString(StorageKeys.MODE)),
    ),
    child: const MyApp(),
  ));
}

ThemeMode getTheme(String mode) {
  Log.e(mode);
  switch (mode) {
    case 'light':
      return ThemeMode.light;
    case 'dark':
      return ThemeMode.dark;
    default:
      return ThemeMode.system;
  }
}
