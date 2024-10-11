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
import 'package:qarz_daftar/infrastructure/core/exceptions/failures.dart';
import 'package:qarz_daftar/utils/either.dart';

abstract class IUsersRepo {
  Future<Either<Failure, ContactsModel>> getContacts(FilterModel model);
  Future<Either<Failure, bool>> postContacts(List<PhonsModel> model);
  Future<Either<Failure, GenericPagination<OperationModel>>> getOperations();
  Future<Either<Failure, GenericPagination<OperationModel>>> getOperationTr(
    int id,
  );
  Future<Either<Failure, OperationModel>> getOperation(int id);
  Future<Either<Failure, ContactsModel>> getpopular();
  Future<Either<Failure, GenericPagination<NotificationModel>>>
      getNotification();
  Future<Either<Failure, List<GivenAmountModel>>> getGivenAmount();
  Future<Either<Failure, List<GivenAmountModel>>> getTakenAmount();
  Future<Either<Failure, List<HistoryModel>>> getHistory();
  Future<Either<Failure, List<GraphicStatisticsModel>>> getGraphicStatistics();
  Future<Either<Failure, List<BannedModel>>> getBannedUsers();

  Future<Either<Failure, bool>> postContact(ContactAddModel model);
  Future<Either<Failure, bool>> postOperation(PostOperationModel model);

  Future<Either<Failure, bool>> postConfirm(int id);
  Future<Either<Failure, bool>> postRefusal(int id);

  Future<Either<Failure, bool>> postTransactions(
    int id,
    TransactionModel model,
  );
  Future<Either<Failure, bool>> postDeadline(int id, DeadlineModel model);

  Future<Either<Failure, bool>> patchTransactionConfirm(int id);
  Future<Either<Failure, bool>> patchTransactionRefus(int id);
}
