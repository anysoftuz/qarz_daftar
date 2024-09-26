part of 'auth_bloc.dart';

sealed class AuthEvent {}

class SendCodeEvent extends AuthEvent {
  final String phone;
  final int code;
  final VoidCallback onError;
  final Function(UserModel model) onSucces;

  SendCodeEvent({
    required this.phone,
    required this.code,
    required this.onError,
    required this.onSucces,
  });
}

class GetMeEvent extends AuthEvent {}

class GetMeTelegramEvent extends AuthEvent {
  final TelegramModel userModel;
  final VoidCallback onError;

  GetMeTelegramEvent({
    required this.userModel,
    required this.onError,
  });
}

class CheckUserEvent extends AuthEvent {}

class LogOutEvent extends AuthEvent {}
