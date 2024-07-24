import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:momento/src/core/controllers/gps_controller.dart';
import 'package:momento/src/core/ui/document_camera.dart';
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
  var base64ImageDoc = ''.obs;
  var base64Image = ''.obs;
  var base64ImageDocFace = ''.obs;

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
    if (base64Image.value.isNotEmpty &&
        base64ImageDoc.value.isNotEmpty &&
        base64ImageDocFace.value.isNotEmpty) {
      if (gpsController.latitude.value != 0.0 &&
          gpsController.longitude.value != 0.0) {
        carregando.value = true;
        Map<String, dynamic> retorno = {};
        try {
          retorno = await cadastrarBiometriaService.cadastrarBiometria(
              fotoBenef: base64Image.value,
              fotoDocumento: base64ImageDoc.value,
              fotoBenefComDoc: base64ImageDocFace.value,
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
          Messages.exibeMensagemErro(e.toString());
          carregando.value = false;
          debugPrint(e.toString());
        }
      } else {
        Messages.exibeMensagemErro('Coordenadas GPS não obtidas.');
      }
    } else {
      String mensagemErro = '';
      bool isBiometriaFacialCapturada = base64Image.value.isNotEmpty;
      bool isCarteirinhaCapturada = base64ImageDoc.value.isNotEmpty;
      bool isFotoComCarteirinhaCapturada = base64ImageDocFace.value.isNotEmpty;

      if (!isBiometriaFacialCapturada &&
          !isCarteirinhaCapturada &&
          !isFotoComCarteirinhaCapturada) {
        mensagemErro =
            'Você deve capturar a Biometria Facial, a Carteirinha e uma foto do rosto com um Documento de Identificação.';
      } else if (!isCarteirinhaCapturada &&
          isBiometriaFacialCapturada &&
          isFotoComCarteirinhaCapturada) {
        mensagemErro = 'Você deve capturar a Carteirinha.';
      } else if (!isBiometriaFacialCapturada &&
          isCarteirinhaCapturada &&
          isFotoComCarteirinhaCapturada) {
        mensagemErro = 'Você deve capturar a Biometria Facial.';
      } else if (!isFotoComCarteirinhaCapturada &&
          isBiometriaFacialCapturada &&
          isCarteirinhaCapturada) {
        mensagemErro =
            'Você deve capturar uma foto do rosto com um Documento de Identificação.';
      } else if (!isBiometriaFacialCapturada &&
          !isCarteirinhaCapturada &&
          isFotoComCarteirinhaCapturada) {
        mensagemErro = 'Você deve capturar a Biometria Facial e a Carteirinha.';
      } else if (isBiometriaFacialCapturada &&
          !isCarteirinhaCapturada &&
          !isFotoComCarteirinhaCapturada) {
        mensagemErro =
            'Você deve capturar a Carteirinha e uma foto do rosto com um Documento de Identificação.';
      } else if (!isBiometriaFacialCapturada &&
          isCarteirinhaCapturada &&
          !isFotoComCarteirinhaCapturada) {
        mensagemErro =
            'Você deve capturar a Biometria Facial e uma foto do rosto com um Documento de Identificação.';
      }

      if (mensagemErro.isNotEmpty) {
        Messages.exibeMensagemErro(mensagemErro);
      }
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

  Future<void> capturarDocumento() async {
    try {
      File? arquivo = await Navigator.of(Get.context!).push(
        MaterialPageRoute(
          builder: (context) => const CapturarCarteirinhaCam(),
        ),
      );

      if (arquivo != null) {
        // Ler bytes do arquivo
        Uint8List imageData = await arquivo.readAsBytes();

        // Converter para Base64
        String base64 = base64Encode(imageData);

        // Atualizar a variável reativa
        base64ImageDoc.value = base64;
      }
    } catch (e) {
      // Mostrar mensagem de erro
      Messages.exibeMensagemErro('Falha ao capturar imagem');
    }
  }

  Future<void> capturarDocFace() async {
    final picker = ImagePicker();

    try {
      final pickedFile = await picker.pickImage(
          source: ImageSource.camera,
          preferredCameraDevice: CameraDevice.front);

      if (pickedFile != null) {
        // Ler bytes do arquivo
        Uint8List imageData = await pickedFile.readAsBytes();

        // Converter para Base64
        String base64 = base64Encode(imageData);

        // Atualizar a variável reativa
        base64ImageDocFace.value = base64;
      }
    } catch (e) {
      // Mostrar mensagem de erro
      Messages.exibeMensagemErro('Falha ao capturar imagem');
    }
  }
}
