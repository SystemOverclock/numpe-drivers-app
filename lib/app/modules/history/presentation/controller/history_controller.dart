import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:numpedriversapp/app/core/models/driver.dart';
import 'package:numpedriversapp/app/core/widgets/list_tile/list_tile.dart';

class HistoryController extends GetxController {
  ScrollController listController = ScrollController();
  List<Widget> driversActivity = <Widget>[].obs;

  Future<void> addActivity() async {
    var data = await FirebaseFirestore.instance.collection("drivers-model").doc(Random().nextInt(5).toString()).get();
    Driver driver = Driver.fromJson(data.data()!);
    driversActivity.add(AppListTile(driver: driver));
  }
}
