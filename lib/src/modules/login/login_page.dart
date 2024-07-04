import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:momento/src/core/theme/theme_text_styles.dart';
import 'package:momento/src/modules/login/components/custom_banner_bottom.dart';
import 'package:momento/src/modules/login/components/custom_banner_top.dart';
import 'package:momento/src/modules/login/components/login_button_entrar.dart';
import 'package:momento/src/modules/login/components/login_text_password.dart';
import 'package:momento/src/modules/login/components/login_text_user.dart';
import 'package:momento/src/modules/login/login_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final controller = Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Obx(
        () => Form(
          key: controller.formKey.value,
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  children: [
                    Column(
                      children: [
                        const CustomBannerTop(),
                        SizedBox(height: 150.h),
                        Center(
                          child: Text(
                            '[ Momento Tecnologia ]',
                            style: ThemeTextStyles.getPurple50BoldStyle,
                          ),
                        ),
                        SizedBox(height: 100.h),
                        const LoginTextUser(),
                        SizedBox(height: 10.h),
                        const LoginTextPassword(),
                        SizedBox(height: 100.h),
                        const LoginButtonEntrar(),
                      ],
                    ),
                  ],
                ),
              ),
            // Este widget ficará no final da página
            ],
          ),
        ),
      ),
    );
  }
}
