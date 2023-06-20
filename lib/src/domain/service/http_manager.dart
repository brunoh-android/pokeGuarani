import 'package:dio/dio.dart';

abstract class HttpMethods {
  static const String get = 'GET';
}

class HttpManager {
  Future<Map> restRequest(
      {required String url, required String method, Map? body, Map<String, dynamic>? queryParameters}) async {
    Dio dio = Dio();

    try {
      Response response = await dio.request(url,options: Options(method: method),
       data: body, queryParameters: queryParameters);
      return response.data;
    } on DioException catch (error) {
      return error.response?.data ?? {};
    } catch (error) {
      return {};
    }
  }
}
