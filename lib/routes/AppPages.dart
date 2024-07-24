// ignore_for_file: constant_identifier_names

import 'package:get/get.dart';
import 'package:tedikap_admin/app/pages/feature_pages/chat_page/chat_binding.dart';
import 'package:tedikap_admin/app/pages/feature_pages/chat_room/chat_room_binding.dart';
import 'package:tedikap_admin/app/pages/feature_pages/detail_menu/detail_menu.dart';
import 'package:tedikap_admin/app/pages/feature_pages/detail_menu/detail_menu_binding.dart';
import 'package:tedikap_admin/app/pages/feature_pages/detail_reward/detail_reward.dart';
import 'package:tedikap_admin/app/pages/feature_pages/detail_reward/detail_reward_binding.dart';
import 'package:tedikap_admin/app/pages/feature_pages/edit_menu/edit_menu.dart';
import 'package:tedikap_admin/app/pages/feature_pages/edit_menu/edit_menu_binding.dart';
import 'package:tedikap_admin/app/pages/feature_pages/edit_reward/edit_reward.dart';
import 'package:tedikap_admin/app/pages/feature_pages/edit_reward/edit_reward_binding.dart';
import 'package:tedikap_admin/app/pages/feature_pages/edit_voucher/edit_voucher.dart';
import 'package:tedikap_admin/app/pages/feature_pages/edit_voucher/edit_voucher_binding.dart';
import 'package:tedikap_admin/app/pages/feature_pages/home_page/home_binding.dart';
import 'package:tedikap_admin/app/pages/feature_pages/menu_page/menu_binding.dart';
import 'package:tedikap_admin/app/pages/feature_pages/menu_page/reward_binding.dart';
import 'package:tedikap_admin/app/pages/feature_pages/menu_page/widget/tab_content_reward.dart';
import 'package:tedikap_admin/app/pages/feature_pages/order_page/order_binding.dart';
import 'package:tedikap_admin/app/pages/feature_pages/order_status/order_status_binding.dart';
import 'package:tedikap_admin/app/pages/feature_pages/tambah_menu/tambah_menu_binding.dart';
import 'package:tedikap_admin/app/pages/feature_pages/tambah_notif/tambah_notif_binding.dart';
import 'package:tedikap_admin/app/pages/feature_pages/chat_page/chat_admin.dart';
import 'package:tedikap_admin/app/pages/feature_pages/chat_room/chat_room.dart';
import 'package:tedikap_admin/app/pages/feature_pages/home_page/home_page_view.dart';
import 'package:tedikap_admin/app/pages/feature_pages/order_page/order_list.dart';
import 'package:tedikap_admin/app/pages/feature_pages/tambah_notif/tambah_notif.dart';
import 'package:tedikap_admin/app/pages/feature_pages/tambah_reward_product/tambah_reward.dart';
import 'package:tedikap_admin/app/pages/feature_pages/tambah_reward_product/tambah_reward_binding.dart';
import 'package:tedikap_admin/app/pages/feature_pages/tambah_voucher/tambah_promo.dart';
import 'package:tedikap_admin/app/pages/feature_pages/menu_page/menu_admin.dart';
import 'package:tedikap_admin/app/pages/feature_pages/tambah_menu/tambah_menu.dart';
import 'package:tedikap_admin/app/pages/feature_pages/promo_page/promo_binding.dart';
import 'package:tedikap_admin/app/pages/feature_pages/promo_page/promo_view.dart';
import 'package:tedikap_admin/app/pages/feature_pages/tambah_voucher/tambah_promo_binding.dart';
import 'package:tedikap_admin/app/pages/global_components/navbar/navbar_binding.dart';
import 'package:tedikap_admin/app/pages/initial_pages/login_page/login_admin.dart';
import 'package:tedikap_admin/app/pages/initial_pages/splash_screen/splash_screen.dart';
import 'package:tedikap_admin/app/pages/initial_pages/splash_screen/splash_screen_binding.dart';
import 'package:tedikap_admin/app/pages/initial_pages/splash_screen/splash_screen_two.dart';
import 'package:tedikap_admin/app/pages/global_components/navbar/bottom_navbar.dart';

import '../app/pages/feature_pages/order_status/order_status.dart';

part 'AppRoutes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.NAVBAR  ;

  static final routes = [
    GetPage(
      name: _Paths.NAVBAR,
      page: () => MyNavBar(),
      bindings: [NavBarBinding(), MenuBinding(), HomeBinding(), ChatBinding()],
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
      binding: SplashScreenBinding(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: _Paths.SPLASH2,
      page: () => SplashTwo(),
      binding: SplashScreenBinding(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 300),
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
      name: _Paths.TAMBAH_PROMO,
      page: () => TambahPromo(),
      binding: TambahPromoBinding(),
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
    GetPage(
      name: _Paths.PROMO_VIEW,
      page: () => PromoView(),
      binding: PromoBinding(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: _Paths.EDIT_PROMO,
      page: () => EditVoucher(),
      binding: EditVoucherBinding(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: _Paths.EDIT_MENU,
      page: () => EditMenu(),
      binding: EditMenuBinding(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: _Paths.DETAIL_MENU,
      page: () => DetailMenu(),
      binding: DetailMenuBinding(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(name: _Paths.REWARD,
     page: ()=> MenuRewardTabContent(),
     binding: RewardBinding(),
     ),
     GetPage(
      name: _Paths.DETAIL_REWARD,
      page: () => DetailReward(),
      binding: DetailRewardBinding(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: _Paths.EDIT_REWARD,
      page: () => EditReward(),
      binding: EditRewardBinding(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: _Paths.TAMBAH_REWARD,
      page: () => TambahReward(),
      binding: TambahRewardBinding(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 300),
    ),
  ];
}
