// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'users_bloc.dart';

class UsersState extends Equatable {
  final FormzSubmissionStatus status;
  final ContactsModel contactsModel;
  final List<OperationModel> operations;
  const UsersState({
    this.status = FormzSubmissionStatus.initial,
    this.contactsModel = const ContactsModel(),
    this.operations = const [],
  });

  @override
  List<Object> get props => [
        status,
        contactsModel,
      ];

  UsersState copyWith({
    FormzSubmissionStatus? status,
    ContactsModel? contactsModel,
    List<OperationModel>? operations,
  }) {
    return UsersState(
      status: status ?? this.status,
      contactsModel: contactsModel ?? this.contactsModel,
      operations: operations ?? this.operations,
    );
  }
}
