
import 'package:app_sample/home/domain/user_repository.dart';

import 'model/user_model.dart';

abstract class UserUseCaseList {
  Future<List<User>> getUsers();
}

class UserUseCaseListImpl implements UserUseCaseList {
  final UserRepositoryList _repository;

  UserUseCaseListImpl(this._repository);

  @override
  Future<List<User>> getUsers() {
    return _repository.getUsers();
  }
}
