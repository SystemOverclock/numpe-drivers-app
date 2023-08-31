import 'dart:io';
import 'package:easy_localization/easy_localization.dart';
import 'package:numpedriversapp/app/core/utils/utils.dart';
import 'package:numpedriversapp/app/modules/root/presentation/views/root_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';
import 'package:package_info_plus/package_info_plus.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize local storage
  await GetStorage.init();

  // Localization settings
  final String languageCode = Platform.localeName.split('_')[0];
  await EasyLocalization.ensureInitialized();

  // Package platform information
  final PackageInfo packageInfo = await PackageInfo.fromPlatform();

  // Device preferences
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));

  // Initialize debug mode
  DebugMode.init();

  runApp(
    EasyLocalization(
      path: 'assets/translations',
      fallbackLocale: Locale(languageCode),
      supportedLocales: const [
        Locale('pt'),
        Locale('en'),
        Locale('es'),
      ],
      child: RootView(
        appName: packageInfo.appName,
      ),
    ),
  );
}
