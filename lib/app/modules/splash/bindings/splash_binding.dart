import 'package:get/get.dart';
import 'package:numpedriversapp/app/modules/splash/presentation/controller/splash_controller.dart';

class SplashBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<SplashController>(SplashController());
  }
}
