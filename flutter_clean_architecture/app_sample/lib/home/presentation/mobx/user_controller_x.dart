import 'package:app_sample/home/presentation/mobx/user_state.dart';
import 'package:mobx/mobx.dart';

import '../../domain/user_usecase_list.dart';

part 'user_controller_x.g.dart';

class UserListControllerX extends UserListControllerBaseX
    with _$UserListControllerX {
  UserListControllerX(super._usecase);
}

abstract class UserListControllerBaseX with Store {
  final UserUseCaseList _usecase;

  UserListControllerBaseX(this._usecase);

  @observable
  UserListStateX state = UserLoadingStateX();

  @action
  Future<void> loadUsers() async {
    state = UserSuccessStateX(users: await _usecase.getUsers());
  }

  void dispose() {
    this.dispose();
  }
}
