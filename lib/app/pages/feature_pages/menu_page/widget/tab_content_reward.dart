import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tedikap_admin/app/pages/feature_pages/menu_page/widget/item_menu.dart';

import '../../../../../common/themes.dart';
import '../../../../../routes/AppPages.dart';
import '../../../global_components/button.dart';
import '../menu_controller.dart';
import 'menu_filter.dart';

class MenuRewardTabContent extends GetView<MenusController> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(20),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.6,
          child: Column(
            children: [
              MenuFilter(),
              SizedBox(height: 10,),
              Obx(() {
                if (controller.isLoading.value) {
                  return Center(child: CircularProgressIndicator());
                }
                if (controller.productResponseModel.isEmpty) {
                  return Center(child: Text('No product available'));
                }
                return Expanded(
                  child: CustomScrollView(
                    slivers: [
                      SliverGrid(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 12,
                          mainAxisSpacing: 20,
                          childAspectRatio: 1.4,
                        ),
                        delegate: SliverChildBuilderDelegate(
                              (BuildContext context, int index) {
                            final product = controller.productResponseModel[index];
                            return ItemWidget(
                              id: 1,
                              description: 'ini description reward product',
                              name: 'reward product',
                              regular_price: 100,
                              large_price: 200,
                              image: 'https://tedikap-api.rplrus.com/storage/reward-product/1719627832.jpg',
                            );
                          },
                          childCount: 2,
                        ),
                      ),
                    ],
                  ),
                );
              }),
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
      ),
    );
  }
}

