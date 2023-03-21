import 'package:get/get.dart';

import 'package:cashier_pyongyang/app/modules/home/bindings/home_binding.dart';
import 'package:cashier_pyongyang/app/modules/home/views/v-home.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => VHome(),
      binding: HomeBinding(),
    ),
  ];
}
