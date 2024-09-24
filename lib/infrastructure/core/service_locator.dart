import 'package:get_it/get_it.dart';
import 'package:qarz_daftar/application/auth/auth_bloc.dart';
import 'package:qarz_daftar/infrastructure/apis/auth_datasource.dart';
import 'package:qarz_daftar/infrastructure/core/dio_settings.dart';
import 'package:qarz_daftar/infrastructure/repo/auth_repo.dart';
import 'package:qarz_daftar/src/settings/settings_controller.dart';
import 'package:qarz_daftar/src/settings/settings_service.dart';

final serviceLocator = GetIt.I;

void setupLocator() {
  serviceLocator
    ..registerLazySingleton(DioSettings.new)
    ..registerLazySingleton(
      () => AuthRepo(dataSourcheImpl: AuthDataSourcheImpl()),
    )
    ..registerSingleton(SettingsController(SettingsService()))
    ..registerSingleton(AuthBloc(serviceLocator<AuthRepo>()));
}

Future resetLocator() async {
  await serviceLocator.reset();
  setupLocator();
}
