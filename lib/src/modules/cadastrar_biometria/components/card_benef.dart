import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:momento/src/core/theme/theme_colors.dart';
import 'package:momento/src/core/theme/theme_text_styles.dart';
import 'package:momento/src/modules/cadastrar_biometria/cadastrar_biometria_controller.dart';

class CardBenef extends StatefulWidget {
  const CardBenef({super.key});

  @override
  State<CardBenef> createState() => _CardBenefState();
}

class _CardBenefState extends State<CardBenef> {
  final controller = Get.find<CadastrarBiometriaController>();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
          height: 150.h,
          decoration: BoxDecoration(   
            color: ThemeColors.roxoPadrao,         
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(160.h),
              bottomRight: Radius.circular(160.h),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.only(left: 45.w, top: 40.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 45.w),
                  child: Text(controller.nomeBenef.value,
                      style: ThemeTextStyles.getWhite50BoldStyle),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
