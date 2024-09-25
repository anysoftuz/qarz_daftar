import 'package:dio/dio.dart';
import 'package:qarz_daftar/data/abstract_repo/i_users_repo.dart';
import 'package:qarz_daftar/data/models/generic_pagination.dart';
import 'package:qarz_daftar/data/models/users/contacts_model.dart';
import 'package:qarz_daftar/data/models/users/operations_model.dart';
import 'package:qarz_daftar/infrastructure/apis/users_datasource.dart';
import 'package:qarz_daftar/infrastructure/core/exceptions/exceptions.dart';
import 'package:qarz_daftar/infrastructure/core/exceptions/failures.dart';
import 'package:qarz_daftar/utils/either.dart';

class UsersRepo implements IUsersRepo {
  final UsersDatasourceImpl dataSourcheImpl;
  UsersRepo({required this.dataSourcheImpl});

  @override
  Future<Either<Failure, ContactsModel>> getContacts() async {
    try {
      final result = await dataSourcheImpl.getContacts();
      return Right(result);
    } on DioException {
      return Left(DioFailure());
    } on ParsingException catch (e) {
      return Left(ParsingFailure(errorMessage: e.errorMessage));
    } on ServerException catch (e) {
      return Left(ServerFailure(
        errorMessage: e.errorMessage,
        statusCode: e.statusCode,
      ));
    }
  }

  @override
  Future<Either<Failure, GenericPagination<OperationModel>>>
      getOperations() async {
    try {
      final result = await dataSourcheImpl.getOperations();
      return Right(result);
    } on DioException {
      return Left(DioFailure());
    } on ParsingException catch (e) {
      return Left(ParsingFailure(errorMessage: e.errorMessage));
    } on ServerException catch (e) {
      return Left(ServerFailure(
        errorMessage: e.errorMessage,
        statusCode: e.statusCode,
      ));
    }
  }
}
