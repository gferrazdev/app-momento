import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../theme/theme_colors.dart';
import '../../theme/theme_text_styles.dart';

class Messages {
  static void exibeMensagemErro(String msg) {
    Get.snackbar("Erro:", msg,
        maxWidth: double.infinity,
        padding: EdgeInsets.all(30.w),
        borderRadius: 4,
        duration: const Duration(seconds: 5),
        backgroundColor: ThemeColors.errorColor,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM);
  }

  static void exibeMensagemSucesso(
      {required String titulo, required String msg}) {
    Get.snackbar(titulo, msg,
        maxWidth: double.infinity,
        padding: EdgeInsets.all(30.w),
        borderRadius: 4,
        duration: const Duration(seconds: 5),
        backgroundColor: ThemeColors.verdePadrao,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM);
  }

  static void exibeDefaultDialog(
      {required String title,
      required String middleText,
      required String onConfirm,
      required String onCancel,
      required VoidCallback opcaoSim,
      required VoidCallback opcaoNao}) {
    Get.defaultDialog(
      title: title,
      contentPadding: const EdgeInsets.all(0),
      titlePadding: EdgeInsets.only(top: 60.h),
      middleText: middleText,
      actions: <Widget>[
        TextButton(
          onPressed: opcaoNao,
          child: Text(
            onCancel,
            style: TextStyle(color: Colors.black, fontSize: 45.sp),
          ),
        ),
        TextButton(
          onPressed: opcaoSim,
          child: Text(
            onConfirm,
            style: TextStyle(color: Colors.black, fontSize: 45.sp),
          ),
        ),
      ],
    );
  }

  static void alertarAguardandoOK(
      {required String title,
      required String content,
      required bool success,
      required VoidCallback f}) {
    Get.defaultDialog(
      title: title,
      titleStyle: success
          ? ThemeTextStyles.getGreen45BoldStyle
          : ThemeTextStyles.getError45BoldStyle,
      contentPadding: EdgeInsets.fromLTRB(40.w, 50.h, 20.w, 0),
      titlePadding: EdgeInsets.only(top: 20.h),
      middleText: content,
      middleTextStyle: ThemeTextStyles.getBlack35Style,
      backgroundColor: Colors.grey[300],
      actions: <Widget>[
        TextButton(
          onPressed: f,
          child: Text(
            'Fechar',
            style: ThemeTextStyles.getBlack35BoldStyle,
          ),
        ),
      ],
    );
  }
}
