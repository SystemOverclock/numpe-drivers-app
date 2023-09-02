import 'package:get/get.dart';
import 'package:numpedriversapp/app/core/utils/debug/debug.dart';

class SplashController extends GetxController {
  void startApp() {
    DebugMode.showOnLog('Splash view initialized');
    Future.delayed(const Duration(seconds: 3), () => Get.offAllNamed('/home'));
  }

  @override
  void onInit() {
    startApp();
    super.onInit();
  }
}
