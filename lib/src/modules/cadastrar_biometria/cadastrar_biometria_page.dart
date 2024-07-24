import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:momento/src/core/theme/theme_colors.dart';
import 'package:momento/src/core/theme/theme_text_styles.dart';
import 'package:momento/src/modules/cadastrar_biometria/cadastrar_biometria_controller.dart';
import 'package:momento/src/modules/cadastrar_biometria/components/cad_bio_button_capturar.dart';
import 'package:momento/src/modules/cadastrar_biometria/components/cad_bio_button_capturar_doc_face.dart';
import 'package:momento/src/modules/cadastrar_biometria/components/cad_bio_button_enviar.dart';
import 'package:momento/src/modules/cadastrar_biometria/components/cad_bio_image_doc_face.dart';
import 'package:momento/src/modules/cadastrar_biometria/components/cad_bio_image_benef.dart';

class CadastrarBiometriaPage extends StatefulWidget {
  const CadastrarBiometriaPage({super.key});

  @override
  State<CadastrarBiometriaPage> createState() => _CadastrarBiometriaPageState();
}

class _CadastrarBiometriaPageState extends State<CadastrarBiometriaPage> {
  final controller = Get.find<CadastrarBiometriaController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Cadastrar Biometria Facial',
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
        body: Obx(
          () => ListView(
            children: [
              SizedBox(height: 50.h),
              const CadadastrarBiometriaButtonCapturar(),
              SizedBox(height: 30.h),
              controller.base64Image.value.isEmpty
                  ? Container()
                  : CadastroBiometricoImageBenef(
                      base64String: controller.base64Image.value),
              SizedBox(height: 30.h),
              const CadadastrarBiometriaButtonCapturarDocFace(),
              SizedBox(height: 30.h),
              controller.base64ImageDocFace.value.isEmpty
                  ? Container()
                  : CadastroBiometricoImageDocFace(
                      base64String: controller.base64ImageDocFace.value),
              SizedBox(height: 30.h),
              const CadadastrarBiometriaButtonEnviar(),
              SizedBox(height: 100.h),
            ],
          ),
        ),
      ),
    );
  }
}
