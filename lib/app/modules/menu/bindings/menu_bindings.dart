import 'package:get/get.dart';
import 'package:numpedriversapp/app/modules/history/presentation/controller/history_controller.dart';
import 'package:numpedriversapp/app/modules/home/presentation/controller/home_controller.dart';
import 'package:numpedriversapp/app/modules/menu/presentation/controller/menu_controller.dart';

class MenuBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<AppMenuController>(AppMenuController());
    Get.put<HomeController>(HomeController());
    Get.put<HistoryController>(HistoryController());
  }
}
