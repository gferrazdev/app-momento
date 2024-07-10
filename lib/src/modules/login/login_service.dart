import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:momento/src/core/controllers/api_controller.dart';
import 'package:momento/src/core/services/custom_dio.dart';
import 'package:momento/src/models/user_login_model.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart' as getx;

class LoginService {
  final CustomDio customDio;
  LoginService({required this.customDio});
  Future<Map<String, dynamic>> autenticar(
      {required UserLogin userLogin,
      required String latitude,
      required String longitude}) async {
    final apiController = getx.Get.find<APIController>();
    String url = "${apiController.urlBase}login.rule?sys=MOM";
    Map<String, dynamic> retorno = {};
    Map<String, dynamic> mapEnvio = {};
    mapEnvio['username'] = userLogin.username;
    mapEnvio['password'] = userLogin.password;
    mapEnvio['latitude'] = latitude;
    mapEnvio['longitude'] = longitude;
    var body = json.encode(mapEnvio);

    try {
      Response response;
      response = await customDio.post(url, body);
      debugPrint(response.data.toString());
      retorno = response.data;
    } on DioException catch (e) {
      debugPrint('Erro ao realizar login: $e');
      rethrow;
    }
    return retorno;
  }
}
