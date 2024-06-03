import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class HomeController extends GetxController {
  final List<String> items = [];

  void addItem() {
    items.add('Item');
    update();
  }

  void removeItem() {
    if (items.isNotEmpty) {
      items.removeLast();
      update();
    }
  }
}
