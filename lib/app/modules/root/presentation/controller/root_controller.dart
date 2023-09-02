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
  late User? user;

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
    if (GetStorage().hasData("userId")) {
      user = User(id: GetStorage().read("userId"), history: GetStorage().read("history"));
    } else {
      var tempUserId = await FirebaseFirestore.instance.collection("users").add({'history': []});
      GetStorage().write("userId", tempUserId.path.split('/')[1]);
      GetStorage().write("history", []);
      user = User(id: tempUserId.path.split('/')[1], history: []);
    }
    super.onInit();
  }
}
