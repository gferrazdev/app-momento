import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:momento/src/core/theme/theme_colors.dart';
import 'package:momento/src/core/theme/theme_text_styles.dart';
import 'package:momento/src/modules/settings/settings_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ButtonSalvar extends StatefulWidget {
  const ButtonSalvar({super.key});

  @override
  State<ButtonSalvar> createState() => _ButtonSalvarState();
}

class _ButtonSalvarState extends State<ButtonSalvar> {
  final controller = Get.find<SettingsController>();
  @override
  Widget build(BuildContext context) {
    return Align(
      child: SizedBox(
        width: 1000.w,
        height: 120.h,
        child: ElevatedButton(
          onPressed: () async {
            if (controller.key.value.currentState!.validate()) {
              controller.updateEndPoint(controller.controllerEndpoint.value.text);
            }
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: ThemeColors.roxoPadrao,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
          child: Text(
            'Atualizar',
            style: ThemeTextStyles.getWhite45BoldStyle,
          ),
        ),
      ),
    );
  }
}
