import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/user_usecase_list.dart';
import 'user_event.dart';
import 'user_state.dart';

class UserController extends Bloc<UserListEvent, UserListState> {
  final UserUseCaseList _usecase;

  UserController(this._usecase) : super(UserLoadingState()) {
    on<UserListLoadEvent>(_loadList);
  }

  void _loadList(UserListLoadEvent event, Emitter<UserListState> emit) async {
    final _users = await _usecase.getUsers();
    emit(UserSuccessState(users: _users));
  }
}
