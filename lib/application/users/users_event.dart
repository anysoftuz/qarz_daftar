part of 'users_bloc.dart';

sealed class UsersEvent {}

class GetContactsEvent extends UsersEvent {
  final bool isMore;
  final String search;

  GetContactsEvent({
    this.isMore = false,
    this.search = '',
  });
}

class GetHistoryEvent extends UsersEvent {
  final String? phone;

  GetHistoryEvent({this.phone});
}

class PostContactsEvent extends UsersEvent {
  final List<PhonsModel> model;

  PostContactsEvent({required this.model});
}

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

class GetNotificationEvent extends UsersEvent {
  final Function(List<NotificationModel> notification) onSucces;

  GetNotificationEvent({required this.onSucces});
}

class PostConfirmEvent extends UsersEvent {
  final int id;

  PostConfirmEvent({required this.id});
}

class PostTransactionsEvent extends UsersEvent {
  final int id;
  final TransactionModel model;
  final VoidCallback onSucces;

  PostTransactionsEvent({
    required this.id,
    required this.model,
    required this.onSucces,
  });
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

class PatchTransactionConfirmEvent extends UsersEvent {
  final int id;

  PatchTransactionConfirmEvent({required this.id});
}

class PatchTransactionRefEvent extends UsersEvent {
  final int id;

  PatchTransactionRefEvent({required this.id});
}
