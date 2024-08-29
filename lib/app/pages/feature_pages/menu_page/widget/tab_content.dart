import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tedikap_admin/app/pages/feature_pages/menu_page/widget/item_menu.dart';

import '../../../../../common/themes.dart';
import '../../../../../routes/AppPages.dart';
import '../menu_controller.dart';
import 'menu_filter.dart';

class MenuTabContent extends GetView<MenusController> {
  const MenuTabContent({super.key});

  Future<void> refreshData() async {
    controller.fetchFilteredProducts('tea');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: primaryColor,
        onPressed: () {
          Get.toNamed(Routes.TAMBAH_MENU);
        },
        child: const Icon(
          Icons.add,
          color: white,
        ),
      ),
      body: RefreshIndicator(
          onRefresh: refreshData,
          child: Container(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.05),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  MenuFilter(),
                  const SizedBox(
                    height: 10,
                  ),
                  Obx(() {
                    if (controller.isLoading.value) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    if (controller.productResponseModel.isEmpty) {
                      return const Center(child: Text('No product available'));
                    }
                    return SingleChildScrollView(
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: controller.productResponseModel.length,
                        itemBuilder: (context, index) {
                          final product =
                              controller.productResponseModel[index];
                          return ItemWidget(
                            category: product.category!,
                            description: product.description!,
                            stock: product.stock!,
                            id: product.id!,
                            name: product.name!,
                            regular_price: product.regularPrice!,
                            large_price: product.largePrice!,
                            image: product.image!,
                            favorites_count: product.favoritesCount,
                          );
                        },
                      ),
                    );
                  }),
                ],
              ),
            ),
          )),
    );
  }
}
