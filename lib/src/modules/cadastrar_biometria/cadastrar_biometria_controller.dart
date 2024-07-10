import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:momento/src/core/controllers/gps_controller.dart';
import 'package:momento/src/core/ui/helpers/messages.dart';
import 'package:momento/src/modules/cadastrar_biometria/cadastrar_biometria_service.dart';
import 'package:momento/src/core/ui/face_camera.dart';

class CadastrarBiometriaController extends GetxController {
  final CadastrarBiometriaService cadastrarBiometriaService;
  final GPSController gpsController;
  CadastrarBiometriaController(
      {required this.gpsController, required this.cadastrarBiometriaService});

  var carregando = false.obs;

  var formKey = GlobalKey<FormState>().obs;
  var carteirinhaController = TextEditingController().obs;

  var base64Image = ''.obs;

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

  Future<void> enviarDados() async {
    if (base64Image.value.isNotEmpty) {
      if (gpsController.latitude.value != 0.0 &&
          gpsController.longitude.value != 0.0) {
        carregando.value = true;
        Map<String, dynamic> retorno = {};
        try {
          retorno = await cadastrarBiometriaService.cadastrarBiometria(
              foto: base64Image.value,
              carteira: carteirinhaController.value.text,
              latitude: gpsController.latitude.value.toString(),
              longitude: gpsController.longitude.value.toString());
          debugPrint(retorno.toString());
          if (retorno['status'] == 'error') {
            Messages.exibeMensagemErro(retorno['message']);
          } else {
            Get.back();
            Messages.exibeMensagemSucesso(
                msg: retorno['message'], titulo: 'Cadastro Biométrico');
          }
          carregando.value = false;
        } catch (e) {
          Messages.exibeMensagemErro('Erro ao enviar a Imagem');
          carregando.value = false;
          debugPrint(e.toString());
        }
      } else {
        Messages.exibeMensagemErro('Coordenadas GPS não obtidas.');
      }
    } else {
      Messages.exibeMensagemErro('Nenhuma imagem foi capturada.');
    }
  }

  Future<void> tirarFoto() async {
    try {
      File? capturedImage = await Navigator.of(Get.context!).push(
        MaterialPageRoute(
          builder: (context) => const FaceCameraScreen(),
        ),
      );

      if (capturedImage != null) {
        List<int> imageBytes = await capturedImage.readAsBytes();
        base64Image.value = base64Encode(imageBytes);
      }
    } catch (e) {
      Messages.exibeMensagemErro('Falha ao capturar imagem');
    }
  }
}
