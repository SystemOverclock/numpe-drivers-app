import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:numpedriversapp/app/core/theme/theme.dart';
import 'package:numpedriversapp/app/core/widgets/spacing/spacing.dart';
import 'package:numpedriversapp/app/modules/rate/presentation/controller/rate_controller.dart';

class RateView extends GetView<RateController> {
  const RateView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      floatingActionButton: FloatingActionButton(
        onPressed: controller.send,
        child: const Icon(Icons.send),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            AppSpacing(spacing: AppSpacingType.extraExtraLarge),
            Padding(
              padding: EdgeInsets.only(left: Get.width * 0.8),
              child: IconButton(
                onPressed: () => Get.back(),
                icon: Container(
                    height: AppMetrics.rateCloseButton,
                    width: AppMetrics.rateCloseButton,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(AppMetrics.rateCloseButton),
                        color: Theme.of(context).primaryColor),
                    child: const Icon(Icons.close, color: Colors.white)),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                AppSpacing(isRow: true),
                controller.driver.image != ""
                    ? ClipRRect(
                        borderRadius: const BorderRadius.all(Radius.circular(AppMetrics.rateDriversPicture)),
                        child: Image.network(controller.driver.image!, width: AppMetrics.rateDriversPictureWidth),
                      )
                    : const ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(AppMetrics.rateDriversPicture)),
                        child: SizedBox(
                          height: AppMetrics.rateDriversPicture * 2,
                          width: AppMetrics.rateDriversPicture * 2,
                          child: Icon(Icons.person),
                        ),
                      ),
                AppSpacing(isRow: true),
                Text(controller.driver.name!, overflow: TextOverflow.ellipsis, style: const TextStyle(fontSize: 20)),
              ],
            ),
            AppSpacing(
              spacing: AppSpacingType.large,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    if (controller.star1.value == Icons.star_outline) {
                      controller.star1.value = Icons.star;
                    } else {
                      controller.star2.value = Icons.star_outline;
                      controller.star3.value = Icons.star_outline;
                      controller.star4.value = Icons.star_outline;
                      controller.star5.value = Icons.star_outline;
                    }
                  },
                  icon: Obx(() => Icon(controller.star1.value, color: Colors.yellow)),
                ),
                AppSpacing(isRow: true, spacing: AppSpacingType.small),
                IconButton(
                  onPressed: () {
                    if (controller.star2.value == Icons.star_outline) {
                      controller.star1.value = Icons.star;
                      controller.star2.value = Icons.star;
                    } else {
                      controller.star3.value = Icons.star_outline;
                      controller.star4.value = Icons.star_outline;
                      controller.star5.value = Icons.star_outline;
                    }
                  },
                  icon: Obx(() => Icon(controller.star2.value, color: Colors.yellow)),
                ),
                AppSpacing(isRow: true, spacing: AppSpacingType.small),
                IconButton(
                  onPressed: () {
                    if (controller.star3.value == Icons.star_outline) {
                      controller.star1.value = Icons.star;
                      controller.star2.value = Icons.star;
                      controller.star3.value = Icons.star;
                    } else {
                      controller.star4.value = Icons.star_outline;
                      controller.star5.value = Icons.star_outline;
                    }
                  },
                  icon: Obx(() => Icon(controller.star3.value, color: Colors.yellow)),
                ),
                AppSpacing(isRow: true, spacing: AppSpacingType.small),
                IconButton(
                  onPressed: () {
                    if (controller.star4.value == Icons.star_outline) {
                      controller.star1.value = Icons.star;
                      controller.star2.value = Icons.star;
                      controller.star3.value = Icons.star;
                      controller.star4.value = Icons.star;
                    } else {
                      controller.star5.value = Icons.star_outline;
                    }
                  },
                  icon: Obx(() => Icon(controller.star4.value, color: Colors.yellow)),
                ),
                AppSpacing(isRow: true, spacing: AppSpacingType.small),
                IconButton(
                  onPressed: () {
                    if (controller.star5.value == Icons.star_outline) {
                      controller.star1.value = Icons.star;
                      controller.star2.value = Icons.star;
                      controller.star3.value = Icons.star;
                      controller.star4.value = Icons.star;
                      controller.star5.value = Icons.star;
                    } else {
                      controller.star5.value = Icons.star_outline;
                    }
                  },
                  icon: Obx(() => Icon(controller.star5.value, color: Colors.yellow)),
                ),
              ],
            ),
            AppSpacing(
              spacing: AppSpacingType.large,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: Get.width * 0.05),
              padding: const EdgeInsets.all(AppMetrics.paddingSm),
              decoration: const BoxDecoration(
                color: Colors.white24,
                borderRadius: BorderRadius.all(Radius.circular(AppMetrics.contentBorder)),
              ),
              child: TextField(
                controller: controller.comment,
                maxLength: 500,
                buildCounter: (context, {required currentLength, required isFocused, maxLength}) {
                  return Text(
                    '${controller.comment.text.length}/$maxLength',
                  );
                },
                decoration: InputDecoration(border: InputBorder.none, hintText: tr("comment")),
                textInputAction: TextInputAction.newline,
                maxLines: 15,
                onTapOutside: (event) => FocusScope.of(context).unfocus(),
              ),
            ),
            AppSpacing()
          ],
        ),
      ),
    );
  }
}
