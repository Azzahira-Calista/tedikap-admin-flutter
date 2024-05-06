import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:tedikap_admin/controllers/navbar_controller.dart';
import 'package:tedikap_admin/themes.dart';
import 'package:tedikap_admin/views/home/home_admin.dart';
import 'package:tedikap_admin/views/menu/menu_admin.dart';

class MyNavBar extends StatelessWidget {
  final NavigationController navigationController =
      Get.put(NavigationController());

  final List<Widget> pages = [HomePage(), MenuPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Obx(() => pages[navigationController.currentPage.value]),
        bottomNavigationBar: Obx(
          () => BottomNavigationBar(
            currentIndex: navigationController.currentPage.value,
            onTap: (index) {
              navigationController.currentPage.value = index;
            },
            backgroundColor: Colors.white,
            selectedItemColor: activeColor,
            unselectedItemColor: offColor,
            items: [
              BottomNavigationBarItem(
                icon: Obx(() => Container(
                      height: 24.0, // Adjust this value as needed
                      child: SvgPicture.asset(
                          navigationController.currentPage.value == 0
                              ? homeFilledIcon
                              : homeIcon),
                    )),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: Obx(() => Container(
                      height: 24.0,
                      child: SvgPicture.asset(
                          navigationController.currentPage.value == 1
                              ? drinkFilledIcon
                              : drinkIcon),
                    )),
                label: "Menu",
              ),
              BottomNavigationBarItem(
                icon: Obx(() => Container(
                      height: 24.0,
                      child: SvgPicture.asset(
                          navigationController.currentPage.value == 2
                              ? chatFilledIcon
                              : chatIcon),
                    )),
                label: "Chat",
              ),
            ],
          ),
        ));
  }
}
