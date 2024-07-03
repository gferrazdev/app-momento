import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:momento/src/core/app/app_routes.dart';
import 'package:momento/src/core/controllers/api_controller.dart';
import 'package:momento/src/models/user_login_model.dart';
import 'package:momento/src/modules/login/login_service.dart';

class LoginController extends GetxController {
  final LoginService loginService;
  LoginController({required this.loginService});

  var formKey = GlobalKey<FormState>().obs;
  var userNameController = TextEditingController().obs;
  var passwordController = TextEditingController().obs;
  var carregando = false.obs;

  void login() async {
    carregando.value = true;
    UserLogin userLogin = UserLogin(
      username: userNameController.value.text,
      password: passwordController.value.text,
    );
    Map<String, dynamic> retorno = {};
    retorno = await loginService.autenticar(userLogin);
    carregando.value = false;
    if (retorno.containsKey('token')) {
      final apiController = Get.find<APIController>();
      apiController.token.value = retorno['token'];
      Get.offAndToNamed(AppRoutes.HOME);
    }
    debugPrint(retorno.toString());
  }
}
