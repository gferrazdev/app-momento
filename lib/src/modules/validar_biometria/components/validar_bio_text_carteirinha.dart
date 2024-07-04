import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:momento/src/core/theme/theme_colors.dart';
import 'package:momento/src/core/theme/theme_text_styles.dart';
import 'package:momento/src/modules/validar_biometria/validar_biometria_controller.dart';
import 'package:validatorless/validatorless.dart';

class ValidarBiometriaTextCarteirinha extends StatefulWidget {
  const ValidarBiometriaTextCarteirinha({super.key});

  @override
  State<ValidarBiometriaTextCarteirinha> createState() => _ValidarBiometriaTextCarteirinhaState();
}

class _ValidarBiometriaTextCarteirinhaState extends State<ValidarBiometriaTextCarteirinha> {
  final controller = Get.find<ValidarBiometriaController>();
  @override
  Widget build(BuildContext context) {
    return Obx(() => Align(
          child: SizedBox(
            width: 800.w,
            height: 200.h,
            child: TextFormField(
              controller: controller.carteirinhaController.value,
              textAlign: TextAlign.start,
              style: ThemeTextStyles.getBlack45Style,
              keyboardType: TextInputType.text,
              validator:
                  Validatorless.required('O nome do usuário é obrigatório'),
              decoration: InputDecoration(
                labelText: 'Carteirinha',
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: ThemeColors.cinzaPadrao,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: ThemeColors.cinzaPadrao,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: ThemeColors.cinzaPadrao,
                  ),
                ),
                labelStyle: ThemeTextStyles.getPurple45BoldStyle,
              ),
            ),
          ),
        ));
  }
}
