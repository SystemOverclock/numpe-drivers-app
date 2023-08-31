import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:numpedriversapp/app/core/theme/theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:numpedriversapp/app/core/utils/utils.dart';
import 'package:numpedriversapp/app/core/widgets/loading_indicator/loading_indicator.dart';
import 'package:numpedriversapp/app/modules/root/presentation/controller/root_controller.dart';
import 'package:numpedriversapp/app/routes/app_views.dart';

class RootView extends StatelessWidget {
  final String? appName;

  const RootView({
    Key? key,
    this.appName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final RootController controller = Get.put(RootController());
    return Obx(
      () => GetMaterialApp(
        title: appName!,
        builder:
            LoadingIndicator.init(status: controller.appLoadingStatus.value),
        debugShowCheckedModeBanner: false,
        theme: AppTheme.light(context),
        locale: context.locale,
        defaultTransition: Transition.cupertino,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        getPages: AppViews.routes,
        initialRoute:
            DebugMode.isActive(onTrue: Routes.auth, onFalse: Routes.splash),
      ),
    );
  }
}
