// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ServiceProvider.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _ServiceProvider implements ServiceProvider {
  _ServiceProvider(this._dio, {this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
    baseUrl ??= 'https://gb-mobile-app-teste.s3.amazonaws.com/';
  }

  final Dio _dio;

  String baseUrl;

  @override
  Future<List<NovidadeBoticario>> consultarNovidades() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<List<dynamic>>('data.json',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    var value = _result.data
        .map((dynamic i) =>
            NovidadeBoticario.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }
}
