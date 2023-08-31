import 'package:flutter/material.dart';

class AppTheme {
  static Function get light => (BuildContext context) => ThemeData(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        primarySwatch: Colors.brown,
      );
}
