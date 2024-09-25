part of 'users_bloc.dart';

sealed class UsersEvent {}

class GetContactsEvent extends UsersEvent {}

class GetOperationsEvent extends UsersEvent {}
