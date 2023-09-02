import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:numpedriversapp/app/core/theme/metrics/metrics.dart';
import 'package:numpedriversapp/app/modules/history/presentation/view/history_view.dart';
import 'package:numpedriversapp/app/modules/home/presentation/view/home_view.dart';
import 'package:numpedriversapp/app/modules/menu/presentation/controller/menu_controller.dart';

class MenuView extends GetView<AppMenuController> {
  const MenuView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: controller.currentIndex.value == 0 ? const HomeView() : const HistoryView(),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home, size: AppMetrics.menuIconSize), label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.history, size: AppMetrics.menuIconSize), label: "")
          ],
          currentIndex: controller.currentIndex.value,
          onTap: (value) => controller.currentIndex.value = value,
        ),
      ),
    );
  }
}
