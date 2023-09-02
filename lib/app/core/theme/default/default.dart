import 'package:flutter/material.dart';

class AppTheme {
  static Function get light => (BuildContext context) => ThemeData(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        primarySwatch: MaterialColor(const Color.fromRGBO(27, 70, 153, 1).value, const {
          50: Color.fromRGBO(27, 70, 153, 0.1),
          100: Color.fromRGBO(27, 70, 153, 0.2),
          200: Color.fromRGBO(27, 70, 153, 0.3),
          300: Color.fromRGBO(27, 70, 153, 0.4),
          400: Color.fromRGBO(27, 70, 153, 0.5),
          500: Color.fromRGBO(27, 70, 153, 0.6),
          600: Color.fromRGBO(27, 70, 153, 0.7),
          700: Color.fromRGBO(27, 70, 153, 0.8),
          800: Color.fromRGBO(27, 70, 153, 0.9),
          900: Color.fromRGBO(27, 70, 153, 1)
        }),
      );
}
