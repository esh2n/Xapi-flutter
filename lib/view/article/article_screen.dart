import 'package:api_sample/api/qiita/model/qiita_info.dart';
import 'package:api_sample/view/article_detail/article_detail_screen.dart';
import 'article_screen_model.dart';
import 'article_item.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class ArticleScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Qiita List',
        ),
        centerTitle: true,
      ),
      body: _List(),
    );
  }
}

class _List extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final model = Get.put(ArticleScreenModel());
    Future(
      () async => await model.getFlutterArticle(),
    );
    return GetBuilder<ArticleScreenModel>(
        init: ArticleScreenModel(),
        builder: (_) {
          return Padding(
            padding: const EdgeInsets.all(8),
            child: ListView.builder(
              itemCount: model.articles.length,
              itemBuilder: (context, int position) => ArticleItem(
                qiitaInfo: model.articles[position],
                onArticleClicked: (qiitaInfo) => _openArticleWebPage(qiitaInfo),
              ),
            ),
          );
        });
  }

  _openArticleWebPage(QiitaInfo qiitaInfo) {
    Get.to(() => ArticleDetailScreen(qiitaInfo: qiitaInfo));
  }
}
