import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tedikap_admin/app/pages/feature_pages/tambah_promo/pick%20product/pick_product_controller.dart';
import 'package:tedikap_admin/app/pages/feature_pages/tambah_promo/tambah_promo_controller.dart';
import 'package:tedikap_admin/routes/AppPages.dart';

import '../../../../../common/themes.dart';

class PickProducPromo extends StatelessWidget {
  final PickProductController controller = Get.put(PickProductController());

   PickProducPromo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Pick product promo", style: appBarText),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body:Obx(
            () {
          final controller = Get.find<PickProductController>();

          if (controller.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          } else if (controller.productResponseModel.isEmpty) {
            return Center(child: Text('No products available.', style: normalText));
          } else {
            return ListView.builder(
              itemCount: controller.productResponseModel.length,
              itemBuilder: (context, index) {
                final product = controller.productResponseModel[index];
                return RadioListTile<int>(
                  title: Text(product.name ?? 'No Name', style: normalText),
                  value: product.id!,
                  groupValue: controller.selectedProductId.value,
                  onChanged: (value) {
                    controller.isLoading.value = true;
                    controller.selectedProductId.value = value!;
                    controller.isLoading.value = false;


                  },
                );
              },
            );
          }
        },
      ),

        floatingActionButton: FloatingActionButton(
          backgroundColor: primaryColor,
        onPressed: () {
          if (controller.selectedProductId.value != null) {
            Get.toNamed(Routes.TAMBAH_PROMO, arguments: {
              'selectedProductId': controller.selectedProductId.value,
            });
          } else {
            Get.snackbar(
              'Selection Error',
              'Please select a product.',
            );
          }
        },
        child: const Icon(Icons.arrow_forward, color: white,),
      ),
    );

  }
}
