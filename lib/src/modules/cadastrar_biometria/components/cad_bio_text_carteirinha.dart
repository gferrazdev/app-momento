import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:momento/src/core/theme/theme_colors.dart';
import 'package:momento/src/core/theme/theme_text_styles.dart';
import 'package:momento/src/modules/cadastrar_biometria/cadastrar_biometria_controller.dart';
import 'package:validatorless/validatorless.dart';

class CadBioTextCarteirinha extends StatefulWidget {
  const CadBioTextCarteirinha({super.key});

  @override
  State<CadBioTextCarteirinha> createState() => _CadBioTextCarteirinhaState();
}

class _CadBioTextCarteirinhaState extends State<CadBioTextCarteirinha> {
  final controller = Get.find<CadastrarBiometriaController>();
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
