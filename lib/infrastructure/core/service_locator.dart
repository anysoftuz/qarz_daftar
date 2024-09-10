import 'package:get_it/get_it.dart';
import 'package:qarz_daftar/src/settings/settings_controller.dart';
import 'package:qarz_daftar/src/settings/settings_service.dart';

final serviceLocator = GetIt.I;

void setupLocator() {
  serviceLocator.registerSingleton(SettingsController(SettingsService()));
}

Future resetLocator() async {
  await serviceLocator.reset();
  setupLocator();
}
