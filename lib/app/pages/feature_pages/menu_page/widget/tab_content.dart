import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tedikap_admin/app/pages/feature_pages/menu_page/widget/item_menu.dart';

import '../../../../../common/themes.dart';
import '../../../../../routes/AppPages.dart';
import '../../../global_components/button.dart';
import '../menu_controller.dart';
import 'menu_filter.dart';

class MenuTabContent extends GetView<MenusController> {
  Future<void> refreshData() async {
    controller.getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: RefreshIndicator(
        onRefresh: refreshData,
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(20),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.7,
              child: Column(
                children: [
                  MenuFilter(),
                  SizedBox(
                    height: 10,
                  ),
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
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 12,
                              mainAxisSpacing: 20,
                              childAspectRatio: 1.4,
                            ),
                            delegate: SliverChildBuilderDelegate(
                              (BuildContext context, int index) {
                                final product =
                                    controller.productResponseModel[index];
                                return ItemWidget(
                                  description: product.description!,
                                  id: product.id!,
                                  name: product.name!,
                                  regular_price: product.regularPrice!,
                                  large_price: product.largePrice!,
                                  image: product.image!,
                                );
                              },
                              childCount:
                                  controller.productResponseModel.length,
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
        ),
      ),
    );
  }
}
