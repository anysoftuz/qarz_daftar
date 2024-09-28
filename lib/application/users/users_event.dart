part of 'users_bloc.dart';

sealed class UsersEvent {}

class GetContactsEvent extends UsersEvent {}

class GetOperationsEvent extends UsersEvent {}

class GetOperationsTREvent extends UsersEvent {
  final int id;

  GetOperationsTREvent({required this.id});
}

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

class PostConfirmEvent extends UsersEvent {
  final int id;

  PostConfirmEvent({required this.id});
}

class PostRefusalEvent extends UsersEvent {
  final int id;

  PostRefusalEvent({required this.id});
}

class PostDeadlineEvent extends UsersEvent {
  final int id;
  final DeadlineModel model;

  PostDeadlineEvent({
    required this.id,
    required this.model,
  });
}

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
