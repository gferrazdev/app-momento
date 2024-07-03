import 'package:get/get.dart';
import 'package:momento/src/modules/cadastrar_biometria/cadastrar_biometria_controller.dart';
import 'package:momento/src/modules/cadastrar_biometria/cadastrar_biometria_service.dart';

class CadastrarBiometriaBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(CadastrarBiometriaService(customDio: Get.find()));
    Get.put(CadastrarBiometriaController(cadastrarBiometriaService: Get.find())); 
  }
}