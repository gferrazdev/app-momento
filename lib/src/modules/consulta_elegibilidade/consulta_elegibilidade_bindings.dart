import 'package:get/get.dart';
import 'package:momento/src/modules/consulta_elegibilidade/consulta_elegibilidade_controller.dart';
import 'package:momento/src/modules/consulta_elegibilidade/consulta_elegibilidade_service.dart';

class ConsultaElegibilidadeBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(ConsultaElegibilidadeService(customDio: Get.find()));
    Get.put(ConsultaElegibilidadeController(
        consultaElegibilidadeService: Get.find(), gpsController: Get.find()));
  }
}
