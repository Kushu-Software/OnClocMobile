import 'package:get/get.dart';

class OnClocNavigationController extends GetxController {
  RxInt currentIndex = 0.obs;

  void changeTabIndex(int index) {
    currentIndex.value = index;
  }

  RxBool isFabClick = false.obs;

  void clickFab() {
    isFabClick.value = true;
    update();
  }
}
