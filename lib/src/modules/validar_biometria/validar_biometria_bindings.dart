import 'package:get/get.dart';
import 'package:momento/src/modules/validar_biometria/validar_biometria_controller.dart';
import 'package:momento/src/modules/validar_biometria/validar_biometria_service.dart';

class ValidarBiometriaBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(ValidarBiometriaService(customDio: Get.find()));
    Get.put(ValidarBiometriaController(
        validarBiometriaService: Get.find(), gpsController: Get.find()));
  }
}
