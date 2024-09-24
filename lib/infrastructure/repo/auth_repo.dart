import 'package:dio/dio.dart';
import 'package:qarz_daftar/data/abstract_repo/i_auth_repo.dart';
import 'package:qarz_daftar/data/models/auth/send_code_model.dart';
import 'package:qarz_daftar/data/models/auth/user_get_model.dart';
import 'package:qarz_daftar/data/models/auth/user_model.dart';
import 'package:qarz_daftar/infrastructure/apis/auth_datasource.dart';
import 'package:qarz_daftar/infrastructure/core/exceptions/exceptions.dart';
import 'package:qarz_daftar/infrastructure/core/exceptions/failures.dart';
import 'package:qarz_daftar/utils/either.dart';

class AuthRepo implements IAuthRepo {
  final AuthDataSourcheImpl dataSourcheImpl;

  AuthRepo({required this.dataSourcheImpl});

  @override
  Future<Either<Failure, UserGetModel>> getMe() async {
    // bool isConnection = await isInternetConnected();
    // if (isConnection) {
    //   return Left(NetworkFailure(errorMessage: "Internet yo'q"));
    // }
    try {
      final result = await dataSourcheImpl.getMe();
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
  Future<Either<Failure, UserModel>> verifyPost(SendCodeModel body) async {
    try {
      final result = await dataSourcheImpl.verifyPost(body);
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
