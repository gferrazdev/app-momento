import 'package:momento/src/core/services/custom_dio.dart';

class HomeService {
  final CustomDio customDio;
  HomeService({required this.customDio});
  Future<Map<String, dynamic>> getCoordenadas() async {
    Map<String, dynamic> retorno = {};
    /*String url = (dotenv.env['URL_API'] ?? '');
    if (url != '') {}*/
    retorno['latitude'] = -14.85234;
    retorno['longitude'] = -40.841001;
    return retorno;
  }

  Future<bool> sendPosition(
      {required double latitude, required double longitude}) async {
    bool retorno = false;
    //String url = 'http://grdatasrv.ddns.com.br:5000/motim/gps.rule?sys=MOM&prestador=575e3a1858334d5e864a9105fffe2c99';

    return retorno;
  }
}
