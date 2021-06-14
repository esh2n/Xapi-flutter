import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'model/qiita_info.dart';

part 'qiita_client.g.dart';

@RestApi(baseUrl: "https://qiita.com/api/v2")
abstract class QiitaApiClient {
  factory QiitaApiClient(Dio dio, {String baseUrl}) = _QiitaApiClient;

  static QiitaApiClient create() {
    final dio = Dio();
    return QiitaApiClient(dio);
  }

  @GET("/tags/flutter/items?per_page=10")
  Future<List<QiitaInfo>> getFlutterArticles();
}
