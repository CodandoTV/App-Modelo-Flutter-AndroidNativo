import 'model/user_model.dart';

abstract class UserRepository
    implements UserRepositoryList, UserRepositoryDetail {}

abstract class UserRepositoryList {
  Future<List<User>> getUsers();
}

abstract class UserRepositoryDetail {
  Future<List<User>> getUsersDetail();
  Future<List<User>> insertDetail();
}
