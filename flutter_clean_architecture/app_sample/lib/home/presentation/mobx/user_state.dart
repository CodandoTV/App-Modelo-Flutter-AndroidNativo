import 'package:equatable/equatable.dart';

import '../../domain/model/user_model.dart';

class UserListStateX extends Equatable {
  @override
  List<Object?> get props => [];
}

class UserLoadingStateX extends UserListStateX {}

class UserSuccessStateX extends UserListStateX {
  final List<User> users;

  UserSuccessStateX({required this.users});
}

class UserErrorStateX extends UserListStateX {
  final String msg;

  UserErrorStateX({required this.msg});
}


extension UserStateMapper on UserListStateX {
  UserSuccessStateX toStateSuccess() => this as UserSuccessStateX;
  UserErrorStateX toStateError() => this as UserErrorStateX;
}
