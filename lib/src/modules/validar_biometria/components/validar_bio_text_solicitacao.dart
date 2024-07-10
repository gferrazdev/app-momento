import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:momento/src/core/theme/theme_colors.dart';
import 'package:momento/src/core/theme/theme_text_styles.dart';
import 'package:momento/src/modules/validar_biometria/validar_biometria_controller.dart';

class ValidarBiometriaTextSolicitacao extends StatefulWidget {
  const ValidarBiometriaTextSolicitacao({super.key});

  @override
  State<ValidarBiometriaTextSolicitacao> createState() =>
      _ValidarBiometriaTextSolicitacaoState();
}

class _ValidarBiometriaTextSolicitacaoState
    extends State<ValidarBiometriaTextSolicitacao> {
  final controller = Get.find<ValidarBiometriaController>();
  @override
  Widget build(BuildContext context) {
    return Obx(() => Align(
          child: SizedBox(
            width: 900.w,
            height: 200.h,
            child: TextFormField(
              enabled: false,
              controller: controller.solicitacaoController.value,
              textAlign: TextAlign.start,
              style: ThemeTextStyles.getBlack45Style,
              keyboardType: TextInputType.text,              
              decoration: InputDecoration(
                labelText: 'Solicitação',
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
