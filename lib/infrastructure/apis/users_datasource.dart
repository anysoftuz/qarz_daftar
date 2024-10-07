import 'package:qarz_daftar/data/common/error_handle.dart';
import 'package:qarz_daftar/data/models/deadline_model.dart';
import 'package:qarz_daftar/data/models/filter_model.dart';
import 'package:qarz_daftar/data/models/generic_pagination.dart';
import 'package:qarz_daftar/data/models/home/given_amount_model.dart';
import 'package:qarz_daftar/data/models/home/graphic_statistics_model.dart';
import 'package:qarz_daftar/data/models/home/notification_model.dart';
import 'package:qarz_daftar/data/models/home/post_operation_model.dart';
import 'package:qarz_daftar/data/models/users/banned_model.dart';
import 'package:qarz_daftar/data/models/users/contact_add_model.dart';
import 'package:qarz_daftar/data/models/users/contacts_model.dart';
import 'package:qarz_daftar/data/models/users/history_model.dart';
import 'package:qarz_daftar/data/models/users/operations_model.dart';
import 'package:qarz_daftar/data/models/users/phons_model.dart';
import 'package:qarz_daftar/data/models/users/transaction_model.dart';
import 'package:qarz_daftar/infrastructure/core/dio_settings.dart';
import 'package:qarz_daftar/infrastructure/core/service_locator.dart';

abstract class UsersDatasource {
  Future<ContactsModel> getContacts(FilterModel model);
  Future<bool> postContacts(List<PhonsModel> model);
  Future<GenericPagination<OperationModel>> getOperations();
  Future<OperationModel> getOperation(int id);
  Future<GenericPagination<OperationModel>> getOperationTr(int id);
  Future<ContactsModel> getpopular();
  Future<List<GivenAmountModel>> getGivenAmount();
  Future<List<GivenAmountModel>> getTakenAmount();
  Future<List<HistoryModel>> getHistory();
  Future<List<GraphicStatisticsModel>> getGraphicStatistics();
  Future<List<BannedModel>> getBannedUsers();
  Future<GenericPagination<NotificationModel>> getNotification();
  Future<bool> postContact(ContactAddModel model);
  Future<bool> postOperation(PostOperationModel model);
  Future<bool> postConfirm(int id);
  Future<bool> postRefusal(int id);
  Future<bool> postTransactions(int id, TransactionModel model);
  Future<bool> postDeadline(int id, DeadlineModel model);
  Future<bool> patchTransactionConfirm(int id);
  Future<bool> patchTransactionRefus(int id);
}

class UsersDatasourceImpl implements UsersDatasource {
  final dio = serviceLocator<DioSettings>().dio;
  final ErrorHandle _handle = ErrorHandle();

  @override
  Future<ContactsModel> getContacts(FilterModel model) async {
    return await _handle.apiCantrol(
      request: () => dio.get(
        'mobile/accounts/contacts',
        queryParameters: model.toJson(),
      ),
      body: (response) =>
          ContactsModel.fromJson(response as Map<String, dynamic>),
    );
  }

  @override
  Future<List<GivenAmountModel>> getGivenAmount() async {
    return await _handle.apiCantrol(
      request: () => dio.post('mobile/operations/me/given-amount/statistics'),
      body: (response) => (response as List)
          .map((e) => GivenAmountModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  @override
  Future<List<GraphicStatisticsModel>> getGraphicStatistics() async {
    return await _handle.apiCantrol(
      request: () => dio.get('mobile/operations/me/graphic/statistics'),
      body: (response) => (response as List)
          .map(
              (e) => GraphicStatisticsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  @override
  Future<List<GivenAmountModel>> getTakenAmount() async {
    return await _handle.apiCantrol(
      request: () => dio.post('mobile/operations/me/taken-amount/statistics'),
      body: (response) => (response as List)
          .map((e) => GivenAmountModel.fromJson(e as Map<String, dynamic>))
          .toList(),
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

  @override
  Future<bool> postOperation(PostOperationModel model) async {
    return await _handle.apiCantrol(
      request: () => dio.post(
        'mobile/operations',
        data: model.toJson(),
      ),
      body: (response) => true,
    );
  }

  @override
  Future<ContactsModel> getpopular() async {
    return await _handle.apiCantrol(
      request: () => dio.get('mobile/customers/popular'),
      body: (response) =>
          ContactsModel.fromJson(response as Map<String, dynamic>),
    );
  }

  @override
  Future<GenericPagination<NotificationModel>> getNotification() async {
    return await _handle.apiCantrol(
      request: () => dio.get('mobile/notifications/me'),
      body: (response) => GenericPagination.fromJson(
        response,
        (p0) => NotificationModel.fromJson(p0 as Map<String, dynamic>),
      ),
    );
  }

  @override
  Future<bool> postContact(ContactAddModel model) async {
    return await _handle.apiCantrol(
      request: () => dio.post(
        'mobile/accounts/contacts',
        data: model.toJson(),
      ),
      body: (response) => true,
    );
  }

  @override
  Future<List<BannedModel>> getBannedUsers() async {
    return await _handle.apiCantrol(
      request: () => dio.get('mobile/accounts/me/banneds'),
      body: (response) => (response as List)
          .map((e) => BannedModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  @override
  Future<OperationModel> getOperation(int id) async {
    return await _handle.apiCantrol(
      request: () => dio.get('mobile/operations/$id'),
      body: (response) =>
          OperationModel.fromJson(response as Map<String, dynamic>),
    );
  }

  @override
  Future<bool> postConfirm(int id) async {
    return await _handle.apiCantrol(
      request: () => dio.patch('mobile/operations/$id/confirm'),
      body: (response) => true,
    );
  }

  @override
  Future<bool> postRefusal(int id) async {
    return await _handle.apiCantrol(
      request: () => dio.patch('mobile/operations/$id/refusal'),
      body: (response) => true,
    );
  }

  @override
  Future<bool> postDeadline(int id, DeadlineModel model) async {
    return await _handle.apiCantrol(
      request: () => dio.patch(
        'mobile/operations/$id/deadline',
        data: model.toJson(),
      ),
      body: (response) => true,
    );
  }

  @override
  Future<GenericPagination<OperationModel>> getOperationTr(int id) async {
    return await _handle.apiCantrol(
      request: () => dio.get('mobile/operations/$id/transactions'),
      body: (response) => GenericPagination.fromJson(
        response,
        (p0) => OperationModel.fromJson(p0 as Map<String, dynamic>),
      ),
    );
  }

  @override
  Future<bool> postTransactions(int id, TransactionModel model) async {
    return await _handle.apiCantrol(
      request: () => dio.post(
        'mobile/operations/$id/transactions',
        data: model.toJson(),
      ),
      body: (response) => true,
    );
  }

  @override
  Future<bool> patchTransactionConfirm(int id) async {
    return await _handle.apiCantrol(
      request: () => dio.patch(
        'mobile/operations/transactions/$id/confirm',
      ),
      body: (response) => true,
    );
  }

  @override
  Future<bool> patchTransactionRefus(int id) async {
    return await _handle.apiCantrol(
      request: () => dio.patch(
        'mobile/operations/transactions/$id/refusal',
      ),
      body: (response) => true,
    );
  }

  @override
  Future<List<HistoryModel>> getHistory() async {
    return await _handle.apiCantrol(
      request: () => dio.post(
        'mobile/operations/mobile/operations/history',
      ),
      body: (response) => (response as List)
          .map((e) => HistoryModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  @override
  Future<bool> postContacts(List<PhonsModel> model) async {
    return await _handle.apiCantrol(
      request: () => dio.post(
        'mobile/accounts/contacts/synchronization',
        data: phonsModelToJson(model),
      ),
      body: (response) => true,
    );
  }
}
