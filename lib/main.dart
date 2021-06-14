import 'package:api_sample/view/article/article_screen.dart';
import 'package:api_sample/view/article/article_screen_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider<ArticleScreenModel>(
      create: (context) => ArticleScreenModel(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'API Sample',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ArticleScreen(),
    );
  }
}
