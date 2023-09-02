import 'package:flutter/material.dart';
import 'package:numpedriversapp/app/core/theme/theme.dart';

class AppSpinner extends StatelessWidget {
  const AppSpinner({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: AppMetrics.spinnerSize,
      height: AppMetrics.spinnerSize,
      child: CircularProgressIndicator(
        strokeWidth: 2,
        color: Colors.blue,
      ),
    );
  }
}
