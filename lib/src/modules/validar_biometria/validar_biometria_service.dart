import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:momento/src/core/controllers/api_controller.dart';
import 'package:momento/src/core/services/custom_dio.dart';
import 'package:get/get.dart' as getx;

class ValidarBiometriaService {
  final CustomDio customDio;
  ValidarBiometriaService({required this.customDio});
  Future<Map<String, dynamic>> validarBiometria(
      {required String foto,
      required String carteira,
      required String latitude,
      required String longitude}) async {
    final apiController = getx.Get.find<APIController>();
    String url =
        "${apiController.urlBase}verificarBiometriaFacial.rule?sys=MOM";
    Map<String, dynamic> retorno = {};
    Map<String, dynamic> mapEnvio = {};
    mapEnvio['carteiraBeneficiario'] = carteira;
    mapEnvio['fotoBase64'] = foto;
    mapEnvio['latitude'] = latitude;
    mapEnvio['longitude'] = longitude;
    var body = json.encode(mapEnvio);
    debugPrint(body.toString());
    try {
      BaseOptions currentOptions = customDio.getDioOptions();
      BaseOptions newOptions = currentOptions.copyWith(
          contentType: Headers.jsonContentType,
          headers: {'Authorization': 'Bearer ${apiController.token.value}'});
      customDio.setDioOptions(newOptions);
      Response response;
      response = await customDio.post(url, body);
      debugPrint(response.data.toString());
      retorno = response.data;
    } on DioException catch (e) {
      debugPrint('Erro ao cadastrar foto: $e');
      rethrow;
    }
    return retorno;
  }
}
