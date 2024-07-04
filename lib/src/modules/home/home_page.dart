import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:momento/src/modules/home/components/button_cadastrar_biometria.dart';
import 'package:momento/src/modules/home/components/button_verificar_biometria.dart';
import 'package:momento/src/modules/home/components/card_prestador.dart';
import 'package:momento/src/modules/home/home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const CardPrestador(),
            SizedBox(height: 220.h),
            const ButtonCadastrarBiometria(),
            SizedBox(height: 30.h),
            const ButtonVerificarBiometria()
          ],
        ),
      ),
    );
  }
}
