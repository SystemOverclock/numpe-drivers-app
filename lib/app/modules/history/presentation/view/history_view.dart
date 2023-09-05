import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:numpedriversapp/app/core/widgets/spacing/spacing.dart';
import 'package:numpedriversapp/app/modules/history/presentation/controller/history_controller.dart';

class HistoryView extends GetView<HistoryController> {
  const HistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      body: Column(
        children: [
          AppSpacing(),
          Expanded(
            child: SizedBox(
              width: Get.width,
              child: Obx(
                () => RefreshIndicator(
                  onRefresh: () => controller.updateHistory(),
                  child: ListView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    controller: controller.listController,
                    children: controller.historyList.isNotEmpty
                        ? controller.historyList
                        : [Center(child: const Text("noHistoryData").tr())],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
