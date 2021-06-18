import 'package:get/get.dart';

class HomePageModel extends GetxController {
  // simple state manager
  var count1 = 0;
  void increment1() {
    count1++;
    update();
  }

  // reactive state manager
  var count2 = 0.obs;
  var count3 = 0.obs;
  get sum => count2.value + count3.value;
  increment2() => count2++;
  increment3() => count3++;
}
