import 'package:get/get.dart';
import 'package:numpedriversapp/app/core/utils/utils.dart';
import 'package:package_info_plus/package_info_plus.dart';

class RootController extends GetxController {
  String packageName = '';
  String environment = '';
  final RxBool appLoadingStatus = false.obs;
  // Package platform information
  late PackageInfo packageInfo;

  Future<void> loadEnvironmentVariables() async {
    final String flavor = await Flavors.setEnvironment(packageName);
    environment = flavor;
    await DotEnvUtils.load(environment);
  }

  @override
  void onInit() async {
    packageInfo = await PackageInfo.fromPlatform();
    packageName = packageInfo.packageName;
    await loadEnvironmentVariables();
    super.onInit();
  }
}
