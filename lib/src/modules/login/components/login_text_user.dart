import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:momento/src/core/theme/theme_colors.dart';
import 'package:momento/src/core/theme/theme_text_styles.dart';
import 'package:momento/src/modules/login/login_controller.dart';
import 'package:validatorless/validatorless.dart';

class LoginTextUser extends StatefulWidget {
  const LoginTextUser({super.key});

  @override
  State<LoginTextUser> createState() => _LoginTextUserState();
}

class _LoginTextUserState extends State<LoginTextUser> {
  final controller = Get.find<LoginController>();
  @override
  Widget build(BuildContext context) {
    return Obx(() => Align(
          child: SizedBox(
            width: 800.w,
            height: 200.h,
            child: TextFormField(
              enabled: true,
              obscureText: false,
              controller: controller.userNameController.value,
              textAlign: TextAlign.start,
              style: ThemeTextStyles.getBlack45Style,
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
              validator:
                  Validatorless.required('O nome do usuário é obrigatório'),
              decoration: InputDecoration(
                labelText: 'Usuário',
                border: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: ThemeColors.cinzaPadrao,
                  ),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: ThemeColors.cinzaPadrao,
                  ),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: ThemeColors.cinzaPadrao,
                  ),
                ),
                labelStyle: ThemeTextStyles.getPurple45BoldStyle,
              ),
            ),
          ),
        ));
  }
}
