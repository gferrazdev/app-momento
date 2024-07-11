import 'dart:typed_data';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:momento/src/modules/cadastrar_biometria/cadastrar_biometria_controller.dart';

class CadastroBiometricoImageCarteirinha extends StatefulWidget {
  final String base64String;

  const CadastroBiometricoImageCarteirinha({super.key, required this.base64String});

  @override
  State<CadastroBiometricoImageCarteirinha> createState() => _CadastroBiometricoImageCarteirinhaState();
}

class _CadastroBiometricoImageCarteirinhaState extends State<CadastroBiometricoImageCarteirinha> {
  final controller = Get.find<CadastrarBiometriaController>();
  @override
  Widget build(BuildContext context) {
    Uint8List imageBytes =
        controller.imageFromBase64String(widget.base64String);
    return Align(
      child: SizedBox(
        height: 450.h,
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
