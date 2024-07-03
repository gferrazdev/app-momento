import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:momento/src/core/theme/theme_colors.dart';
import 'package:momento/src/core/theme/theme_text_styles.dart';
import 'package:momento/src/modules/login/login_controller.dart';
import 'package:validatorless/validatorless.dart';

class LoginTextPassword extends StatefulWidget {
  const LoginTextPassword({super.key});

  @override
  State<LoginTextPassword> createState() => _LoginTextPasswordState();
}

class _LoginTextPasswordState extends State<LoginTextPassword> {
  final controller = Get.find<LoginController>();
  bool obscureText = true;
  void _changeObscureText() {
    setState(() {
      obscureText = !obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => Align(
          child: SizedBox(
            width: 800.w,
            height: 200.h,
            child: TextFormField(
              enabled: true,
              obscureText: obscureText,
              controller: controller.passwordController.value,
              textAlign: TextAlign.start,
              style: ThemeTextStyles.getBlack45Style,
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
              validator: Validatorless.required('Preencha a senha'),
              decoration: InputDecoration(
                labelText: 'Senha',
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
                suffixIcon: IconButton(
                  onPressed: _changeObscureText,
                  icon: Icon(
                    obscureText ? Icons.visibility : Icons.visibility_off,
                    color: ThemeColors.cinzaEscuro,
                    size: 70.h,
                  ),
                ),
                labelStyle: ThemeTextStyles.getPurple45BoldStyle,
              ),
            ),
          ),
        ));
  }
}
