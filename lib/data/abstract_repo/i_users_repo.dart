import 'package:qarz_daftar/data/models/generic_pagination.dart';
import 'package:qarz_daftar/data/models/users/contacts_model.dart';
import 'package:qarz_daftar/data/models/users/operations_model.dart';
import 'package:qarz_daftar/infrastructure/core/exceptions/failures.dart';
import 'package:qarz_daftar/utils/either.dart';

abstract class IUsersRepo {
  Future<Either<Failure, ContactsModel>> getContacts();
  Future<Either<Failure, GenericPagination<OperationModel>>> getOperations();
}
