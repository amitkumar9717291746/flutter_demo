
import 'package:get/get.dart';
import '../presentation/bindings/detail_binding.dart';
import '../presentation/bindings/home_binding.dart';
import '../presentation/screens/detail_screen.dart';
import '../presentation/screens/home_screen.dart';

class Routes {
  static const String details = '/details';
  static const String home = '/home';

  static final routes = [
    GetPage(
      name: home,
      page: () => HomeScreen(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: details,
      page: () => DetailScreen(),
      binding: DetailBinding(),
    ),
  ];
}
