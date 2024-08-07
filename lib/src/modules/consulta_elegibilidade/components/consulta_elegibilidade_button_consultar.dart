import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:momento/src/core/controllers/gps_controller.dart';
import 'package:momento/src/core/theme/theme_colors.dart';
import 'package:momento/src/core/theme/theme_text_styles.dart';
import 'package:momento/src/core/ui/components/widgets.dart';
import 'package:momento/src/modules/consulta_elegibilidade/consulta_elegibilidade_controller.dart';

class ConsultaElegibilidadeButtonConsultar extends StatefulWidget {
  const ConsultaElegibilidadeButtonConsultar({super.key});

  @override
  State<ConsultaElegibilidadeButtonConsultar> createState() =>
      _ConsultaElegibilidadeButtonConsultarState();
}

class _ConsultaElegibilidadeButtonConsultarState
    extends State<ConsultaElegibilidadeButtonConsultar> {
  final controller = Get.find<ConsultaElegibilidadeController>();
  final gpsController = Get.find<GPSController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.carregando.value
          ? SharedWidgets.progressIndicator('Aguarde...')
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
                    if (controller.formKey.value.currentState!.validate()) {
                      await controller.consultarElegibilidade();
                    }
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Icon(
                            Icons.check_circle_outlined,
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
                            "Consultar Elegibilidade",
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
