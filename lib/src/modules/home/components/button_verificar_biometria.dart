import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:momento/src/core/app/app_routes.dart';
import 'package:momento/src/core/theme/theme_colors.dart';
import 'package:momento/src/modules/home/home_controller.dart';
import '../../../core/theme/theme_text_styles.dart';

class ButtonVerificarBiometria extends StatefulWidget {
  const ButtonVerificarBiometria({super.key});

  @override
  State<ButtonVerificarBiometria> createState() =>
      _ButtonVerificarBiometriaState();
}

class _ButtonVerificarBiometriaState extends State<ButtonVerificarBiometria> {
  final controller = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(AppRoutes.VERIFICAR_BIOMETRIA);
      },
      child: Column(
        children: [
          Container(
            width: 500.w,
            height: 500.w,
            decoration: BoxDecoration(
              color: ThemeColors.roxoEscuro,
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.topRight,
                colors: [ThemeColors.roxoPadrao, ThemeColors.roxoClaro],
              ),
              image: const DecorationImage(
                image: AssetImage('img/pessoa.png'),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(10.h),
            ),
          ),
          SizedBox(height: 30.h),
          Text(
            'Verificar Biometria Facial',
            style: ThemeTextStyles.getPurple45BoldStyle,
          ),
        ],
      ),
    );
  }
}
