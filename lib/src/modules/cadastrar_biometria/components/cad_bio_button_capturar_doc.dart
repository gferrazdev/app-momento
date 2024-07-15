import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:momento/src/core/theme/theme_colors.dart';
import 'package:momento/src/core/theme/theme_text_styles.dart';
import 'package:momento/src/modules/cadastrar_biometria/cadastrar_biometria_controller.dart';

class CadadastrarBiometriaButtonCapturarDoc extends StatefulWidget {
  const CadadastrarBiometriaButtonCapturarDoc({super.key});

  @override
  State<CadadastrarBiometriaButtonCapturarDoc> createState() =>
      _CadadastrarBiometriaButtonCapturarDocState();
}

class _CadadastrarBiometriaButtonCapturarDocState extends State<CadadastrarBiometriaButtonCapturarDoc> {
  final controller = Get.find<CadastrarBiometriaController>();

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
                  onPressed: ()  {
                   controller.capturarDocumento();
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Icon(
                            Icons.file_copy,
                            color: Colors.white,
                            size: 70.h,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 80.w,
                      ),
                      Flexible(
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            "Capturar Documento",
                            style: ThemeTextStyles.getWhite45BoldStyle,
                          ),
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
