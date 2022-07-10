import 'package:core/core_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../di/user_module.dart';
import 'user_controller_c.dart';
import 'user_state_c.dart';

class UserListPageC extends StatefulWidget {
  const UserListPageC({Key? key}) : super(key: key);

  @override
  State<UserListPageC> createState() => _UserListPageStateC();
}

class _UserListPageStateC extends State<UserListPageC> {
  late UserControllerC _controller;

  _UserListPageStateC() {
    UserModule.init();
  }

  @override
  void initState() {
    super.initState();
    _controller = getIt<UserControllerC>();
    _controller.loadList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("cubit"),
        ),
        body: Center(child: observerListen()));
  }

  observerListen() {
    return BlocListener<UserControllerC, UserListState>(
        bloc: _controller,
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
    return BlocBuilder<UserControllerC, UserListState>(
        bloc: _controller,
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
    _controller.close();
    UserModule.dispose();
    super.dispose();
  }
}
