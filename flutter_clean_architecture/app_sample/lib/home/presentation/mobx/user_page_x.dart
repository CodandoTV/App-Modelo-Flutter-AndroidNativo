import 'package:app_sample/home/presentation/mobx/user_controller_x.dart';
import 'package:app_sample/home/presentation/mobx/user_state.dart';
import 'package:core/core_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../di/user_module.dart';

class UserListPageX extends StatefulWidget {
  const UserListPageX({Key? key}) : super(key: key);

  @override
  State<UserListPageX> createState() => _UserListPageXState();
}

class _UserListPageXState extends State<UserListPageX> {
  late UserListControllerX _controller;

  _UserListPageXState() {
    UserModule.init();
  }

  @override
  void initState() {
    super.initState();
    _controller = getIt<UserListControllerX>();
    _controller.loadUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("mobx"),
        ),
        body: Center(child: Observer(builder: (_) {
          switch (_controller.state.runtimeType) {
            case UserLoadingStateX:
              return CircularProgressIndicator();
            case UserErrorStateX:
              return Text(_controller.state.toStateError().msg);
            case UserSuccessStateX:
              final users = _controller.state.toStateSuccess().users;
              return ListView.builder(
                  itemCount: users.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(users[index].name),
                      subtitle: Text(users[index].description),
                    );
                  });
          }
          return Container();
        })));
  }

  @override
  void dispose() {
    _controller.dispose();
    UserModule.dispose();
    super.dispose();
  }
}
