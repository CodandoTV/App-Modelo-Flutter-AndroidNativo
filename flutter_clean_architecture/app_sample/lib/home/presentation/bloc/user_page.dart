import 'package:core/core_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../di/user_module.dart';
import 'user_controller.dart';
import 'user_state.dart';

class UserListPage extends StatefulWidget {
  const UserListPage({Key? key}) : super(key: key);

  @override
  State<UserListPage> createState() => _UserListPageState();
}

class _UserListPageState extends State<UserListPage> {
  late UserController _bloc;

  _UserListPageState() {
    UserModule.init();
  }

  @override
  void initState() {
    super.initState();
    _bloc = getIt<UserController>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("CodandoTV"),
        ),
        body: Center(child: observerListen()));
  }

  observerListen() {
    return BlocListener<UserController, UserListState>(
        bloc: _bloc,
        listener: (context, state) {
          ScaffoldMessenger.of(context).removeCurrentSnackBar();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("fala galera, blz?"),
            ),
          );
        },
        child: observer());
  }

  observer() {
    return BlocBuilder<UserController, UserListState>(
        bloc: _bloc,
        builder: (context, state) {
          if (state is UserSuccessState) {
            final users = state.users;
            return ListView.builder(
                itemCount: users.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(state.users[index].name),
                    subtitle: Text(state.users[index].description),
                  );
                });
          } else if (state is UserLoadingState) {
            return Center(child: CircularProgressIndicator());
          }
          return Container();
        });
  }

  @override
  void dispose() {
    _bloc.close();
    UserModule.dispose();
    super.dispose();
  }
}
