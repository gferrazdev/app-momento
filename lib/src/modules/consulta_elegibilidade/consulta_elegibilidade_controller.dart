import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:momento/src/core/app/app_routes.dart';
import 'package:momento/src/core/controllers/gps_controller.dart';
import 'package:momento/src/core/ui/helpers/messages.dart';
import 'package:momento/src/modules/consulta_elegibilidade/consulta_elegibilidade_service.dart';

class ConsultaElegibilidadeController extends GetxController {
  final ConsultaElegibilidadeService consultaElegibilidadeService;
  final GPSController gpsController;
  ConsultaElegibilidadeController(
      {required this.gpsController,
      required this.consultaElegibilidadeService});

  var carregando = false.obs;

  var formKey = GlobalKey<FormState>().obs;
  var carteirinhaController = TextEditingController().obs;

  @override
  void onInit() {
    super.onInit();
    obterCoordenadas();
  }

  Future<void> obterCoordenadas() async {
    await gpsController.obterCoordenadas();
  }

  Uint8List imageFromBase64String(String base64String) {
    return base64Decode(base64String);
  }

  Future<void> consultarElegibilidade() async {
    if (gpsController.latitude.value != 0.0 &&
        gpsController.longitude.value != 0.0) {
      carregando.value = true;
      Map<String, dynamic> retorno = {};
      try {
        retorno = await consultaElegibilidadeService.consultaElegibillidade(
            carteira: carteirinhaController.value.text,
            latitude: gpsController.latitude.value.toString(),
            longitude: gpsController.longitude.value.toString());
        debugPrint(retorno.toString());
        if (retorno['status'] == 'error') {
          Messages.alertarAguardandoOK(
              title: retorno['message'],
              content: retorno['dados']['glosa'],
              success: false,
              f: () {
                Get.back();
              });
        } else {
          Get.toNamed(AppRoutes.CADASTRAR_BIOMETRIA, arguments: {
            'carteira': carteirinhaController.value.text,
            'nomeBenef': retorno['dados']['nomeBeneficiario']
          });
        }
        carregando.value = false;
      } catch (e) {
        Messages.alertarAguardandoOK(
            title: 'Erro ao consultar elegibilidade',
            content: e.toString(),
            success: false,
            f: () {
              Get.back();
            });
        carregando.value = false;
        debugPrint(e.toString());
      }
    } else {
      Messages.alertarAguardandoOK(
          title: 'Erro ao Verificar Coordenadas',
          content: 'Coordenadas GPS não obtidas.',
          success: false,
          f: () {
            Get.back();
          });
    }
  }
}