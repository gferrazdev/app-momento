import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:momento/src/core/theme/theme_text_styles.dart';
import 'package:momento/src/modules/settings/settings_controller.dart';
import 'package:validatorless/validatorless.dart';

class TextformEndpoint extends StatefulWidget {
  const TextformEndpoint({super.key});

  @override
  State<TextformEndpoint> createState() => _TextformEndpointState();
}

class _TextformEndpointState extends State<TextformEndpoint> {
  final controller = Get.find<SettingsController>();
  @override
  Widget build(BuildContext context) {
    return Align(
      child: SizedBox(
        width: 1000.w,
        height: 180.h,
        child: TextFormField(
          controller: controller.controllerEndpoint.value,
          obscureText: false,
          style: ThemeTextStyles.getBlack40Style,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            labelText: 'Endpoint WS',

          ),
          validator: Validatorless.required('Preencha o endpoint'),
        ),
      ),
    );
  }
}
