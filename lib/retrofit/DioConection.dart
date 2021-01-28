import 'package:dio/dio.dart';

class DioConection {
  final dio = Dio();
  
  Dio getDio() {
    
    dio.interceptors.add(InterceptorsWrapper(onRequest: (RequestOptions options) async {
      return options;
    }, onResponse: (Response response) async {
      // Como só ha um servfiço vou colocar um tratamento único
      return response.data["news"]; // continue
    }, onError: (DioError e) async {
      return e; //continue
    }));
    return dio;
  }
}
