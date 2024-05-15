// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:tedikap_admin/controllers/login_controller.dart';
import 'package:tedikap_admin/themes.dart';
import 'package:tedikap_admin/widgets/button.dart';
import 'package:tedikap_admin/widgets/item_menu.dart';

import '../../router/pages.dart';

class MenuPage extends StatelessWidget {
  final LoginController loginController = Get.put(LoginController());

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
                  MenuTabContent(loginController: loginController),
                  MenuTabContent(loginController: loginController),
                  MenuTabContent(loginController: loginController),
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
  final LoginController loginController;

  MenuTabContent({required this.loginController});

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
              itemCount: loginController.loginResponseModel.length,
              itemBuilder: (BuildContext context, int index) {
                final login = loginController.loginResponseModel[index];
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
