import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:momento/src/core/controllers/gps_controller.dart';
import 'package:momento/src/core/ui/helpers/messages.dart';
import 'package:momento/src/modules/validar_biometria/validar_biometria_service.dart';

class ValidarBiometriaController extends GetxController {
  final ValidarBiometriaService validarBiometriaService;
  final GPSController gpsController;
  ValidarBiometriaController(
      {required this.gpsController, required this.validarBiometriaService});

  var carregando = false.obs;

  var formKey = GlobalKey<FormState>().obs;
  var carteirinhaController = TextEditingController().obs;

  var base64Image = ''.obs;

  final ImagePicker _picker = ImagePicker();

  @override
  void onInit() {
    super.onInit();
    obterCoordenadas();
  }

  Future<void> obterCoordenadas() async {
    await gpsController.obterCoordenadas();
  }

  Future<void> enviarDados() async {
    if (gpsController.latitude.value != 0.0 &&
        gpsController.longitude.value != 0.0) {
      await tirarFoto();
      if (base64Image.value.isNotEmpty) {
        carregando.value = true;
        Map<String, dynamic> retorno = {};
        try {
          retorno = await validarBiometriaService.validarBiometria(
              foto: base64Image.value,
              carteira: carteirinhaController.value.text,
              latitude: gpsController.latitude.value.toString(),
              longitude: gpsController.longitude.value.toString());
          if (retorno['status'] == 'error') {
            Messages.exibeMensagemErro(retorno['message']);
          } else {
            Messages.exibeMensagemSucesso(
                msg: 'Info', titulo: retorno['message']);
            Get.back();
          }
          carregando.value = false;
        } catch (e) {
          Messages.exibeMensagemErro('Erro ao enviar a Imagem');
          carregando.value = false;
        }
      } else {
        Get.snackbar(
            'Erro', 'Não foi possível obter todas as informações necessárias.');
      }
    } else {
      Get.snackbar('Erro', 'Coordenadas GPS não obtidas.');
    }
  }

  Future<void> tirarFoto() async {
    try {
      final pickedFile = await _picker.pickImage(source: ImageSource.camera);

      if (pickedFile != null) {
        File image = File(pickedFile.path);
        List<int> imageBytes = await image.readAsBytes();
        base64Image.value = base64Encode(imageBytes);
      } else {
        Get.snackbar('Erro', 'Nenhuma foto foi tirada.');
      }
    } catch (e) {
      Get.snackbar('Erro', 'Falha ao capturar imagem: $e');
    }
  }
}
