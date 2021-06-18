import 'home_page_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final model = Get.put(HomePageModel());
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            OutlinedButton(
              onPressed: () async {
                // Get.snackbar('Hi', 'i am a modern snackbar');
                await Get.toNamed('/article');
              },
              child: Text('Go to Article Page.'),
            ),
            ElevatedButton(
              onPressed: () {
                model.increment1();
              },
              child: Text('increment1()'),
            ),
            ElevatedButton(
              onPressed: () {
                model.increment2();
              },
              child: Text('increment2()'),
            ),
            ElevatedButton(
              onPressed: () {
                model.increment3();
              },
              child: Text('increment3()'),
            ),
            GetBuilder<HomePageModel>(
                init: HomePageModel(),
                builder: (_) {
                  print("count 1 rebuild");
                  return Text('count1: ${model.count1}');
                }),
            Obx(() => Text('count2: ${model.count2}')),
            GetX<HomePageModel>(
              builder: (_) {
                print("count 3 rebuild");
                return Text('count3: ${_.count3.value}');
              },
            ),
            GetX<HomePageModel>(
              builder: (_) {
                print("sum rebuild");
                return Text('sum(count2 + count3): ${_.sum}');
              },
            ),
          ],
        ),
      ),
    );
  }
}
