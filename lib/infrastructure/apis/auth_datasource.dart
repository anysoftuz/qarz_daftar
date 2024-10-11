import 'package:dio/dio.dart';
import 'package:qarz_daftar/data/common/error_handle.dart';
import 'package:qarz_daftar/data/models/auth/send_code_model.dart';
import 'package:qarz_daftar/data/models/auth/user_get_model.dart';
import 'package:qarz_daftar/data/models/auth/user_model.dart';
import 'package:qarz_daftar/infrastructure/core/dio_settings.dart';
import 'package:qarz_daftar/infrastructure/core/service_locator.dart';
import 'package:qarz_daftar/infrastructure/repo/storage_repository.dart';
import 'package:qarz_daftar/src/assets/constants/storage_keys.dart';

abstract class AuthDatasourche {
  Future<UserGetModel> getMe();
  Future<UserModel> verifyPost(SendCodeModel body);
}

class AuthDataSourcheImpl implements AuthDatasourche {
  final dio = serviceLocator<DioSettings>().dio;
  final ErrorHandle _handle = ErrorHandle();

  @override
  Future<UserGetModel> getMe() {
    return _handle.apiCantrol(
      request: () => dio.get(
        'mobile/accounts/me',
        options: Options(
          headers: <String, dynamic>{
            'Authorization':
                'Bearer ${StorageRepository.getString(StorageKeys.TOKEN)}',
          },
        ),
      ),
      body: (response) =>
          UserGetModel.fromJson(response as Map<String, dynamic>),
    );
  }

  @override
  Future<UserModel> verifyPost(SendCodeModel body) {
    return _handle.apiCantrol(
      request: () => dio.post(
        'auth/generate-token',
        data: body.toJson(),
      ),
      body: (response) => UserModel.fromJson(response as Map<String, dynamic>),
    );
  }
}
