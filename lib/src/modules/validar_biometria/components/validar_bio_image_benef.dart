import 'dart:typed_data';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:momento/src/modules/validar_biometria/validar_biometria_controller.dart';

class ValidarBiometriaImageBenef extends StatefulWidget {
  final String base64String;

  const ValidarBiometriaImageBenef({super.key, required this.base64String});

  @override
  State<ValidarBiometriaImageBenef> createState() =>
      _ValidarBiometriaImageBenefState();
}

class _ValidarBiometriaImageBenefState
    extends State<ValidarBiometriaImageBenef> {
  final controller = Get.find<ValidarBiometriaController>();
  @override
  Widget build(BuildContext context) {
    Uint8List imageBytes =
        controller.imageFromBase64String(widget.base64String);
    return Align(
      child: SizedBox(
        height: 900.h,
        width: 900.w,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(
              15.h), // Define o raio das bordas arredondadas
          child: Image.memory(
            imageBytes,
            fit: BoxFit.fitWidth,
          ),
        ),
      ),
    );
  }
}
