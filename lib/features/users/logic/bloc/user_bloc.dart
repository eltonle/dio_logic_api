// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:dio_logic_api/features/users/data/repositories/user_repository.dart';

import '../../data/models/user_model.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserRepository userRepository;
  UserBloc({
    required this.userRepository,
  }) : super(UserLoading()) {
    on<UserFetchEvent>(_userFetchEvent);
  }

  FutureOr<void> _userFetchEvent(
      UserFetchEvent event, Emitter<UserState> emit) async {
    emit(UserLoading());
    try {
      final result = await userRepository.getUsers();
      emit(UserLoaded(users: result.data));
    } catch (e) {
      emit(UserError(error: e.toString()));
    }
  }
}
