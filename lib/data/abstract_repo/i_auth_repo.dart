import 'package:qarz_daftar/data/models/auth/send_code_model.dart';
import 'package:qarz_daftar/data/models/auth/user_get_model.dart';
import 'package:qarz_daftar/data/models/auth/user_model.dart';
import 'package:qarz_daftar/infrastructure/core/exceptions/failures.dart';
import 'package:qarz_daftar/utils/either.dart';

abstract class IAuthRepo {
  Future<Either<Failure, UserGetModel>> getMe();
  Future<Either<Failure, UserModel>> verifyPost(SendCodeModel body);
}
