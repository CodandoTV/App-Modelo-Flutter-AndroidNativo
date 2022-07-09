import 'package:app_sample/home/presentation/mobx/user_state.dart';
import 'package:core/core_module.dart';
import 'package:mobx/mobx.dart';

import '../../domain/user_usecase_list.dart';

part 'user_controller_x.g.dart';

class UserListControllerX = UserListControllerBaseX with _$UserListControllerX;

abstract class UserListControllerBaseX with Store {
  final UserUseCaseList _usecase = getIt<UserUseCaseList>();

  @observable
  ObservableFuture<UserListStateX> state =
      ObservableFuture.value(UserLoadingStateX());

  @action
  Future<UserListStateX> _loadUsers() async {
    return ObservableFuture.value(
        UserSuccessStateX(users: await _usecase.getUsers()));
  }

  void dispose() {
    this.dispose();
  }
}
