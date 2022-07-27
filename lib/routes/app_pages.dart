import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:veeam_mobile_operator/main.dart';

import '../bindings/login_binding.dart';

import '../bindings/navigation_binding.dart';
import '../screens/loginscreen.dart';
import '';
part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LOGIN;

  static final routes = [
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginScreen(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => const CupertinoScaffold(body: MyHomePage()),
      binding: NavigationBinding(),
    ),
  ];
}
