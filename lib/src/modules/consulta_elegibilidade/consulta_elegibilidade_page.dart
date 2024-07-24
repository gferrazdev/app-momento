import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:momento/src/core/theme/theme_colors.dart';
import 'package:momento/src/core/theme/theme_text_styles.dart';
import 'package:momento/src/modules/consulta_elegibilidade/components/consulta_elegibilidade_button_consultar.dart';
import 'package:momento/src/modules/consulta_elegibilidade/components/consulta_elegibilidade_text_carteirinha.dart';
import 'package:momento/src/modules/consulta_elegibilidade/consulta_elegibilidade_controller.dart';

class ConsultaElegibilidadePage extends StatefulWidget {
  const ConsultaElegibilidadePage({super.key});

  @override
  State<ConsultaElegibilidadePage> createState() =>
      _ConsultaElegibilidadePageState();
}

class _ConsultaElegibilidadePageState extends State<ConsultaElegibilidadePage> {
  final controller = Get.find<ConsultaElegibilidadeController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Consultar Elegibilidade',
            style: ThemeTextStyles.getWhite45BoldStyle,
          ),
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(Icons.arrow_back_ios_new_rounded,
                color: Colors.white, size: 45.h),
          ),
          backgroundColor: ThemeColors.roxoPadrao,
        ),
        body: Obx(
          () => Form(
            key: controller.formKey.value,
            child: ListView(
              children: [
                SizedBox(height: 50.h),
                const ConsultaElegibilidadeTextCarteirinha(),
                SizedBox(height: 30.h),
                const ConsultaElegibilidadeButtonConsultar(),
                SizedBox(height: 100.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
