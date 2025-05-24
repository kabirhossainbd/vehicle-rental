import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:vehicle_rental_app/ui/view/auth/view/screen/login_screen.dart';
import 'package:vehicle_rental_app/ui/view/dashboard/dashboard_screen.dart';
import 'package:vehicle_rental_app/ui/view/splash/splash_screen.dart';

class RouterHelper {
  static const String main = '/';
  static const String splashScreen = '/splashScreen';
  static const String loginScreen = '/loginScreen';

  static String getMainRoute() => main;

  static List<GetPage> routes = [
    GetPage(name: main, page: () => const DashboardScreen(pageIndex: 0,)),
    GetPage(name: splashScreen, page: () => const SplashScreen()),
    GetPage(name: loginScreen, page: () => const LoginScreen())
  ];
}