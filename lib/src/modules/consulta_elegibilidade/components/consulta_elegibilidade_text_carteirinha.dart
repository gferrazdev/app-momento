import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:momento/src/core/theme/theme_colors.dart';
import 'package:momento/src/core/theme/theme_text_styles.dart';
import 'package:momento/src/modules/consulta_elegibilidade/consulta_elegibilidade_controller.dart';
import 'package:validatorless/validatorless.dart';

class ConsultaElegibilidadeTextCarteirinha extends StatefulWidget {
  const ConsultaElegibilidadeTextCarteirinha({super.key});

  @override
  State<ConsultaElegibilidadeTextCarteirinha> createState() =>
      _ConsultaElegibilidadeTextCarteirinhaState();
}

class _ConsultaElegibilidadeTextCarteirinhaState
    extends State<ConsultaElegibilidadeTextCarteirinha> {
  final controller = Get.find<ConsultaElegibilidadeController>();
  @override
  Widget build(BuildContext context) {
    return Obx(() => Align(
          child: SizedBox(
            width: 900.w,
            height: 200.h,
            child: TextFormField(
              controller: controller.carteirinhaController.value,
              textAlign: TextAlign.start,
              style: ThemeTextStyles.getBlack45Style,
              keyboardType: TextInputType.number,
              validator: Validatorless.multiple(
                [
                  Validatorless.min(17, 'Carteirinha deve ter 17 caracteres'),
                  Validatorless.max(17, 'Carteirinha deve ter 17 caracteres'),
                  Validatorless.number('Somente números são permitidos'),	
                  Validatorless.required('A carteirinha é obrigatória'),
                ],
              ),
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
