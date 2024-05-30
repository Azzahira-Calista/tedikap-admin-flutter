import 'package:get/get.dart';
import 'package:tedikap_admin/app/pages/feature_pages/chat_page/chat_binding.dart';
import 'package:tedikap_admin/app/pages/feature_pages/chat_room/chat_room_binding.dart';
import 'package:tedikap_admin/app/pages/feature_pages/home_page/home_binding.dart';
import 'package:tedikap_admin/app/pages/feature_pages/menu_page/menu_binding.dart';
import 'package:tedikap_admin/app/pages/feature_pages/order_page/order_binding.dart';
import 'package:tedikap_admin/app/pages/feature_pages/order_status/order_status_binding.dart';
import 'package:tedikap_admin/app/pages/feature_pages/tambah_menu/tambah_menu_binding.dart';
import 'package:tedikap_admin/app/pages/feature_pages/tambah_notif/tambah_notif_binding.dart';
import 'package:tedikap_admin/app/pages/feature_pages/tambah_voucher/tambah_voucher_binding.dart';
import 'package:tedikap_admin/app/pages/feature_pages/chat_page/chat_admin.dart';
import 'package:tedikap_admin/app/pages/feature_pages/chat_room/chat_room.dart';
import 'package:tedikap_admin/app/pages/feature_pages/home_page/home_page_view.dart';
import 'package:tedikap_admin/app/pages/feature_pages/order_page/order_list.dart';
import 'package:tedikap_admin/app/pages/feature_pages/tambah_notif/tambah_notif.dart';
import 'package:tedikap_admin/app/pages/feature_pages/tambah_voucher/tambah_voucher.dart';
import 'package:tedikap_admin/app/pages/feature_pages/menu_page/menu_admin.dart';
import 'package:tedikap_admin/app/pages/feature_pages/tambah_menu/tambah_menu.dart';
import 'package:tedikap_admin/app/pages/initial_pages/login_page/login_admin.dart';
import 'package:tedikap_admin/app/pages/initial_pages/splash_screen/splash_screen.dart';
import 'package:tedikap_admin/app/pages/initial_pages/splash_screen/splash_screen_two.dart';
import 'package:tedikap_admin/app/pages/global_components/navbar/bottom_navbar.dart';

import '../app/pages/feature_pages/order_status/order_status.dart';

part 'AppRoutes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

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
    GetPage(
      name: _Paths.TAMBAH_MENU,
      page: () => TambahMenu(),
      binding: TambahMenuBinding(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: _Paths.TAMBAH_VOUCHER,
      page: () => TambahVoucher(),
      binding: TambahVoucherBinding(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: _Paths.CHAT_ROOM,
      page: () => MyChatRoom(),
      binding: ChatRoomBinding(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: _Paths.TAMBAH_NOTIF,
      page: () => TambahNotif(),
      binding: TambahNotifBinding(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 300),
    ),
  ];
}
