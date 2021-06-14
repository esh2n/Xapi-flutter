import 'package:api_sample/api/qiita/model/qiita_info.dart';
import 'package:api_sample/view/article_detail/article_detail_screen.dart';
import 'article_screen_model.dart';
import 'article_item.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

class ArticleScreen extends HookWidget {
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

class _List extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final model = useProvider(articleScreenModelProvider);
    Future(
      () async => await model.getFlutterArticle(),
    );
    return Padding(
      padding: const EdgeInsets.all(8),
      child: ListView.builder(
        itemCount: model.articles.length,
        itemBuilder: (context, int position) => ArticleItem(
          qiitaInfo: model.articles[position],
          onArticleClicked: (qiitaInfo) => _openArticleWebPage(
            context,
            qiitaInfo,
          ),
        ),
      ),
    );
  }

  _openArticleWebPage(
    BuildContext context,
    QiitaInfo qiitaInfo,
  ) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ArticleDetailScreen(
          qiitaInfo: qiitaInfo,
        ),
      ),
    );
  }
}

// class ArticleScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final model = Provider.of<ArticleScreenModel>(
//       context,
//       listen: false,
//     );
//     Future(
//       () async => await model.getFlutterArticle(),
//     );

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           'Qiita Sample',
//         ),
//         centerTitle: true,
//       ),
//       body: _List(),
//     );
//   }
// }

// class _List extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(8),
//       child: Consumer<ArticleScreenModel>(
//         builder: (context, model, child) {
//           return ListView.builder(
//             itemCount: model.articles.length,
//             itemBuilder: (context, int position) => ArticleItem(
//               qiitaInfo: model.articles[position],
//               onArticleClicked: (qiitaInfo) => _openArticleWebPage(
//                 context,
//                 qiitaInfo,
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }

//   _openArticleWebPage(
//     BuildContext context,
//     QiitaInfo qiitaInfo,
//   ) {
//     Navigator.of(context).push(
//       MaterialPageRoute(
//         builder: (context) => ArticleDetailScreen(
//           qiitaInfo: qiitaInfo,
//         ),
//       ),
//     );
//   }
// }
