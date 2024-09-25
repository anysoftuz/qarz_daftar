import 'package:qarz_daftar/data/common/error_handle.dart';
import 'package:qarz_daftar/data/models/generic_pagination.dart';
import 'package:qarz_daftar/data/models/users/contacts_model.dart';
import 'package:qarz_daftar/data/models/users/operations_model.dart';
import 'package:qarz_daftar/infrastructure/core/dio_settings.dart';
import 'package:qarz_daftar/infrastructure/core/service_locator.dart';

abstract class UsersDatasource {
  Future<ContactsModel> getContacts();
  Future<GenericPagination<OperationModel>> getOperations();
}

class UsersDatasourceImpl implements UsersDatasource {
  final dio = serviceLocator<DioSettings>().dio;
  final ErrorHandle _handle = ErrorHandle();

  @override
  Future<ContactsModel> getContacts() async {
    return await _handle.apiCantrol(
      request: () => dio.get('mobile/accounts/contacts'),
      body: (response) =>
          ContactsModel.fromJson(response as Map<String, dynamic>),
    );
  }

  @override
  Future<GenericPagination<OperationModel>> getOperations() async {
    return await _handle.apiCantrol(
      request: () => dio.get('mobile/operations'),
      body: (response) => GenericPagination.fromJson(
        response,
        (p0) => OperationModel.fromJson(p0 as Map<String, dynamic>),
      ),
    );
  }
}
