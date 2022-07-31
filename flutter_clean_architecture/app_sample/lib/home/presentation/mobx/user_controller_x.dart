import 'package:app_sample/home/presentation/mobx/user_state.dart';
import 'package:core_networking/error/CatchDioExtensions.dart';
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
    await _usecase
        .getUsers()
        .then((value) => {state = UserSuccessStateX(users: value)})
        .catchFailure((failure, stacktrace) {
      state = UserErrorStateX(msg: failure.exception.message);
    });
  }

  void dispose() {
    this.dispose();
  }
}
