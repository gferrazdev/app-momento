import 'package:get/get.dart';
import 'package:momento/src/modules/settings/settings_controller.dart';

class SettingsBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(SettingsController(
      hiveService: Get.find(),
      apiController: Get.find(),
    ));
  }
}
