import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:momento/src/core/app/app_routes.dart';
import 'package:momento/src/core/controllers/api_controller.dart';
import 'package:momento/src/core/controllers/gps_controller.dart';
import 'package:momento/src/core/ui/helpers/messages.dart';
import 'package:momento/src/models/user_login_model.dart';
import 'package:momento/src/modules/login/login_service.dart';

class LoginController extends GetxController {
  final LoginService loginService;
  final GPSController gpsController;
  LoginController({required this.loginService, required this.gpsController});

  var formKey = GlobalKey<FormState>().obs;
  var userNameController = TextEditingController().obs;
  var passwordController = TextEditingController().obs;
  var carregando = false.obs;

  @override
  void onInit() {
    super.onInit();
    obterCoordenadas();
  }

  Future<void> obterCoordenadas() async {
    await gpsController.obterCoordenadas();
  }

  void login() async {
    if (gpsController.latitude.value != 0.0 &&
        gpsController.longitude.value != 0.0) {
      carregando.value = true;
      UserLogin userLogin = UserLogin(
        username: userNameController.value.text,
        password: passwordController.value.text,
      );
      try {
        Map<String, dynamic> retorno = {};
        retorno = await loginService.autenticar(
            userLogin: userLogin,
            latitude: gpsController.latitude.value.toString(),
            longitude: gpsController.longitude.value.toString());
        carregando.value = false;
        if (retorno.containsKey('token')) {
          final apiController = Get.find<APIController>();
          debugPrint('token: ${retorno['token']}');
          apiController.token.value = retorno['token'];
          Get.offAndToNamed(AppRoutes.HOME);
        } else {
          Messages.alertarAguardandoOK(
              title: 'Falha na Autenticação',
              content: retorno['message'],
              success: false,
              f: () {
                Get.back();
              });
        }
        debugPrint(retorno.toString());
      } catch (e) {
        Messages.alertarAguardandoOK(
            title: 'Erro ao autenticar.',
            content: e.toString(),
            success: false,
            f: () {
              Get.back();
            });
        carregando.value = false;
        debugPrint(e.toString());
      }
    } else {
      Messages.alertarAguardandoOK(
          title: 'Erro ao Verificar Coordenadas',
          content: 'Coordenadas GPS não obtidas.',
          success: false,
          f: () {
            Get.back();
          });
    }
  }
}
