import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'router/app_router.dart';
import 'router/middleware.dart';
import 'view/home/home_page.dart';

void main() => runApp(
      GetMaterialApp(
        title: 'API Sample',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomePage(),
        onGenerateRoute: AppRouter().onGenerateRoute,
        onUnknownRoute: AppRouter().initialRoute,
        navigatorKey: Get.key,
        navigatorObservers: [
          GetObserver(MiddleWare().observer),
        ],
      ),
    );
