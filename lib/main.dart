import 'package:api_sample/view/article/article_screen.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() => runApp(
      ProviderScope(child: MyApp()),
    );

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
