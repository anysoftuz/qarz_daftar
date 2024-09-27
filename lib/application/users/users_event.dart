part of 'users_bloc.dart';

sealed class UsersEvent {}

class GetContactsEvent extends UsersEvent {}

class GetOperationsEvent extends UsersEvent {}

class PosOperationsEvent extends UsersEvent {
  final PostOperationModel model;
  final VoidCallback onSucces;

  PosOperationsEvent({
    required this.model,
    required this.onSucces,
  });
}

class GetGivenAmountEvent extends UsersEvent {}

class GetTakenAmountEvent extends UsersEvent {}

class GetGraphicStatisticsEvent extends UsersEvent {}

class GetBannedEvent extends UsersEvent {}

class GetPopularEvent extends UsersEvent {}

class GetNotificationEvent extends UsersEvent {}

class PostContactEvent extends UsersEvent {
  final String phone;
  final String name;
  final VoidCallback onSucces;
  PostContactEvent({
    required this.phone,
    required this.name,
    required this.onSucces,
  });
}
