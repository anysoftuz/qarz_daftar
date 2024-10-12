// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'auth_bloc.dart';

class AuthState extends Equatable {
  final AuthenticationStatus status;
  final UserGetModel usergetModel;
  final FormzSubmissionStatus statusCode;
  final FormzSubmissionStatus statusMyId;
  const AuthState({
    this.statusCode = FormzSubmissionStatus.initial,
    this.statusMyId = FormzSubmissionStatus.initial,
    this.usergetModel = const UserGetModel(),
    this.status = AuthenticationStatus.loading,
  });

  @override
  List<Object?> get props => [
        status,
        usergetModel,
        statusCode,
      ];

  AuthState copyWith({
    AuthenticationStatus? status,
    UserGetModel? usergetModel,
    FormzSubmissionStatus? statusCode,
    FormzSubmissionStatus? statusMyId,
  }) {
    return AuthState(
      status: status ?? this.status,
      usergetModel: usergetModel ?? this.usergetModel,
      statusCode: statusCode ?? this.statusCode,
      statusMyId: statusMyId ?? this.statusMyId,
    );
  }
}
