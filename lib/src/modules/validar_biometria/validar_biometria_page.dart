import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:momento/src/core/theme/theme_colors.dart';
import 'package:momento/src/core/theme/theme_text_styles.dart';
import 'package:momento/src/modules/validar_biometria/components/validar_bio_button_enviar.dart';
import 'package:momento/src/modules/validar_biometria/components/validar_bio_text_carteirinha.dart';
import 'package:momento/src/modules/validar_biometria/validar_biometria_controller.dart';

class ValidarBiometriaPage extends StatefulWidget {
  const ValidarBiometriaPage({super.key});

  @override
  State<ValidarBiometriaPage> createState() => _ValidarBiometriaPageState();
}

class _ValidarBiometriaPageState extends State<ValidarBiometriaPage> {
  final controller = Get.find<ValidarBiometriaController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Validar Biometria Facial',
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
          () => Form(
            key: controller.formKey.value,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 250.h),
                const ValidarBiometriaTextCarteirinha(),
                SizedBox(height: 50.h),
                const ValidarBiometriaButtonEnviar()
              ],
            ),
          ),
        ),
      ),
    );
  }
}