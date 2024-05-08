import 'package:get/get.dart';
import 'package:tedikap_admin/binding/chat_binding.dart';
import 'package:tedikap_admin/binding/home_binding.dart';
import 'package:tedikap_admin/binding/menu_binding.dart';
import 'package:tedikap_admin/binding/order_binding.dart';
import 'package:tedikap_admin/binding/order_status_binding.dart';
import 'package:tedikap_admin/views/chat/chat_admin.dart';
import 'package:tedikap_admin/views/home/home_admin.dart';
import 'package:tedikap_admin/views/home/order_list.dart';
import 'package:tedikap_admin/views/menu/menu_admin.dart';
import 'package:tedikap_admin/views/start/login_admin.dart';
import 'package:tedikap_admin/views/start/splash_screen.dart';
import 'package:tedikap_admin/views/start/splash_screen_two.dart';
import 'package:tedikap_admin/widgets/bottom_navbar.dart';

import '../views/home/order_status.dart';

part 'router.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.ORDER_STATUS;

  static final routes = [
    GetPage(
      name: _Paths.NAVBAR,
      page: () => MyNavBar(),
      bindings: [MenuBinding(), HomeBinding(), ChatBinding()],
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
    GetPage(
      name: _Paths.CHAT,
      page: () => ChatPage(),
      binding: ChatBinding(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: _Paths.ORDER,
      page: () => OrderList(),
      binding: OrderBinding(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: _Paths.SPLASH1,
      page: () => SplashAdmin(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: _Paths.SPLASH2,
      page: () => SplashTwo(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: _Paths.ORDER_STATUS,
      page: () => OrderStatus(),
      binding: OrderStatusBinding(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginPage(),
      transition: Transition.fadeIn,
    ),
  ];
}
