import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tedikap_admin/app/pages/feature_pages/menu_page/widget/tab_content.dart';
import 'package:tedikap_admin/app/pages/feature_pages/menu_page/widget/tab_content_reward.dart';
import 'package:tedikap_admin/common/themes.dart';

import 'menu_controller.dart';

class MenuPage extends GetView<MenusController> {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text("Tedikap Menu", style: appBarText),
          centerTitle: true,
        ),
        body: Obx(() {
          if (controller.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return Column(
              children: [
                const Column(
                  children: [
                    TabBar(
                      unselectedLabelColor: offColor,
                      labelColor: primaryColor,
                      indicatorColor: primaryColor,
                      indicatorSize: TabBarIndicatorSize.tab,
                      tabs: [
                        Tab(text: "Common Product"),
                        Tab(text: "Reward Product"),
                      ],
                    ),
                  ],
                ),
                Expanded(
                  child: TabBarView(
                    children: [
                      const MenuTabContent(),
                      MenuRewardTabContent(),
                    ],
                  ),
                ),
              ],
            );
          }
        }),
      ),
    );
  }
}
