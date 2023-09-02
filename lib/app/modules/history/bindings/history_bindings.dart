import 'package:get/get.dart';
import 'package:numpedriversapp/app/modules/history/presentation/controller/history_controller.dart';

class HistoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<HistoryController>(HistoryController());
  }
}
