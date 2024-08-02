import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:momento/src/core/app/app_material.dart';
import 'package:momento/src/core/controllers/api_controller.dart';
import 'package:momento/src/core/controllers/gps_controller.dart';
import 'package:momento/src/core/services/hive_service.dart';
import 'package:path_provider/path_provider.dart';
import 'src/core/services/custom_dio.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Directory document = await getApplicationDocumentsDirectory();
  Hive.init(document.path);
  await Hive.openBox<String>("endpoints");
  Get.put(HiveService());
  Get.put(CustomDio());
  Get.put(APIController());
  Get.put(GPSController());
  await ScreenUtil.ensureScreenSize(); 
  runApp(const AppMaterial());
}
