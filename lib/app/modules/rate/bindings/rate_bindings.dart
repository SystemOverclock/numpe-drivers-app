import 'package:get/get.dart';
import 'package:numpedriversapp/app/modules/rate/presentation/controller/rate_controller.dart';

class RateBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<RateController>(RateController());
  }
}
