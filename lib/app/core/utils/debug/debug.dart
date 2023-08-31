import 'package:flutter/foundation.dart';
import 'package:wakelock/wakelock.dart';

class DebugMode {
  static void showOnLog(String message,
      {Type? className, bool isException = false}) {
    if (isException) {
      message = Exception(message).toString();
    }
    final handleString = className != null ? '$className $message' : message;
    if (kDebugMode) {
      return debugPrint('🟡 [Numpe] $handleString');
    } else {
      // TODO: Add log service here
    }
  }

  static isActive({
    required String onTrue,
    String? onFalse,
  }) {
    if (kDebugMode) {
      return onTrue;
    } else {
      return onFalse;
    }
  }

  static void init() {
    if (kDebugMode) {
      showOnLog('Debug mode activated');
      Wakelock.enable();
    }
  }
}
