import 'package:numpedriversapp/app/core/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoadingIndicator {
  static TransitionBuilder init(
      {TransitionBuilder? builder, required bool status}) {
    return (BuildContext context, Widget? child) {
      Widget loading = LoadingScreenOverlay(
        status: status,
        child: child!,
      );
      if (builder != null) {
        return builder(context, loading);
      }
      return loading;
    };
  }
}

class LoadingScreenOverlay extends StatelessWidget {
  final Widget child;
  final bool status;

  const LoadingScreenOverlay(
      {super.key, required this.child, required this.status});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Stack(
          children: [
            child,
            status
                ? Container(
                    width: Get.size.width,
                    height: Get.size.height,
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [AppSpinner()],
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
