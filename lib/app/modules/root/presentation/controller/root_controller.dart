import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:numpedriversapp/app/core/models/user.dart';
import 'package:numpedriversapp/app/core/utils/utils.dart';
import 'package:package_info_plus/package_info_plus.dart';

class RootController extends GetxController {
  String packageName = '';
  String environment = '';
  final RxBool appLoadingStatus = false.obs;
  // Package platform information
  late PackageInfo packageInfo;
  late User user = User();

  Future<void> loadEnvironmentVariables() async {
    final String flavor = await Flavors.setEnvironment(packageName);
    environment = flavor;
    await DotEnvUtils.load(environment);
  }

  @override
  void onInit() async {
    try {
      packageInfo = await PackageInfo.fromPlatform();
      packageName = packageInfo.packageName;
      await loadEnvironmentVariables();
      if (GetStorage().hasData(AppConst.userId)) {
        user = User(
            id: GetStorage().read(AppConst.userId),
            history: GetStorage().read(AppConst.history),
            travels: GetStorage().read(AppConst.travels));
      } else {
        var tempUserId = await FirebaseFirestore.instance
            .collection(AppConst.users)
            .add({AppConst.history: [], AppConst.travels: []});
        await GetStorage().write(AppConst.userId, tempUserId.path.split('/')[1]);
        await GetStorage().write(AppConst.history, []);
        await GetStorage().write(AppConst.travels, []);
        user = User(id: tempUserId.path.split('/')[1], history: [], travels: []);
      }
    } catch (e) {
      DebugMode.showOnLog(e.toString(), isException: true, className: RootController);
    }
    super.onInit();
  }
}
