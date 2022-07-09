import 'package:core/core_module.dart';
import 'package:core_networking/di/networking_module.dart';

class AppModule {
  AppModule._();

  static void init() {
    CoreModule.init();
    NetworkingModule.init();
  }
}
