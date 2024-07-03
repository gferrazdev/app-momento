import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:momento/src/core/app/app_material.dart';
import 'package:momento/src/core/controllers/api_controller.dart';
import 'src/core/services/custom_dio.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //await dotenv.load(fileName: ".env");
  Get.put(CustomDio());
  Get.put(APIController());
  runApp(const AppMaterial());
}
