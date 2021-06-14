import 'package:api_sample/api/qiita/model/qiita_info.dart';
import 'package:api_sample/api/qiita/qiita_client.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final articleScreenModelProvider =
    ChangeNotifierProvider((_) => ArticleScreenModel());

class ArticleScreenModel extends ChangeNotifier {
  final api = QiitaApiClient.create();
  List<QiitaInfo> _articles = [];

  List<QiitaInfo> get articles => _articles;

  Future<void> getFlutterArticle() async {
    try {
      _articles = await api.getFlutterArticles();
      notifyListeners();
    } catch (e) {
      print('Error on getting articles ====> $e');
    }
  }
}

// class ArticleScreenModel extends ChangeNotifier {
//   final api = QiitaApiClient.create();
//   List<QiitaInfo> _articles = [];

//   List<QiitaInfo> get articles => _articles;

//   Future<void> getFlutterArticle() async {
//     _articles = await api.getFlutterArticles();
//     notifyListeners();
//   }
// }
