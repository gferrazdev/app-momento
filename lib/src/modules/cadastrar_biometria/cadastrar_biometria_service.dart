import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:momento/src/core/controllers/api_controller.dart';
import 'package:momento/src/core/services/custom_dio.dart';
import 'package:get/get.dart' as getx;

class CadastrarBiometriaService {
  final CustomDio customDio;
  CadastrarBiometriaService({required this.customDio});
  Future<Map<String, dynamic>> cadastrarBiometria(
      {required String fotoBenef,
      required String fotoBenefComDoc,
      required String carteira,
      required String latitude,
      required String longitude}) async {
    final apiController = getx.Get.find<APIController>();
    String url =
        "${apiController.urlBase}cadastrarBiometriaFacial.rule?sys=MOM";
    Map<String, dynamic> retorno = {};
    Map<String, dynamic> mapEnvio = {};
    mapEnvio['carteiraBeneficiario'] = carteira;
    mapEnvio['fotoBenefComDoc'] = fotoBenefComDoc;
    mapEnvio['fotoBase64'] = fotoBenef;
    mapEnvio['latitude'] = latitude;
    mapEnvio['longitude'] = longitude;
    var body = json.encode(mapEnvio);
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
