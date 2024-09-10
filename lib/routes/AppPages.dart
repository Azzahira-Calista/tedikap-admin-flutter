// ignore_for_file: constant_identifier_names

import 'package:get/get.dart';
import 'package:tedikap_admin/app/pages/feature_pages/box_promo/box_promo_binding.dart';
import 'package:tedikap_admin/app/pages/feature_pages/box_promo/box_promo_view.dart';
import 'package:tedikap_admin/app/pages/feature_pages/chat_page/chat_binding.dart';
import 'package:tedikap_admin/app/pages/feature_pages/chat_room/chat_room_binding.dart';
import 'package:tedikap_admin/app/pages/feature_pages/crud_page/crud_binding.dart';
import 'package:tedikap_admin/app/pages/feature_pages/crud_page/crud_page.dart';
import 'package:tedikap_admin/app/pages/feature_pages/detail_menu/detail_menu.dart';
import 'package:tedikap_admin/app/pages/feature_pages/detail_menu/detail_menu_binding.dart';
import 'package:tedikap_admin/app/pages/feature_pages/detail_reward/detail_reward.dart';
import 'package:tedikap_admin/app/pages/feature_pages/detail_reward/detail_reward_binding.dart';
import 'package:tedikap_admin/app/pages/feature_pages/edit_box_promo/edit_box_promo.dart';
import 'package:tedikap_admin/app/pages/feature_pages/edit_box_promo/edit_box_promo_binding.dart';
import 'package:tedikap_admin/app/pages/feature_pages/edit_menu/edit_menu.dart';
import 'package:tedikap_admin/app/pages/feature_pages/edit_menu/edit_menu_binding.dart';
import 'package:tedikap_admin/app/pages/feature_pages/edit_reward/edit_reward.dart';
import 'package:tedikap_admin/app/pages/feature_pages/edit_reward/edit_reward_binding.dart';
import 'package:tedikap_admin/app/pages/feature_pages/edit_session_time/edit_session_time_binding.dart';
import 'package:tedikap_admin/app/pages/feature_pages/edit_session_time/edit_session_time_view.dart';
import 'package:tedikap_admin/app/pages/feature_pages/edit_slider_banner/edit_slider_banner.dart';
import 'package:tedikap_admin/app/pages/feature_pages/edit_slider_banner/edit_slider_banner_binding.dart';
import 'package:tedikap_admin/app/pages/feature_pages/edit_voucher/edit_voucher.dart';
import 'package:tedikap_admin/app/pages/feature_pages/edit_voucher/edit_voucher_binding.dart';
import 'package:tedikap_admin/app/pages/feature_pages/history_page/history_binding.dart';
import 'package:tedikap_admin/app/pages/feature_pages/history_page/history_page.dart';
import 'package:tedikap_admin/app/pages/feature_pages/home_page/home_binding.dart';
import 'package:tedikap_admin/app/pages/feature_pages/image_slider_banner/image_slider_binding.dart';
import 'package:tedikap_admin/app/pages/feature_pages/image_slider_banner/image_slider_view.dart';
import 'package:tedikap_admin/app/pages/feature_pages/menu_page/menu_binding.dart';
import 'package:tedikap_admin/app/pages/feature_pages/menu_page/reward_binding.dart';
import 'package:tedikap_admin/app/pages/feature_pages/menu_page/widget/tab_content_reward.dart';
import 'package:tedikap_admin/app/pages/feature_pages/order_page/order_binding.dart';
import 'package:tedikap_admin/app/pages/feature_pages/order_status/order_status_binding.dart';
import 'package:tedikap_admin/app/pages/feature_pages/promo_page/promo_page_binding.dart';
import 'package:tedikap_admin/app/pages/feature_pages/review_page/review_binding.dart';
import 'package:tedikap_admin/app/pages/feature_pages/review_page/review_page.dart';
import 'package:tedikap_admin/app/pages/feature_pages/scan_page/scan_page_binding.dart';
import 'package:tedikap_admin/app/pages/feature_pages/scan_page/scan_page_view.dart';
import 'package:tedikap_admin/app/pages/feature_pages/tambah_box_promo/tambah_box_promo.dart';
import 'package:tedikap_admin/app/pages/feature_pages/tambah_box_promo/tambah_box_promo_binding.dart';
import 'package:tedikap_admin/app/pages/feature_pages/tambah_menu/tambah_menu_binding.dart';
import 'package:tedikap_admin/app/pages/feature_pages/tambah_notif/tambah_notif_binding.dart';
import 'package:tedikap_admin/app/pages/feature_pages/chat_page/chat_admin.dart';
import 'package:tedikap_admin/app/pages/feature_pages/chat_room/chat_room.dart';
import 'package:tedikap_admin/app/pages/feature_pages/home_page/home_page_view.dart';
import 'package:tedikap_admin/app/pages/feature_pages/order_page/order_list.dart';
import 'package:tedikap_admin/app/pages/feature_pages/tambah_notif/tambah_notif.dart';
import 'package:tedikap_admin/app/pages/feature_pages/tambah_promo/tambah_promo_binding.dart';
import 'package:tedikap_admin/app/pages/feature_pages/tambah_reward_product/tambah_reward.dart';
import 'package:tedikap_admin/app/pages/feature_pages/tambah_reward_product/tambah_reward_binding.dart';
import 'package:tedikap_admin/app/pages/feature_pages/tambah_slider_banner/tambah_slider_banner.dart';
import 'package:tedikap_admin/app/pages/feature_pages/tambah_promo/pick%20product/pick_product.dart';
import 'package:tedikap_admin/app/pages/feature_pages/tambah_voucher/tambah_voucher.dart';
import 'package:tedikap_admin/app/pages/feature_pages/menu_page/menu_admin.dart';
import 'package:tedikap_admin/app/pages/feature_pages/tambah_menu/tambah_menu.dart';
import 'package:tedikap_admin/app/pages/feature_pages/voucher_page/voucher_binding.dart';
import 'package:tedikap_admin/app/pages/feature_pages/voucher_page/voucher_view.dart';
import 'package:tedikap_admin/app/pages/feature_pages/tambah_voucher/tambah_voucher_binding.dart';
import 'package:tedikap_admin/app/pages/global_components/navbar/navbar_binding.dart';
import 'package:tedikap_admin/app/pages/initial_pages/login_page/login_admin.dart';
import 'package:tedikap_admin/app/pages/initial_pages/splash_screen/splash_screen.dart';
import 'package:tedikap_admin/app/pages/initial_pages/splash_screen/splash_screen_binding.dart';
import 'package:tedikap_admin/app/pages/initial_pages/splash_screen/splash_screen_two.dart';
import 'package:tedikap_admin/app/pages/global_components/navbar/bottom_navbar.dart';

import '../app/pages/feature_pages/order_status/order_status.dart';
import '../app/pages/feature_pages/promo_page/promo_page_view.dart';
import '../app/pages/feature_pages/tambah_promo/tambah_promo_page_view.dart';
import '../app/pages/feature_pages/tambah_slider_banner/tambah_slider_banner_binding.dart';

part 'AppRoutes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH1;

  static final routes = [
    GetPage(
      name: _Paths.NAVBAR,
      page: () => MyNavBar(),
      bindings: [
        NavBarBinding(),
        MenuBinding(),
        HomeBinding(),
        OrderBinding(),
        CrudBinding(),
      ],
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
      page: () => const MenuPage(),
      binding: MenuBinding(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: _Paths.CHAT,
      page: () => const ChatPage(),
      binding: ChatBinding(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: _Paths.ORDER,
      page: () => const OrderList(),
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
      page: () => const OrderStatus(),
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
      page: () => const TambahMenu(),
      binding: TambahMenuBinding(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: _Paths.TAMBAH_VOUCHER,
      page: () => const TambahVoucher(),
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
      page: () => const TambahNotif(),
      binding: TambahNotifBinding(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: _Paths.VOUCHER_VIEW,
      page: () => const VoucherView(),
      binding: VoucherBinding(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: _Paths.EDIT_VOUCHER,
      page: () => const EditVoucher(),
      binding: EditVoucherBinding(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: _Paths.EDIT_MENU,
      page: () => const EditMenu(),
      binding: EditMenuBinding(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: _Paths.DETAIL_MENU,
      page: () => const DetailMenu(),
      binding: DetailMenuBinding(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: _Paths.REWARD,
      page: () => MenuRewardTabContent(),
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
      page: () => const EditReward(),
      binding: EditRewardBinding(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: _Paths.TAMBAH_REWARD,
      page: () => const TambahReward(),
      binding: TambahRewardBinding(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: _Paths.HISTORY_PAGE,
      page: () => const HistoryPage(),
      binding: HistoryBinding(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: _Paths.CRUD_PAGE,
      page: () => const CrudPage(),
      binding: CrudBinding(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: _Paths.BOX_PROMO,
      page: () => const BoxPromoView(),
      binding: BoxPromoBinding(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: _Paths.EDIT_BOX_PROMO,
      page: () => const EditBoxPromo(),
      binding: EditBoxPromoBinding(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: _Paths.TAMBAH_BOX_PROMO,
      page: () => const TambahBoxPromo(),
      binding: TambahBoxPromoBinding(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: _Paths.IMAGE_BANNER,
      page: () => const ImageSliderView(),
      binding: ImageSliderBinding(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: _Paths.EDIT_IMAGE_BANNER,
      page: () => const EditSliderBanner(),
      binding: EditSliderBannerBinding(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: _Paths.TAMBAH_IMAGE_BANNER,
      page: () => const TambahSliderBanner(),
      binding: TambahSliderBannerBinding(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: _Paths.REVIEW_PAGE,
      page: () => const ReviewPage(),
      binding: ReviewBinding(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: _Paths.SCAN,
      page: () => const ScanPage(),
      binding: ScanPageBinding(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: _Paths.EDIT_SESSION_TIME,
      page: () => const EditSessionTimeView(),
      binding: EditSessionTimeBinding(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: _Paths.PROMO_PAGE,
      page: () => const PromoPage(),
      binding: PromoPageBinding(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: _Paths.TAMBAH_PROMO,
      page: () => const TambahPromoPageView(),
      binding: TambahPromoBinding(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: _Paths.PICK_PRODUCT,
      page: () => PickProducPromo(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 300),
    ),

  ];
}
