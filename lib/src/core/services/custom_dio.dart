import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:cookie_jar/cookie_jar.dart';

class CustomDio {
  final Dio _dio = Dio(); // Inicializado com um Dio vazio
  final CookieJar _cookieJar = CookieJar();

  CustomDio() {
    initialize();
  }

  void initialize() {
    _dio.options = BaseOptions(
      connectTimeout: const Duration(milliseconds: 15000),
    );
    _dio.interceptors.add(CookieManager(_cookieJar));
    _dio.interceptors.add(RedirectionInterceptor(_dio));
    _dio.interceptors.add(InterceptorsWrapper(onError: (error, handler) {
      handler.reject(error);
    }));
    _dio.options.followRedirects = true;
    _dio.options.validateStatus = (status) {
      return status! < 600;
    };
  }

  BaseOptions getDioOptions() {
    return _dio.options;
  }

  void setDioOptions(BaseOptions options) {
    _dio.options = options;
  }

  Future<Response<dynamic>> post(String path, dynamic data) async {
    return await _dio.post(path, data: data);
  }

  Future<Response<dynamic>> postWithoutBody(String path) async {
    return await _dio.post(path);
  }

  Future<Response<dynamic>> get(String path) async {
    return await _dio.get(path);
  }

  Future<Response<dynamic>> put(String path, dynamic data) async {
    return await _dio.put(path, data: data);
  }

  Future<Response<dynamic>> delete(String path) async {
    return await _dio.delete(path);
  }
}

class RedirectionInterceptor extends Interceptor {
  // ignore: prefer_final_fields
  Dio _dio;

  RedirectionInterceptor(this._dio);

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    if (response.statusCode != null &&
        response.statusCode! >= 300 &&
        response.statusCode! < 309) {
      var newUrl = response.headers.value('location');

      if (newUrl != null) {
        try {
          var newResponse = await _dio.request(newUrl);
          handler.next(newResponse);
        } catch (e) {
          if (e is DioException) {
            handler.reject(e);
          }
        }
      } else {
        handler.next(response);
      }
    } else {
      handler.next(response);
    }
  }
}
