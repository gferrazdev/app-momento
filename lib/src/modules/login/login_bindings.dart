import 'package:get/get.dart';
import 'package:momento/src/modules/login/login_controller.dart';
import 'package:momento/src/modules/login/login_service.dart';

class LoginBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(
      LoginService(
        customDio: Get.find(),
      ),
    );
    Get.put(
      LoginController(
        loginService: Get.find(),
      ),
    );
  }
}
