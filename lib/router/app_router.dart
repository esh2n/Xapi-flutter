import 'package:api_sample/view/article/article_screen.dart';
import 'package:api_sample/view/article_detail/article_detail_screen.dart';
import 'package:api_sample/view/home/home_page.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

abstract class IAppRouter {
  Future<bool> enableAndroidBackButton();
  Route<GetPageRoute> initialRoute(RouteSettings settings);
  Route<GetPageRoute> onGenerateRoute(RouteSettings settings);
}

class AppRouter implements IAppRouter {
  static final AppRouter _instance = AppRouter._();
  AppRouter._();
  factory AppRouter() => _instance;

  @override
  Future<bool> enableAndroidBackButton() async {
    Get.back();
    return false;
  }

  @override
  Route<GetPageRoute> initialRoute(RouteSettings settings) {
    return GetPageRoute(
      settings: settings,
      page: () => HomePage(),
    );
  }

  @override
  Route<GetPageRoute> onGenerateRoute(RouteSettings settings) {
    final name = settings.name ?? '/';
    switch (name) {
      case '/':
        return GetPageRoute(
          settings: settings,
          page: () => HomePage(),
        );
      case '/article':
        return GetPageRoute(
          settings: settings,
          page: () => ArticleScreen(),
        );
      case '/article/details':
        final args = settings.arguments as Map<String, dynamic>;
        return GetPageRoute(
          settings: settings,
          page: () => ArticleDetailScreen(qiitaInfo: args['qiitaInfo']),
        );
      default:
        return GetPageRoute(
          settings: settings,
          page: () => HomePage(),
        );
    }
  }
}
