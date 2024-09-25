import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:qarz_daftar/data/models/users/contacts_model.dart';
import 'package:qarz_daftar/data/models/users/operations_model.dart';
import 'package:qarz_daftar/infrastructure/apis/users_datasource.dart';
import 'package:qarz_daftar/infrastructure/repo/users_repo.dart';

part 'users_event.dart';
part 'users_state.dart';

class UsersBloc extends Bloc<UsersEvent, UsersState> {
  final UsersRepo _repo = UsersRepo(dataSourcheImpl: UsersDatasourceImpl());

  UsersBloc() : super(const UsersState()) {
    on<GetOperationsEvent>((event, emit) async {
      emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
      final response = await _repo.getOperations();
      if (response.isRight) {
        emit(state.copyWith(
          status: FormzSubmissionStatus.success,
          operations: response.right.data,
        ));
      } else {
        emit(state.copyWith(status: FormzSubmissionStatus.failure));
      }
    });

    on<GetContactsEvent>((event, emit) async {
      emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
      final response = await _repo.getContacts();
      if (response.isRight) {
        emit(state.copyWith(
          status: FormzSubmissionStatus.success,
          contactsModel: response.right,
        ));
      } else {
        emit(state.copyWith(status: FormzSubmissionStatus.failure));
      }
    });
  }
}
