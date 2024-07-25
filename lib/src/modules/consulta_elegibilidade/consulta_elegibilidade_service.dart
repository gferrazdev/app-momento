import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:momento/src/core/controllers/api_controller.dart';
import 'package:momento/src/core/services/custom_dio.dart';
import 'package:get/get.dart' as getx;

class ConsultaElegibilidadeService {
  final CustomDio customDio;
  ConsultaElegibilidadeService({required this.customDio});
  Future<Map<String, dynamic>> consultaElegibillidade(
      {required String carteira}) async {
    final apiController = getx.Get.find<APIController>();
    String url = "${apiController.urlBase}consultaElegibilidade.rule?sys=MOM";
    Map<String, dynamic> retorno = {};
    Map<String, dynamic> mapEnvio = {};
    mapEnvio['carteiraBeneficiario'] = carteira;
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
      retorno = {
        'status': 'success',
        'nmBenef': 'Gabriel Moraes Ferraz',
      };
    } on DioException catch (e) {
      debugPrint('Erro ao cadastrar foto: $e');
      rethrow;
    }
    return retorno;
  }
}
