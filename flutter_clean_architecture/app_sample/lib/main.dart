import 'package:app_sample/di/app_module.dart';
import 'package:flutter/material.dart';

import 'home/presentation/mobx/user_page_x.dart';

void main() {
  AppModule.init();
  runApp(AppSample());
}

class AppSample extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: UserListPageX(),
    );
  }
}
