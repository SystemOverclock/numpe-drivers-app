// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:numpedriversapp/app/core/theme/theme.dart';

enum AppSpacingType { extraSmall, small, medium, large, extraLarge, extraExtraLarge }

class AppSpacing extends StatelessWidget {
  final bool isRow;
  final AppSpacingType spacing;
  late double width;
  late double height;

  AppSpacing({
    super.key,
    this.isRow = false,
    this.spacing = AppSpacingType.medium,
  });

  @override
  Widget build(BuildContext context) {
    switch (spacing) {
      case AppSpacingType.extraSmall:
        width = AppMetrics.paddingXsm;
        height = AppMetrics.paddingXsm;
      case AppSpacingType.small:
        width = AppMetrics.paddingSm;
        height = AppMetrics.paddingSm;
      case AppSpacingType.medium:
        width = AppMetrics.paddingMd;
        height = AppMetrics.paddingMd;
      case AppSpacingType.large:
        width = AppMetrics.paddingLg;
        height = AppMetrics.paddingLg;
      case AppSpacingType.extraLarge:
        width = AppMetrics.paddingXl;
        height = AppMetrics.paddingXl;
      case AppSpacingType.extraExtraLarge:
        width = AppMetrics.paddingXXL;
        height = AppMetrics.paddingXXL;
      default:
        width = AppMetrics.paddingMd;
        height = AppMetrics.paddingMd;
    }

    return SizedBox(
      width: isRow ? width : 0,
      height: !isRow ? height : 0,
    );
  }
}
