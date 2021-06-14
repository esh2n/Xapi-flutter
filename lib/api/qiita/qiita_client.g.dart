// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'qiita_client.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _QiitaApiClient implements QiitaApiClient {
  _QiitaApiClient(this._dio, {this.baseUrl}) {
    baseUrl ??= 'https://qiita.com/api/v2';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<List<QiitaInfo>> getFlutterArticles() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<List<dynamic>>(
        _setStreamType<List<QiitaInfo>>(
            Options(method: 'GET', headers: <String, dynamic>{}, extra: _extra)
                .compose(_dio.options, '/tags/flutter/items?per_page=50',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data!
        .map((dynamic i) => QiitaInfo.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
