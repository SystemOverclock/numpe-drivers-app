import 'package:get/get.dart';

class SplashController extends GetxController {
  void startApp() {
    Future.delayed(const Duration(seconds: 3), () => Get.offAllNamed('/menu'));
  }

  @override
  void onInit() {
    startApp();
    super.onInit();
  }
}
