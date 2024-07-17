import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:momento/src/core/controllers/gps_controller.dart';
import 'package:momento/src/core/theme/theme_colors.dart';
import 'package:momento/src/core/theme/theme_text_styles.dart';
import 'package:momento/src/modules/cadastrar_biometria/cadastrar_biometria_controller.dart';

class CadadastrarBiometriaButtonCapturar extends StatefulWidget {
  const CadadastrarBiometriaButtonCapturar({super.key});

  @override
  State<CadadastrarBiometriaButtonCapturar> createState() =>
      _CadadastrarBiometriaButtonCapturarState();
}

class _CadadastrarBiometriaButtonCapturarState extends State<CadadastrarBiometriaButtonCapturar> {
  final controller = Get.find<CadastrarBiometriaController>();
  final gpsController = Get.find<GPSController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.carregando.value
          ? Container()
          : Align(
              child: SizedBox(
                width: 900.w,
                height: 125.h,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 10,
                    backgroundColor: ThemeColors.roxoPadrao,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.h),
                    ),
                  ),
                  onPressed: () async {
                    await controller.tirarFoto();
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Icon(
                            Icons.camera_alt_outlined,
                            color: Colors.white,
                            size: 70.h,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 80.w,
                      ),
                      Text(
                            "Capturar Biometria Facial",
                            style: ThemeTextStyles.getWhite45BoldStyle,
                          )
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
