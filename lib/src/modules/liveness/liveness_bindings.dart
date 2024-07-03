import 'package:get/get.dart';
import 'package:momento/src/modules/liveness/liveness_controller.dart';
import 'package:momento/src/modules/liveness/liveness_service.dart';

class LivenessBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(LivenessService(customDio: Get.find()));
    Get.put(LivenessController(livenessService: Get.find()));
  }
}
