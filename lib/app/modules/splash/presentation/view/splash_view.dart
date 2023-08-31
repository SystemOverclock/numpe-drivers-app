import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:numpedriversapp/app/core/widgets/widgets.dart';
import 'package:numpedriversapp/app/modules/splash/presentation/controller/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AppSpinner(),
            ],
          ),
        ),
      ),
    );
  }
}
