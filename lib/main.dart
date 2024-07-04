import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:momento/src/core/app/app_material.dart';
import 'package:momento/src/core/controllers/api_controller.dart';
import 'package:momento/src/core/controllers/gps_controller.dart';
import 'src/core/services/custom_dio.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(CustomDio());
  Get.put(APIController());
  Get.put(GPSController());
  await ScreenUtil.ensureScreenSize();
  runApp(const AppMaterial());
}
