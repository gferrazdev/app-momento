import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:momento/src/core/theme/theme_colors.dart';
import 'package:momento/src/core/theme/theme_text_styles.dart';
import 'package:momento/src/modules/home/components/button_cadastrar_biometria.dart';
import 'package:momento/src/modules/home/components/button_verificar_biometria.dart';
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
            SizedBox(
              width: double.infinity,
              child: Card(
                margin: const EdgeInsets.all(0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(160.h),
                    bottomRight: Radius.circular(160.h),
                  ),
                ),
                elevation: 4,
                child: Container(
                  height: 450.h,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [ThemeColors.roxoClaro, ThemeColors.roxoPadrao],
                    ),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(160.h),
                      bottomRight: Radius.circular(160.h),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(left: 45.w, top: 40.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 45.w),
                          child: Text('Nome Fantasia do Prestador',
                              style: ThemeTextStyles.getWhite50BoldStyle),
                        ),
                        SizedBox(
                          height: 45.h,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 45.w),
                          child: Text('Especialidade',
                              style: ThemeTextStyles.getWhite40BoldStyle),
                        ),
                        SizedBox(
                          height: 45.h,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 45.w),
                          child: Text('Área de Atuação',
                              style: ThemeTextStyles.getWhite40BoldStyle),
                        ),
                        SizedBox(
                          height: 45.h,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 45.w),
                          child: Text(
                              'Validação do GPS: Dentro da área de cobertura',
                              style: ThemeTextStyles.getWhite40BoldStyle),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
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
