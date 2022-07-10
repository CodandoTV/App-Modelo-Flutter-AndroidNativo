import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/user_usecase_list.dart';
import 'user_state_c.dart';

class UserControllerC extends Cubit<UserListState> {
  final UserUseCaseList _usecase;

  UserControllerC(this._usecase) : super(UserLoadingState());

  Future<void> loadList() async {
    final _users = await _usecase.getUsers();
    emit(UserSuccessState(users: _users));
  }
}
