

import 'package:microblog/model/NovidadeBoticario.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart' hide Headers;

part 'ServiceProvider.g.dart';

@RestApi(baseUrl: "https://gb-mobile-app-teste.s3.amazonaws.com/")
abstract class ServiceProvider {
  factory ServiceProvider(Dio dio, {String baseUrl}) = _ServiceProvider;
  
  @GET("data.json")
  Future<List<NovidadeBoticario>> consultarNovidades();

}