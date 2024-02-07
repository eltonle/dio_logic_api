part of 'user_bloc.dart';

sealed class UserState {}

final class UserLoading extends UserState {}

final class UserLoaded extends UserState {
  final List<UserModel> users;

  UserLoaded({required this.users});
}

final class UserError extends UserState {
  final String error;

  UserError({required this.error});
}
