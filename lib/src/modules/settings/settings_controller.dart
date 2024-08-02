import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:momento/src/core/controllers/api_controller.dart';
import 'package:momento/src/core/services/hive_service.dart';
import 'package:momento/src/core/ui/helpers/messages.dart';

class SettingsController extends GetxController {
  final HiveService hiveService;
  final APIController apiController;
  SettingsController({required this.hiveService, required this.apiController});

  String get endpoint => apiController.urlBase.value;

  var controllerEndpoint = TextEditingController().obs;
  var key = GlobalKey<FormState>().obs;

  @override
  void onInit() {
    super.onInit();
    setEndPoint();
  }

  void setEndPoint() {
    controllerEndpoint.value.text = endpoint;
  }

  Future<void> updateEndPoint(String newValue) async {
    if (newValue.isNotEmpty && newValue != endpoint && newValue.trim() != '') {
      try {
        apiController.urlBase.value = newValue;
        hiveService.writeEndPoint(newValue);
        Messages.alertarAguardandoOK(
            title: 'Alteração de Parâmetro',
            content: 'Endpoint atualizado',
            success: true,
            f: () {
              Get.back();
               Get.back();
            });
      } catch (e) {
        Messages.exibeMensagemErro(e.toString());
      }
    }
  }
}
