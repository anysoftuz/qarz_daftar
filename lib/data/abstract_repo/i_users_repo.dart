import 'package:qarz_daftar/data/models/generic_pagination.dart';
import 'package:qarz_daftar/data/models/home/given_amount_model.dart';
import 'package:qarz_daftar/data/models/home/graphic_statistics_model.dart';
import 'package:qarz_daftar/data/models/home/notification_model.dart';
import 'package:qarz_daftar/data/models/home/popular_model.dart';
import 'package:qarz_daftar/data/models/home/post_operation_model.dart';
import 'package:qarz_daftar/data/models/users/banned_model.dart';
import 'package:qarz_daftar/data/models/users/contact_add_model.dart';
import 'package:qarz_daftar/data/models/users/contacts_model.dart';
import 'package:qarz_daftar/data/models/users/operations_model.dart';
import 'package:qarz_daftar/infrastructure/core/exceptions/failures.dart';
import 'package:qarz_daftar/utils/either.dart';

abstract class IUsersRepo {
  Future<Either<Failure, ContactsModel>> getContacts();
  Future<Either<Failure, GenericPagination<OperationModel>>> getOperations();
  Future<Either<Failure, OperationModel>> getOperation(int id);
  Future<Either<Failure, GenericPagination<PopularModel>>> getpopular();
  Future<Either<Failure, GenericPagination<NotificationModel>>>
      getNotification();
  Future<Either<Failure, List<GivenAmountModel>>> getGivenAmount();
  Future<Either<Failure, List<GivenAmountModel>>> getTakenAmount();
  Future<Either<Failure, List<GraphicStatisticsModel>>> getGraphicStatistics();
  Future<Either<Failure, List<BannedModel>>> getBannedUsers();

  Future<Either<Failure, bool>> postContact(ContactAddModel model);
  Future<Either<Failure, bool>> postOperation(PostOperationModel model);
}
