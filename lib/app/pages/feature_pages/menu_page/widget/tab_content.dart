
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tedikap_admin/app/pages/feature_pages/menu_page/widget/item_menu.dart';

import '../../../../../common/themes.dart';
import '../../../../../routes/AppPages.dart';
import '../../../global_components/button.dart';
import '../menu_controller.dart' as MenuController;

class MenuTabContent extends StatelessWidget {
  final MenuController.MenuController menuController;

  MenuTabContent({
    required this.menuController
    });

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
                final controller = menuController.productResponseModel[index];
                return ItemWidget(
                  title: controller.name,
                  price: controller.price,
                  image: controller.image,
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
