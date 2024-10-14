part of 'auth_bloc.dart';

sealed class AuthEvent {}

class SendCodeEvent extends AuthEvent {
  final SendCodeModel body;
  final VoidCallback onError;
  final Function(UserModel model) onSucces;

  SendCodeEvent({
    required this.body,
    required this.onError,
    required this.onSucces,
  });
}

class RefreshTokenEvent extends AuthEvent {}

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
