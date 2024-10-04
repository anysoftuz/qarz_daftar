import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:qarz_daftar/data/models/deadline_model.dart';
import 'package:qarz_daftar/data/models/home/given_amount_model.dart';
import 'package:qarz_daftar/data/models/home/graphic_statistics_model.dart';
import 'package:qarz_daftar/data/models/home/notification_model.dart';
import 'package:qarz_daftar/data/models/home/popular_model.dart';
import 'package:qarz_daftar/data/models/home/post_operation_model.dart';
import 'package:qarz_daftar/data/models/users/banned_model.dart';
import 'package:qarz_daftar/data/models/users/contact_add_model.dart';
import 'package:qarz_daftar/data/models/users/contacts_model.dart';
import 'package:qarz_daftar/data/models/users/history_model.dart';
import 'package:qarz_daftar/data/models/users/operations_model.dart';
import 'package:qarz_daftar/data/models/users/phons_model.dart';
import 'package:qarz_daftar/data/models/users/transaction_model.dart';
import 'package:qarz_daftar/infrastructure/apis/users_datasource.dart';
import 'package:qarz_daftar/infrastructure/repo/users_repo.dart';

part 'users_event.dart';
part 'users_state.dart';

class UsersBloc extends Bloc<UsersEvent, UsersState> {
  final UsersRepo _repo = UsersRepo(dataSourcheImpl: UsersDatasourceImpl());

  UsersBloc() : super(const UsersState()) {
    on<PostContactsEvent>((event, emit) async {
      emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
      final response = await _repo.postContacts(event.model);
      if (response.isRight) {
        emit(state.copyWith(status: FormzSubmissionStatus.success));
        add(GetContactsEvent());
      } else {
        emit(state.copyWith(status: FormzSubmissionStatus.failure));
      }
    });
    on<GetHistoryEvent>((event, emit) async {
      emit(state.copyWith(historyStatus: FormzSubmissionStatus.inProgress));
      final response = await _repo.getHistory();
      if (response.isRight) {
        emit(state.copyWith(
          historyStatus: FormzSubmissionStatus.success,
          history: response.right,
        ));
      } else {
        emit(state.copyWith(historyStatus: FormzSubmissionStatus.failure));
      }
    });

    on<PatchTransactionConfirmEvent>((event, emit) async {
      emit(state.copyWith(notifRefus: FormzSubmissionStatus.inProgress));
      final response = await _repo.patchTransactionConfirm(event.id);
      if (response.isRight) {
        emit(state.copyWith(notifRefus: FormzSubmissionStatus.success));
        add(GetNotificationEvent(
          onSucces: (List<NotificationModel> notification) {},
        ));
      } else {
        emit(state.copyWith(notifRefus: FormzSubmissionStatus.failure));
      }
    });

    on<PatchTransactionRefEvent>((event, emit) async {
      emit(state.copyWith(notifRefus: FormzSubmissionStatus.inProgress));
      final response = await _repo.patchTransactionRefus(event.id);
      if (response.isRight) {
        emit(state.copyWith(notifRefus: FormzSubmissionStatus.success));
        add(GetNotificationEvent(
          onSucces: (List<NotificationModel> notification) {},
        ));
      } else {
        emit(state.copyWith(notifRefus: FormzSubmissionStatus.failure));
      }
    });

    on<PostTransactionsEvent>((event, emit) async {
      emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
      final response = await _repo.postTransactions(event.id, event.model);
      if (response.isRight) {
        emit(state.copyWith(status: FormzSubmissionStatus.success));
        event.onSucces();
      } else {
        emit(state.copyWith(status: FormzSubmissionStatus.failure));
      }
    });

    on<GetOperationsTREvent>((event, emit) async {
      emit(state.copyWith(statusTr: FormzSubmissionStatus.inProgress));
      final response = await _repo.getOperationTr(event.id);
      if (response.isRight) {
        emit(state.copyWith(
          statusTr: FormzSubmissionStatus.success,
          operationsTr: response.right.data,
        ));
      } else {
        emit(state.copyWith(statusTr: FormzSubmissionStatus.failure));
      }
    });

    on<PostDeadlineEvent>((event, emit) async {
      emit(state.copyWith(notifRefus: FormzSubmissionStatus.inProgress));
      final response = await _repo.postDeadline(event.id, event.model);
      if (response.isRight) {
        emit(state.copyWith(notifRefus: FormzSubmissionStatus.success));
      } else {
        emit(state.copyWith(notifRefus: FormzSubmissionStatus.failure));
      }
    });

    on<PostRefusalEvent>((event, emit) async {
      emit(state.copyWith(notifRefus: FormzSubmissionStatus.inProgress));
      final response = await _repo.postRefusal(event.id);
      if (response.isRight) {
        emit(state.copyWith(notifRefus: FormzSubmissionStatus.success));
        add(GetNotificationEvent(
          onSucces: (List<NotificationModel> notification) {},
        ));
      } else {
        emit(state.copyWith(notifRefus: FormzSubmissionStatus.failure));
      }
    });

    on<PostConfirmEvent>((event, emit) async {
      emit(state.copyWith(notifConfirm: FormzSubmissionStatus.inProgress));
      final response = await _repo.postConfirm(event.id);
      if (response.isRight) {
        emit(state.copyWith(notifConfirm: FormzSubmissionStatus.success));
        add(GetNotificationEvent(
          onSucces: (List<NotificationModel> notification) {},
        ));
      } else {
        emit(state.copyWith(notifConfirm: FormzSubmissionStatus.failure));
      }
    });

    on<PostContactEvent>((event, emit) async {
      emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
      final response = await _repo.postContact(ContactAddModel(
        phone: event.phone,
        fullName: event.name,
      ));
      if (response.isRight) {
        emit(state.copyWith(status: FormzSubmissionStatus.success));
        event.onSucces();
        add(GetContactsEvent());
      } else {
        emit(state.copyWith(status: FormzSubmissionStatus.failure));
      }
    });

    on<PosOperationsEvent>((event, emit) async {
      emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
      final response = await _repo.postOperation(event.model);
      if (response.isRight) {
        emit(state.copyWith(status: FormzSubmissionStatus.success));
        event.onSucces();
      } else {
        emit(state.copyWith(status: FormzSubmissionStatus.failure));
      }
    });
    on<GetNotificationEvent>((event, emit) async {
      emit(
          state.copyWith(notificationStatus: FormzSubmissionStatus.inProgress));
      final response = await _repo.getNotification();
      if (response.isRight) {
        emit(state.copyWith(
          notificationStatus: FormzSubmissionStatus.success,
          notification: response.right.data.reversed.toList(),
        ));
        event.onSucces(response.right.data.reversed.toList());
      } else {
        emit(state.copyWith(notificationStatus: FormzSubmissionStatus.failure));
      }
    });

    on<GetGivenAmountEvent>((event, emit) async {
      emit(state.copyWith(givenStatus: FormzSubmissionStatus.inProgress));
      final response = await _repo.getGivenAmount();
      if (response.isRight) {
        emit(state.copyWith(
          givenStatus: FormzSubmissionStatus.success,
          givenAmount: response.right,
        ));
      } else {
        emit(state.copyWith(givenStatus: FormzSubmissionStatus.failure));
      }
    });

    on<GetBannedEvent>((event, emit) async {
      emit(state.copyWith(bannedStatus: FormzSubmissionStatus.inProgress));
      final response = await _repo.getBannedUsers();
      if (response.isRight) {
        emit(state.copyWith(
          bannedStatus: FormzSubmissionStatus.success,
          banneds: response.right,
        ));
      } else {
        emit(state.copyWith(bannedStatus: FormzSubmissionStatus.failure));
      }
    });

    on<GetPopularEvent>((event, emit) async {
      emit(state.copyWith(popularStatus: FormzSubmissionStatus.inProgress));
      final response = await _repo.getpopular();
      if (response.isRight) {
        emit(state.copyWith(
          popularStatus: FormzSubmissionStatus.success,
          popular: response.right.data,
        ));
      } else {
        emit(state.copyWith(popularStatus: FormzSubmissionStatus.failure));
      }
    });

    on<GetTakenAmountEvent>((event, emit) async {
      emit(state.copyWith(takenStatus: FormzSubmissionStatus.inProgress));
      final response = await _repo.getTakenAmount();
      if (response.isRight) {
        emit(state.copyWith(
          takenStatus: FormzSubmissionStatus.success,
          takenAmount: response.right,
        ));
      } else {
        emit(state.copyWith(takenStatus: FormzSubmissionStatus.failure));
      }
    });

    on<GetGraphicStatisticsEvent>((event, emit) async {
      emit(state.copyWith(graphicStatus: FormzSubmissionStatus.inProgress));
      final response = await _repo.getGraphicStatistics();
      if (response.isRight) {
        emit(state.copyWith(
          graphicStatus: FormzSubmissionStatus.success,
          graphicStatistics: response.right,
        ));
      } else {
        emit(state.copyWith(graphicStatus: FormzSubmissionStatus.failure));
      }
    });

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
