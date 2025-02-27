import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class LandingPageController extends GetxController {
  var tabIndex = 1.obs;
  RxBool isSelected = false.obs;
  RxList lines = <String>[].obs;
  RxList templist = <String>[].obs;

  void addelement(List<String> newLines) {
    lines.value = newLines;
    isSelected.value = true;

  }

  void changeTabIndex(int index) {
    tabIndex.value = index;

  }

  @override
  void onInit() {
    super.onInit();

  }

  @override
  void dispose() {
    super.dispose();
  }
}
