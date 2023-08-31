import 'package:numpedriversapp/app/modules/auth/bindings/auth_bindings.dart';
import 'package:numpedriversapp/app/modules/auth/presentation/view/auth_view.dart';
import 'package:numpedriversapp/app/modules/home/bindings/home_bindings.dart';
import 'package:numpedriversapp/app/modules/home/presentation/view/home_view.dart';
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
      name: _Paths.home,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.auth,
      page: () => const AuthView(),
      fullscreenDialog: true,
      transition: Transition.fadeIn,
      binding: AuthBinding(),
    )
  ];
}
