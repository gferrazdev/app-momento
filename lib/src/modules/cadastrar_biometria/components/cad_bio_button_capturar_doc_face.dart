import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:momento/src/core/theme/theme_colors.dart';
import 'package:momento/src/core/theme/theme_text_styles.dart';
import 'package:momento/src/modules/cadastrar_biometria/cadastrar_biometria_controller.dart';

class CadadastrarBiometriaButtonCapturarDocFace extends StatefulWidget {
  const CadadastrarBiometriaButtonCapturarDocFace({super.key});

  @override
  State<CadadastrarBiometriaButtonCapturarDocFace> createState() =>
      _CadadastrarBiometriaButtonCapturarDocFaceState();
}

class _CadadastrarBiometriaButtonCapturarDocFaceState
    extends State<CadadastrarBiometriaButtonCapturarDocFace> {
  final controller = Get.find<CadastrarBiometriaController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.carregando.value
          ? Container()
          : Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 100.w),
                  child: Center(
                    child: Text(
                        'Tire uma Foto do Rosto segurando o Documento de Identificação:',  
                        textAlign: TextAlign.center,                    
                        style: ThemeTextStyles.getBlack50BoldStyle),
                  ),
                ),
                SizedBox(height: 20.h),
                Align(
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
                      onPressed: () {
                        controller.capturarDocFace();
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible(
                            child: FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Icon(
                                Icons.face_retouching_natural_outlined,
                                color: Colors.white,
                                size: 70.h,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 80.w,
                          ),
                          Text(
                            "Capturar Rosto com Documento",
                            style: ThemeTextStyles.getWhite45BoldStyle,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
