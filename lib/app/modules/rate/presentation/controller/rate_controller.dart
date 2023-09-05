import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:numpedriversapp/app/core/models/driver.dart';
import 'package:numpedriversapp/app/core/utils/utils.dart';
import 'package:numpedriversapp/app/modules/history/presentation/controller/history_controller.dart';
import 'package:numpedriversapp/app/modules/home/presentation/controller/home_controller.dart';

class RateController extends GetxController {
  Driver driver = Get.arguments["driver"];
  int itemId = Get.arguments["itemId"];
  bool edit = Get.arguments["edit"];
  late Rx<IconData> star1 = Icons.star_outline.obs;
  late Rx<IconData> star2 = Icons.star_outline.obs;
  late Rx<IconData> star3 = Icons.star_outline.obs;
  late Rx<IconData> star4 = Icons.star_outline.obs;
  late Rx<IconData> star5 = Icons.star_outline.obs;
  TextEditingController comment = TextEditingController();
  HomeController homeController = Get.find<HomeController>();
  HistoryController historyController = Get.find<HistoryController>();
  static double previousRate = 0;

  @override
  void onReady() async {
    try {
      if (edit) {
        if (driver.rate == 5) {
          star1.value = Icons.star;
          star2.value = Icons.star;
          star3.value = Icons.star;
          star4.value = Icons.star;
          star5.value = Icons.star;
        } else if (driver.rate == 4) {
          star1.value = Icons.star;
          star2.value = Icons.star;
          star3.value = Icons.star;
          star4.value = Icons.star;
        } else if (driver.rate == 3) {
          star1.value = Icons.star;
          star2.value = Icons.star;
          star3.value = Icons.star;
        } else if (driver.rate == 2) {
          star1.value = Icons.star;
          star2.value = Icons.star;
        } else {
          star1.value = Icons.star;
        }
        comment.text = driver.comment!;
        previousRate = driver.rate!;
        DebugMode.showOnLog("$previousRate - Previous Rate", className: RateController);
      }
    } catch (e) {
      DebugMode.showOnLog("$e - OnReady", isException: true, className: RateController);
    }
    super.onReady();
  }

  void saveStarsAndComment() {
    if (star5.value == Icons.star) {
      driver.rate = 5;
    } else if (star4.value == Icons.star) {
      driver.rate = 4;
    } else if (star3.value == Icons.star) {
      driver.rate = 3;
    } else if (star2.value == Icons.star) {
      driver.rate = 2;
    } else {
      driver.rate = 1;
    }
    driver.comment = comment.text;
  }

  Future<void> send() async {
    try {
      saveStarsAndComment();
      var tempData =
          await FirebaseFirestore.instance.collection(AppConst.users).doc(GetStorage().read(AppConst.userId)).get();
      int avgCount = 1;
      double avgRate = driver.rate!;
      List history = [];
      if (tempData.data()!.containsKey(AppConst.history)) {
        history = await tempData[AppConst.history];
        DebugMode.showOnLog("$history - History", className: RateController);
        if (history.isNotEmpty) {
          for (Map data in history) {
            if (data['id'] == driver.id) {
              avgRate += await data['rate'];
              DebugMode.showOnLog("$avgRate - Avarage Rate status", className: RateController);
              avgCount++;
            }
          }
          if (edit) {
            avgCount--;
            avgRate -= previousRate;
          }
          DebugMode.showOnLog("$avgRate - Avarage Rate", className: RateController);
          driver.avgRate = avgRate / avgCount;
        } else {
          driver.avgRate = driver.rate;
        }
      } else {
        driver.avgRate = driver.rate;
      }
      if (edit) {
        history[itemId] = driver.toMap();
      } else {
        history.add(driver.toMap());
        List travels = tempData[AppConst.travels];
        await travels.removeAt(itemId);
        await FirebaseFirestore.instance
            .collection(AppConst.users)
            .doc(GetStorage().read(AppConst.userId))
            .update({AppConst.travels: travels});
      }
      await FirebaseFirestore.instance
          .collection(AppConst.users)
          .doc(GetStorage().read(AppConst.userId))
          .update({AppConst.history: history});
      await FirebaseFirestore.instance
          .collection(AppConst.models)
          .doc(driver.id.toString())
          .update({'avgRate': driver.avgRate});
      await homeController.updateTravels();
      await historyController.updateHistory();
      Get.back();
      Get.snackbar(tr("success"), tr("successRate"),
          backgroundColor: Colors.greenAccent, snackPosition: SnackPosition.BOTTOM);
    } catch (e) {
      DebugMode.showOnLog("$e - send", isException: true, className: RateController);
      homeController.updateTravels();
      Get.snackbar(tr("error"), e.toString(), backgroundColor: Colors.redAccent, snackPosition: SnackPosition.BOTTOM);
    }
  }
}
