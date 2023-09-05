import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:numpedriversapp/app/core/models/driver.dart';
import 'package:numpedriversapp/app/core/utils/utils.dart';
import 'package:numpedriversapp/app/core/widgets/list_tile/list_tile.dart';
import 'package:numpedriversapp/app/modules/root/presentation/controller/root_controller.dart';

class HomeController extends GetxController {
  ScrollController listController = ScrollController();
  List<Widget> tripsList = <Widget>[].obs;
  RootController rootController = Get.find<RootController>();
  // ignore: prefer_typing_uninitialized_variables
  var userData;

  @override
  void onReady() async {
    try {
      if (rootController.user.travels != null) {
        tripsList.clear();
        int count = 0;
        for (var element in rootController.user.travels!) {
          tripsList.add(AppListTile(driver: Driver.fromJson(element), itemId: count));
          count++;
        }
      }
      await updateTravels();
    } catch (e) {
      DebugMode.showOnLog("$e - OnReady", isException: true, className: HomeController);
    }
    super.onReady();
  }

  Future<void> addActivity() async {
    try {
      userData =
          await FirebaseFirestore.instance.collection(AppConst.users).doc(GetStorage().read(AppConst.userId)).get();
      // TODO: No Random().nextInt() onde há o número cinco especifique quantos modelos há no Firebase Firestore
      var data = await FirebaseFirestore.instance.collection(AppConst.models).doc(Random().nextInt(5).toString()).get();
      Driver driver = Driver.fromJson(data.data()!);
      List travels = [];
      if (userData.data() != null) {
        if (userData.data().containsKey(AppConst.travels)) {
          travels = await userData[AppConst.travels];
        }
      }
      travels.add(driver.toMap());
      await FirebaseFirestore.instance
          .collection(AppConst.users)
          .doc(GetStorage().read(AppConst.userId))
          .update({AppConst.travels: travels});
      await GetStorage().write(AppConst.travels, travels);
      tripsList.add(AppListTile(driver: driver, itemId: travels.length - 1));
    } catch (e) {
      DebugMode.showOnLog("$e - addActivity", isException: true, className: HomeController);
    }
  }

  Future<void> updateTravels() async {
    try {
      userData =
          await FirebaseFirestore.instance.collection(AppConst.users).doc(GetStorage().read(AppConst.userId)).get();
      List travels = [];
      if (userData.data() != null) {
        if (userData.data().containsKey(AppConst.travels)) {
          travels = await userData[AppConst.travels];
          if (travels != rootController.user.travels) {
            await GetStorage().write(AppConst.travels, travels);
            rootController.user.travels = travels;
            tripsList.clear();
            int count = 0;
            for (var element in rootController.user.travels!) {
              tripsList.add(AppListTile(driver: Driver.fromJson(element), itemId: count));
              count++;
            }
          }
        } else {
          tripsList.clear();
        }
      }
    } catch (e) {
      DebugMode.showOnLog("$e - updateTravels", isException: true, className: HomeController);
    }
  }
}
