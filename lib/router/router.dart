part of 'pages.dart';

abstract class Routes {
  Routes._();
  static const HOME = _Paths.HOME;
  static const MENU = _Paths.MENU;
  static const CHAT = _Paths.CHAT;
  static const NAVBAR = _Paths.NAVBAR;
  static const ORDER = _Paths.ORDER;
  static const SPLASH1 = _Paths.SPLASH1;
  static const SPLASH2 = _Paths.SPLASH2;
  static const ORDER_STATUS = _Paths.ORDER_STATUS;
  static const LOGIN = _Paths.LOGIN;
  static const TAMBAH_MENU = _Paths.TAMBAH_MENU;
}

abstract class _Paths {
  _Paths._();
  static const HOME = '/home';
  static const MENU = '/menu';
  static const CHAT = '/chat';
  static const NAVBAR = '/bottom-navbar';
  static const ORDER = '/order';
  static const SPLASH1 = '/splash1';
  static const SPLASH2 = '/splash2';
  static const ORDER_STATUS = '/order-status';
  static const LOGIN = '/login';
  static const TAMBAH_MENU = '/tambah-menu';
}
