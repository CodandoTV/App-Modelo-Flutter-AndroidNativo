import 'package:equatable/equatable.dart';

import '../../domain/model/user_model.dart';

class UserListState extends Equatable {
  @override
  List<Object?> get props => [];
}

class UserLoadingState extends UserListState {}

class UserSuccessState extends UserListState {
  final List<User> users;

  UserSuccessState({required this.users});
}
