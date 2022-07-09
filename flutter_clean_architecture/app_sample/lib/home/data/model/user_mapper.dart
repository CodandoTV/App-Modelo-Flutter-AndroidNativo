import 'package:app_sample/home/data/model/user_response_model.dart';

import '../../domain/model/user_model.dart';

extension UserMapper on UserResponse {
  User toUser() {
    return User(
        code: this.code,
        name: this.name,
        description: this.description ?? "Text default");
  }
}
