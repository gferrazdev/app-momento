import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:momento/src/core/controllers/gps_controller.dart';
import 'package:momento/src/core/ui/face_camera.dart';
import 'package:momento/src/core/ui/helpers/messages.dart';
import 'package:momento/src/modules/validar_biometria/validar_biometria_service.dart';

class ValidarBiometriaController extends GetxController {
  final ValidarBiometriaService validarBiometriaService;
  final GPSController gpsController;
  ValidarBiometriaController(
      {required this.gpsController, required this.validarBiometriaService});

  var carregando = false.obs;

  var formKey = GlobalKey<FormState>().obs;
  var solicitacaoController = TextEditingController().obs;
  var cdSolicitacao = ''.obs;
  var tipoSolicitacao = 0.obs;
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
          retorno = await validarBiometriaService.validarBiometria(
              foto: base64Image.value,
              solicitacao: solicitacaoController.value.text,
              tipoSolicitacao: tipoSolicitacao.value,
              latitude: gpsController.latitude.value.toString(),
              longitude: gpsController.longitude.value.toString());
          if (retorno['status'] == 'error') {
            Messages.exibeMensagemErro(retorno['message']);
          } else {
            Messages.alertarAguardandoOK(
                title: 'Validação Biométrica',
                content: retorno['message'],
                success: true,
                f: () {
                  Get.back();
                });
          }
          carregando.value = false;
        } catch (e) {
          Messages.alertarAguardandoOK(
              title: 'Erro ao Enviar a Imagem',
              content: e.toString(),
              success: false,
              f: () {
                Get.back();
              });
          carregando.value = false;
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
    } else {
      Messages.alertarAguardandoOK(
          title: 'Imagem não capturada',
          content: 'Capture uma foto com a câmera.',
          success: false,
          f: () {
            Get.back();
          });
    }
  }

  Future<void> tirarFoto() async {
    try {
      File? arquivo = await Navigator.of(Get.context!).push(
        MaterialPageRoute(
          builder: (context) => const FaceCameraScreen(),
        ),
      );

      if (arquivo != null) {
        // Ler bytes do arquivo
        Uint8List imageData = await arquivo.readAsBytes();

        // Converter para Base64
        String base64 = base64Encode(imageData);

        // Atualizar a variável reativa
        base64Image.value = base64;
      }
    } catch (e) {
      // Mostrar mensagem de erro
      Messages.exibeMensagemErro('Falha ao capturar imagem');
    }
  }
}
