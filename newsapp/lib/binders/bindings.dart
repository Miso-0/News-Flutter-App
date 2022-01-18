import 'package:get/get.dart';
import 'package:newsapp/controllers/functionality_controller.dart';
import 'package:newsapp/controllers/preference_controller.dart';
import 'package:newsapp/controllers/widget_controller.dart';

class Binder extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PreferenceController());
    Get.lazyPut(() => FunctionalityController());
    Get.lazyPut(() => WidgetController());
  }
}
