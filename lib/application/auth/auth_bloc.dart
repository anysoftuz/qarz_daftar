import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:formz/formz.dart';
import 'package:qarz_daftar/data/models/auth/send_code_model.dart';
import 'package:qarz_daftar/data/models/auth/user_get_model.dart';
import 'package:qarz_daftar/data/models/auth/user_model.dart';
import 'package:qarz_daftar/infrastructure/repo/auth_repo.dart';
import 'package:qarz_daftar/infrastructure/repo/storage_repository.dart';
import 'package:qarz_daftar/src/assets/constants/storage_keys.dart';
import 'package:qarz_daftar/utils/log_service.dart';

part 'auth_event.dart';
part 'auth_state.dart';

enum AuthenticationStatus {
  authenticated,
  unauthenticated,
  loading,
  cancelLoading,
}

Future<bool> isInternetConnected() async {
  var connectivityResult = await (Connectivity().checkConnectivity());
  var connectionChecker = InternetConnectionChecker();
  if (connectivityResult.contains(ConnectivityResult.mobile) ||
      connectivityResult.contains(ConnectivityResult.wifi) ||
      connectivityResult.contains(ConnectivityResult.ethernet) ||
      connectivityResult.contains(ConnectivityResult.vpn) ||
      connectivityResult.contains(ConnectivityResult.bluetooth) &&
          await connectionChecker.hasConnection) {
    return true; // Connected to mobile data or Wi-Fi
  } else {
    return false; // Not connected to the internet
  }
}

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepo _repository;
  AuthBloc(this._repository) : super(const AuthState()) {
    on<CheckUserEvent>((event, emit) {
      final token = StorageRepository.getString(StorageKeys.TOKEN);
      if (token.isEmpty) {
        emit(state.copyWith(status: AuthenticationStatus.unauthenticated));
      } else {
        add(GetMeEvent());
      }
    });

    on<GetMeEvent>((event, emit) async {
      final response = await _repository.getMe();
      if (response.isRight) {
        emit(state.copyWith(
          status: AuthenticationStatus.authenticated,
          usergetModel: response.right,
        ));
      } else {
        emit(state.copyWith(status: AuthenticationStatus.unauthenticated));
      }
    });

    on<SendCodeEvent>((event, emit) async {
      emit(state.copyWith(statusCode: FormzSubmissionStatus.inProgress));
      final body = SendCodeModel(
        phone: event.phone,
        code: event.code,
      );
      final response = await _repository.verifyPost(body);
      Log.e(response);
      if (response.isRight) {
        await StorageRepository.putString(
          StorageKeys.TOKEN,
          response.right.accessToken,
        );
        event.onSucces(response.right);
        emit(state.copyWith(
          statusCode: FormzSubmissionStatus.success,
          userModel: response.right,
        ));
        add(GetMeEvent());
      } else {
        emit(state.copyWith(statusCode: FormzSubmissionStatus.failure));
        event.onError();
      }
    });
    on<LogOutEvent>((event, emit) async {
      await StorageRepository.putString(StorageKeys.TOKEN, "");
      emit(state.copyWith(
        statusCode: FormzSubmissionStatus.success,
        status: AuthenticationStatus.unauthenticated,
      ));
    });
  }
}
