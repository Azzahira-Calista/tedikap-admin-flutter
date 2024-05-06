import 'package:get/get.dart';
import 'package:tedikap_admin/binding/home_binding.dart';
import 'package:tedikap_admin/binding/menu_binding.dart';
import 'package:tedikap_admin/controllers/home_controller.dart';
import 'package:tedikap_admin/views/home/home_admin.dart';
import 'package:tedikap_admin/views/menu/menu_admin.dart';
import 'package:tedikap_admin/widgets/bottom_navbar.dart';

part 'router.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.NAVBAR;

  static final routes = [
    GetPage(
      name: _Paths.NAVBAR,
      page: () => MyNavBar(),
      bindings: [MenuBinding(), HomeBinding()],
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => HomePage(),
      binding: HomeBinding(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: _Paths.MENU,
      page: () => MenuPage(),
      binding: MenuBinding(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    // GetPage(
    //   name: _Paths.CHAT,
    //   page: () => Chatpag(),
    // ),
  ];
}
