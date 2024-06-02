// ignore_for_file: constant_identifier_names

part of 'AppPages.dart';

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
  static const TAMBAH_VOUCHER = _Paths.TAMBAH_VOUCHER;
  static const CHAT_ROOM = _Paths.CHAT_ROOM;
  static const TAMBAH_NOTIF = _Paths.TAMBAH_NOTIF;
  static const VOUCHER_VIEW = _Paths.VOUCHER_VIEW;
  static const EDIT_VOUCHER = _Paths.EDIT_VOUCHER;
  static const EDIT_MENU = _Paths.EDIT_MENU;
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
  static const TAMBAH_VOUCHER = '/tambah-voucher';
  static const CHAT_ROOM = '/chat-room';
  static const TAMBAH_NOTIF = '/tambah-notif';
  static const VOUCHER_VIEW = '/voucher-view';
  static const EDIT_VOUCHER = '/edit-voucher';
  static const EDIT_MENU = '/edit-menu';
}
