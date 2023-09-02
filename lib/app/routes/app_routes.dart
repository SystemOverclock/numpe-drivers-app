part of 'app_views.dart';

abstract class Routes {
  Routes._();
  static const splash = _Paths.splash;
  static const menu = _Paths.menu;
  static const home = _Paths.home;
  static const history = _Paths.history;
}

abstract class _Paths {
  static const splash = '/splash';
  static const menu = '/menu';
  static const home = '/home';
  static const history = '/history';
}
