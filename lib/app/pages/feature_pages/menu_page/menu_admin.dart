// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tedikap_admin/app/pages/feature_pages/menu_page/menu_controller.dart'
    as MenuController;
import 'package:tedikap_admin/app/pages/feature_pages/menu_page/widget/tab_content.dart';
import 'package:tedikap_admin/common/themes.dart';

// ignore: must_be_immutable
class MenuPage extends GetView<MenuController.MenuController> {
  MenuController.MenuController controller =
      Get.put(MenuController.MenuController());
  MenuPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            "Tedikap Menu",
            style: appBarText,
          ),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Container(
              color: Colors.white,
              child: TabBar(
                unselectedLabelColor: offColor,
                labelColor: primaryColor,
                indicatorColor: primaryColor,
                indicatorSize: TabBarIndicatorSize.tab,
                tabs: [
                  Tab(text: "Tea"),
                  Tab(text: "Non Tea"),
                  Tab(text: "Snacks"),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  MenuTabContent(menuController: controller),
                  MenuTabContent(menuController: controller),
                  MenuTabContent(menuController: controller),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
