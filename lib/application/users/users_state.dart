// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'users_bloc.dart';

class UsersState extends Equatable {
  final FormzSubmissionStatus status;
  final FormzSubmissionStatus statusTr;
  final FormzSubmissionStatus graphicStatus;
  final FormzSubmissionStatus givenStatus;
  final FormzSubmissionStatus takenStatus;
  final FormzSubmissionStatus popularStatus;
  final FormzSubmissionStatus notificationStatus;
  final FormzSubmissionStatus notifConfirm;
  final FormzSubmissionStatus notifRefus;
  final FormzSubmissionStatus bannedStatus;
  final FormzSubmissionStatus historyStatus;
  final ContactsModel contactsModel;
  final List<Datum> contacts;
  final List<OperationModel> operations;
  final List<OperationModel> operationsTr;
  final ContactsModel popular;
  final List<NotificationModel> notification;
  final List<GivenAmountModel> givenAmount;
  final List<GivenAmountModel> takenAmount;
  final List<GraphicStatisticsModel> graphicStatistics;
  final List<BannedModel> banneds;
  final List<HistoryModel> history;
  const UsersState({
    this.status = FormzSubmissionStatus.initial,
    this.statusTr = FormzSubmissionStatus.initial,
    this.graphicStatus = FormzSubmissionStatus.initial,
    this.givenStatus = FormzSubmissionStatus.initial,
    this.takenStatus = FormzSubmissionStatus.initial,
    this.popularStatus = FormzSubmissionStatus.initial,
    this.notificationStatus = FormzSubmissionStatus.initial,
    this.bannedStatus = FormzSubmissionStatus.initial,
    this.notifConfirm = FormzSubmissionStatus.initial,
    this.notifRefus = FormzSubmissionStatus.initial,
    this.historyStatus = FormzSubmissionStatus.initial,
    this.contactsModel = const ContactsModel(),
    this.operations = const [],
    this.contacts = const [],
    this.operationsTr = const [],
    this.popular = const ContactsModel(),
    this.givenAmount = const [],
    this.notification = const [],
    this.takenAmount = const [],
    this.graphicStatistics = const [],
    this.banneds = const [],
    this.history = const [],
  });

  @override
  List<Object> get props => [
        status,
        statusTr,
        graphicStatus,
        givenStatus,
        takenStatus,
        popularStatus,
        notificationStatus,
        bannedStatus,
        notifConfirm,
        notifRefus,
        historyStatus,
        contactsModel,
        operations,
        operationsTr,
        popular,
        givenAmount,
        notification,
        takenAmount,
        graphicStatistics,
        banneds,
        history,
        contacts,
      ];

  UsersState copyWith({
    FormzSubmissionStatus? status,
    FormzSubmissionStatus? statusTr,
    FormzSubmissionStatus? graphicStatus,
    FormzSubmissionStatus? givenStatus,
    FormzSubmissionStatus? takenStatus,
    FormzSubmissionStatus? popularStatus,
    FormzSubmissionStatus? notificationStatus,
    FormzSubmissionStatus? notifConfirm,
    FormzSubmissionStatus? notifRefus,
    FormzSubmissionStatus? bannedStatus,
    FormzSubmissionStatus? historyStatus,
    ContactsModel? contactsModel,
    List<OperationModel>? operations,
    List<OperationModel>? operationsTr,
    ContactsModel? popular,
    List<NotificationModel>? notification,
    List<GivenAmountModel>? givenAmount,
    List<GivenAmountModel>? takenAmount,
    List<GraphicStatisticsModel>? graphicStatistics,
    List<BannedModel>? banneds,
    List<HistoryModel>? history,
    List<Datum>? contacts,
  }) {
    return UsersState(
      status: status ?? this.status,
      statusTr: statusTr ?? this.statusTr,
      graphicStatus: graphicStatus ?? this.graphicStatus,
      givenStatus: givenStatus ?? this.givenStatus,
      takenStatus: takenStatus ?? this.takenStatus,
      popularStatus: popularStatus ?? this.popularStatus,
      notificationStatus: notificationStatus ?? this.notificationStatus,
      notifConfirm: notifConfirm ?? this.notifConfirm,
      notifRefus: notifRefus ?? this.notifRefus,
      bannedStatus: bannedStatus ?? this.bannedStatus,
      historyStatus: historyStatus ?? this.historyStatus,
      contactsModel: contactsModel ?? this.contactsModel,
      operations: operations ?? this.operations,
      operationsTr: operationsTr ?? this.operationsTr,
      popular: popular ?? this.popular,
      notification: notification ?? this.notification,
      givenAmount: givenAmount ?? this.givenAmount,
      takenAmount: takenAmount ?? this.takenAmount,
      graphicStatistics: graphicStatistics ?? this.graphicStatistics,
      banneds: banneds ?? this.banneds,
      history: history ?? this.history,
      contacts: contacts ?? this.contacts,
    );
  }
}
