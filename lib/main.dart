import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qarz_daftar/app.dart';
import 'package:qarz_daftar/utils/bloc_logger.dart';

import 'src/settings/settings_controller.dart';
import 'src/settings/settings_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final settingsController = SettingsController(SettingsService());

  await settingsController.loadSettings();

  if (kDebugMode) {
    Bloc.observer = LogBlocObserver();
  }

  runApp(MyApp(settingsController: settingsController));
}
