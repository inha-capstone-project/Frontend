
import 'package:get/get.dart';

class GetxCheckBoxController extends GetxController {
  bool isChecked = true;


  void change(value) {
    isChecked = value;
    update();
  }
}
