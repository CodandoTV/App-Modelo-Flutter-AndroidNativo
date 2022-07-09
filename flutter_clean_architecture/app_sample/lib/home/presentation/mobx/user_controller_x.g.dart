// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_controller_x.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$UserListControllerX on UserListControllerBaseX, Store {
  late final _$stateAtom =
      Atom(name: 'UserListControllerBaseX.state', context: context);

  @override
  ObservableFuture<UserListStateX> get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(ObservableFuture<UserListStateX> value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  late final _$_loadUsersAsyncAction =
      AsyncAction('UserListControllerBaseX._loadUsers', context: context);

  @override
  Future<UserListStateX> _loadUsers() {
    return _$_loadUsersAsyncAction.run(() => super._loadUsers());
  }

  @override
  String toString() {
    return '''
state: ${state}
    ''';
  }
}
