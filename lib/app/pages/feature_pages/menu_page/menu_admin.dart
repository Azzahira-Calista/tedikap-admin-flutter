// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tedikap_admin/app/pages/feature_pages/menu_page/menu_controller.dart' as MenuController;
import 'package:tedikap_admin/common/themes.dart';
import 'package:tedikap_admin/app/pages/global_components/button.dart';
import 'package:tedikap_admin/app/pages/feature_pages/menu_page/widget/item_menu.dart';

import '../../../../routes/AppPages.dart';

class MenuPage extends StatelessWidget {
  final MenuController.MenuController loginController = Get.put(MenuController.MenuController());

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
                  MenuTabContent(menuController: loginController),
                  MenuTabContent(menuController: loginController),
                  MenuTabContent(menuController: loginController),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MenuTabContent extends StatelessWidget {
  final MenuController.MenuController menuController;

  MenuTabContent({required this.menuController});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 20,
                childAspectRatio: 1.4,
              ),
              itemCount: menuController.productResponseModel.length,
              itemBuilder: (BuildContext context, int index) {
                final login = menuController.productResponseModel[index];
                return ItemWidget(
                  title: login.name,
                  price: login.price,
                  image: login.image,
                );
              },
            ),
            SizedBox(height: 30),
            myButton(
              text: 'Tambah menu',
              onPressed: () {
                Get.toNamed(Routes.TAMBAH_MENU);
              },
              color: primaryColor,
              textColor: white,
            ),
          ],
        ),
      ),
    );
  }
}
