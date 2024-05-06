part of 'pages.dart';

abstract class Routes {
  Routes._();
  static const HOME = _Paths.HOME;
  static const MENU = _Paths.MENU;
  static const CHAT = _Paths.CHAT;
  static const NAVBAR = _Paths.NAVBAR;
}

abstract class _Paths {
  _Paths._();
  static const HOME = '/home';
  static const MENU = '/menu';
  static const CHAT = '/chat';
  static const NAVBAR = '/bottom-navbar';

}