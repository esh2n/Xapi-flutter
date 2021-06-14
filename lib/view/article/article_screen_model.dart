import 'package:api_sample/api/qiita/model/qiita_info.dart';
import 'package:api_sample/api/qiita/qiita_client.dart';
import 'package:flutter/material.dart';

class ArticleScreenModel extends ChangeNotifier {
  final api = QiitaApiClient.create();
  List<QiitaInfo> _articles = [];

  List<QiitaInfo> get articles => _articles;

  Future<void> getFlutterArticle() async {
    _articles = await api.getFlutterArticles();
    notifyListeners();
  }
}
