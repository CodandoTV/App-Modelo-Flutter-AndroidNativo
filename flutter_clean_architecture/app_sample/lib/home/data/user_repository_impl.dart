
import 'package:app_sample/home/data/model/user_mapper.dart';
import 'package:app_sample/home/data/service/user_api_datasource.dart';

import '../domain/user_repository.dart';
import '../domain/model/user_model.dart';

class UserRepositoryImpl implements UserRepository {
  final UserApi _service;

  UserRepositoryImpl(this._service);

  @override
  Future<List<User>> getUsers() {
    return _service.getUsers().then((users) => users
        .map((userResponse) => UserMapper(userResponse).toUser())
        .toList());
  }

  @override
  Future<List<User>> getUsersDetail() {
    // TODO: implement getUsersDetail
    throw UnimplementedError();
  }

  @override
  Future<List<User>> insertDetail() {
    // TODO: implement insertDetail
    throw UnimplementedError();
  }
}
