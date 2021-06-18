import 'package:api_sample/api/qiita/model/qiita_info.dart';
import 'package:api_sample/api/qiita/qiita_client.dart';
import 'package:get/get.dart';

class ArticleScreenModel extends GetxController {
  //TODO: DI
  final api = QiitaApiClient.create();
  List<QiitaInfo> _articles = [];

  List<QiitaInfo> get articles => _articles;

  Future<void> getFlutterArticle() async {
    try {
      _articles = await api.getFlutterArticles();
      update();
    } catch (e) {
      print('Error on getting articles ====> $e');
    }
  }
}
