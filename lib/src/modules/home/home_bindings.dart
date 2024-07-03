import 'package:get/get.dart';
import 'package:momento/src/modules/home/home_controller.dart';
import 'package:momento/src/modules/home/home_service.dart';

class HomeBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(HomeService(customDio: Get.find()));
    Get.put(HomeController(homeService: Get.find()));
  }
}
