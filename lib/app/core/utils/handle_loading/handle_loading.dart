import 'package:get/get.dart';
import 'package:numpedriversapp/app/modules/root/presentation/controller/root_controller.dart';

class HandleLoading {
  static setStatus(bool status) {
    final RootController rootController = Get.find<RootController>();
    final appLoadingStatus = rootController.appLoadingStatus;
    appLoadingStatus.value = status;
    return status;
  }
}
