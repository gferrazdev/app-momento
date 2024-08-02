import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:momento/src/core/theme/theme_colors.dart';
import 'package:momento/src/core/theme/theme_text_styles.dart';
import 'package:momento/src/modules/settings/components/button_salvar.dart';
import 'package:momento/src/modules/settings/components/textform_endpoint.dart';
import 'package:momento/src/modules/settings/settings_controller.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final controller = Get.find<SettingsController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ThemeColors.roxoPadrao,
        title: Text(
          'Configurações',
          style: ThemeTextStyles.getWhite45BoldStyle,
        ),
         leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(Icons.arrow_back_ios_new_rounded,
                color: Colors.white, size: 45.h),
          ),
      ),
      body: Form(
        key: controller.key.value,
        child: ListView(
        
          children: [
            SizedBox(
              height: 100.h,
            ),
            Center(
              child: Text(
                'Digite o endpoint:',
                style: ThemeTextStyles.getBlack45BoldStyle,
              ),
            ),
            SizedBox(
              height: 50.h,
            ),
            const TextformEndpoint(),
            SizedBox(
              height: 50.h,
            ),
            const ButtonSalvar(),
          ],
        ),
      ),
    );
  }
}
