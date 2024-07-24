
import 'dart:io';
import 'dart:typed_data';
import 'package:biopassid_face_sdk/biopassid_face_sdk.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:momento/src/core/theme/theme_colors.dart';
import 'package:momento/src/core/theme/theme_text_styles.dart';
import 'package:path_provider/path_provider.dart';

class FaceCameraScreen extends StatefulWidget {
  const FaceCameraScreen({super.key});

  @override
  State<FaceCameraScreen> createState() => _FaceCameraScreenState();
}

class _FaceCameraScreenState extends State<FaceCameraScreen> {
  late FaceController controller;

  @override
  void initState() {
    super.initState();
    final config = FaceConfig(licenseKey: 'SW8B-QNXV-X8XL-GBFA');
    config.faceDetection.enabled = true;
    config.faceDetection.autoCapture = true;
    config.faceDetection.timeToCapture = 3000;
    config.resolutionPreset = FaceResolutionPreset.medium;
    config.lensDirection = FaceCameraLensDirection.front;
    controller = FaceController(
      config: config,
      onFaceCapture: (Uint8List image)  async {
        File arquivoTemporario =  await salvarUint8ListComoArquivoTemporario(image, 'minha_foto.jpg');
        // Retorna a string Base64 para a página anterior
        Navigator.pop(context, arquivoTemporario);
      },
    );
    takeFace();
  }

  Future<File> salvarUint8ListComoArquivoTemporario(Uint8List dados, String nomeArquivo) async {
  // Obter o diretório temporário
  Directory diretorioTemporario = await getTemporaryDirectory();

  // Cria o caminho completo do arquivo
  String caminhoArquivo = '${diretorioTemporario.path}/$nomeArquivo';

  // Escrever os dados no arquivo
  File arquivoTemporario = File(caminhoArquivo);
  await arquivoTemporario.writeAsBytes(dados);

  return arquivoTemporario;
}

  void takeFace() async {
    debugPrint('takeFace');
    try {
      await controller.takeFace();
    } catch (e) {
      debugPrint(' Erro ao caputrar: ${e.toString()}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Caputrar Foto',
          style: ThemeTextStyles.getWhite45BoldStyle,
        ),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.arrow_back_ios_new_rounded,
              color: Colors.white, size: 45.h),
        ),
        backgroundColor: ThemeColors.roxoPadrao,
      ),
      body: Center(
        child: Text(
          'Aguarde',
          style: ThemeTextStyles.getBlack50Style,
        ),
      ),
    );
  }
}
