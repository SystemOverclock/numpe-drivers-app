import 'package:numpedriversapp/app/modules/history/bindings/history_bindings.dart';
import 'package:numpedriversapp/app/modules/history/presentation/view/history_view.dart';
import 'package:numpedriversapp/app/modules/home/bindings/home_bindings.dart';
import 'package:numpedriversapp/app/modules/home/presentation/view/home_view.dart';
import 'package:numpedriversapp/app/modules/menu/bindings/menu_bindings.dart';
import 'package:numpedriversapp/app/modules/menu/presentation/view/menu_view.dart';
import 'package:numpedriversapp/app/modules/splash/bindings/splash_binding.dart';
import 'package:numpedriversapp/app/modules/splash/presentation/view/splash_view.dart';
import 'package:get/get.dart';
part 'app_routes.dart';

class AppViews {
  AppViews._();

  static final routes = [
    GetPage(
      name: _Paths.splash,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.menu,
      page: () => const MenuView(),
      binding: MenuBinding(),
    ),
    GetPage(
      name: _Paths.home,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.history,
      page: () => const HistoryView(),
      binding: HistoryBinding(),
    ),
  ];
}
