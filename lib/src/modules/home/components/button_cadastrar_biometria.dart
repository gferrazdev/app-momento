import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:momento/src/core/theme/theme_colors.dart';
import 'package:momento/src/modules/home/home_controller.dart';
import '../../../core/theme/theme_text_styles.dart';

class ButtonCadastrarBiometria extends StatefulWidget {
  const ButtonCadastrarBiometria({super.key});

  @override
  State<ButtonCadastrarBiometria> createState() =>
      _ButtonCadastrarBiometriaState();
}

class _ButtonCadastrarBiometriaState extends State<ButtonCadastrarBiometria> {
  final controller = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Align(
        alignment: Alignment.topCenter,
        child: SizedBox(
          width: 950.w,
          height: 200.w,
          child: Card(
            elevation: 10,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(45.w),
              ),
            ),
            child: Row(
              children: [
                Container(
                  width: 180.w,
                  height: 200.w,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [ThemeColors.roxoClaro, ThemeColors.roxoPadrao],
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(45.w),
                    ),
                  ),
                  child: Icon(
                    Icons.camera_enhance,
                    color: Colors.white,
                    size: 60.h,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 60.w),
                    child: Text('Cadastrar Biometria',
                        style: ThemeTextStyles.getPurple45BoldStyle),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}