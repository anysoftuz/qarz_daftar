// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'users_bloc.dart';

class UsersState extends Equatable {
  final FormzSubmissionStatus status;
  final FormzSubmissionStatus graphicStatus;
  final FormzSubmissionStatus givenStatus;
  final FormzSubmissionStatus takenStatus;
  final FormzSubmissionStatus popularStatus;
  final FormzSubmissionStatus notificationStatus;
  final FormzSubmissionStatus bannedStatus;
  final ContactsModel contactsModel;
  final List<OperationModel> operations;
  final List<PopularModel> popular;
  final List<NotificationModel> notification;
  final List<GivenAmountModel> givenAmount;
  final List<GivenAmountModel> takenAmount;
  final List<GraphicStatisticsModel> graphicStatistics;
  final List<BannedModel> banneds;
  const UsersState({
    this.status = FormzSubmissionStatus.initial,
    this.graphicStatus = FormzSubmissionStatus.initial,
    this.givenStatus = FormzSubmissionStatus.initial,
    this.takenStatus = FormzSubmissionStatus.initial,
    this.popularStatus = FormzSubmissionStatus.initial,
    this.notificationStatus = FormzSubmissionStatus.initial,
    this.bannedStatus = FormzSubmissionStatus.initial,
    this.contactsModel = const ContactsModel(),
    this.operations = const [],
    this.popular = const [],
    this.givenAmount = const [],
    this.notification = const [],
    this.takenAmount = const [],
    this.graphicStatistics = const [],
    this.banneds = const [],
  });

  @override
  List<Object> get props => [
        status,
        takenStatus,
        givenStatus,
        graphicStatus,
        popularStatus,
        contactsModel,
        operations,
        popular,
        givenAmount,
        takenAmount,
        graphicStatistics,
        notification,
        notificationStatus,
        banneds,
        bannedStatus,
      ];

  UsersState copyWith({
    FormzSubmissionStatus? status,
    FormzSubmissionStatus? graphicStatus,
    FormzSubmissionStatus? givenStatus,
    FormzSubmissionStatus? takenStatus,
    FormzSubmissionStatus? popularStatus,
    FormzSubmissionStatus? notificationStatus,
    FormzSubmissionStatus? bannedStatus,
    ContactsModel? contactsModel,
    List<OperationModel>? operations,
    List<PopularModel>? popular,
    List<NotificationModel>? notification,
    List<GivenAmountModel>? givenAmount,
    List<GivenAmountModel>? takenAmount,
    List<GraphicStatisticsModel>? graphicStatistics,
    List<BannedModel>? banneds,
  }) {
    return UsersState(
      status: status ?? this.status,
      graphicStatus: graphicStatus ?? this.graphicStatus,
      givenStatus: givenStatus ?? this.givenStatus,
      takenStatus: takenStatus ?? this.takenStatus,
      popularStatus: popularStatus ?? this.popularStatus,
      notificationStatus: notificationStatus ?? this.notificationStatus,
      bannedStatus: bannedStatus ?? this.bannedStatus,
      contactsModel: contactsModel ?? this.contactsModel,
      operations: operations ?? this.operations,
      popular: popular ?? this.popular,
      notification: notification ?? this.notification,
      givenAmount: givenAmount ?? this.givenAmount,
      takenAmount: takenAmount ?? this.takenAmount,
      graphicStatistics: graphicStatistics ?? this.graphicStatistics,
      banneds: banneds ?? this.banneds,
    );
  }
}
