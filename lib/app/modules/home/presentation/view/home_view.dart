import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:numpedriversapp/app/core/widgets/spacing/spacing.dart';
import 'package:numpedriversapp/app/modules/home/presentation/controller/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      floatingActionButton: FloatingActionButton(
        onPressed: controller.addActivity,
        child: const Icon(Icons.directions_car),
      ),
      body: Column(
        children: [
          AppSpacing(),
          Expanded(
            child: SizedBox(
              width: Get.width,
              child: Obx(
                () => ListView(
                  controller: controller.listController,
                  children: controller.driversActivity,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
