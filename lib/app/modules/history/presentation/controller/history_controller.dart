import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:numpedriversapp/app/core/models/driver.dart';
import 'package:numpedriversapp/app/core/utils/utils.dart';
import 'package:numpedriversapp/app/core/widgets/list_tile/list_tile.dart';
import 'package:numpedriversapp/app/modules/root/presentation/controller/root_controller.dart';

class HistoryController extends GetxController {
  ScrollController listController = ScrollController();
  List<Widget> historyList = <Widget>[].obs;
  RootController rootController = Get.find<RootController>();
  // ignore: prefer_typing_uninitialized_variables
  var userData;

  @override
  void onReady() async {
    try {
      if (rootController.user.history != null) {
        historyList.clear();
        int count = 0;
        for (var element in rootController.user.history!) {
          historyList.add(AppListTile(driver: Driver.fromJson(element), itemId: count, isHistoryTile: true));
          count++;
        }
      }
      await updateHistory();
    } catch (e) {
      DebugMode.showOnLog("$e - OnReady", isException: true, className: HistoryController);
    }
    super.onReady();
  }

  Future<void> updateHistory() async {
    try {
      DebugMode.showOnLog("Passou aqui.", className: HistoryController);
      userData =
          await FirebaseFirestore.instance.collection(AppConst.users).doc(GetStorage().read(AppConst.userId)).get();
      List history = [];
      if (userData.data() != null) {
        if (userData.data().containsKey(AppConst.history)) {
          history = await userData[AppConst.history];
          if (history != rootController.user.history) {
            await GetStorage().write(AppConst.history, history);
            rootController.user.history = history;
            historyList.clear();
            int count = 0;
            for (var element in rootController.user.history!) {
              historyList.add(AppListTile(driver: Driver.fromJson(element), itemId: count, isHistoryTile: true));
              count++;
            }
          }
        } else {
          historyList.clear();
        }
      }
    } catch (e) {
      DebugMode.showOnLog("$e - updateHistory", isException: true, className: HistoryController);
    }
  }
}
