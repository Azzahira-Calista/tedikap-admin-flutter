import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:tedikap_admin/app/pages/feature_pages/image_slider_banner/image_slider_controller.dart';
import 'package:tedikap_admin/app/pages/feature_pages/image_slider_banner/widgets/slider_banner.dart';
import 'package:tedikap_admin/common/constant.dart';

import '../../../../common/themes.dart';
import '../../../../routes/AppPages.dart';
import '../../global_components/button.dart';

class ImageSliderView extends GetView<ImageSliderController> {
  const ImageSliderView({super.key});

  Future<void> refreshData() async {
    await controller.getImageSlider();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
        title: Text(
          'Image slider banner',
          style: appBarText,
        ),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: Stack(
        children: [
          RefreshIndicator(
            onRefresh: refreshData,
            triggerMode: RefreshIndicatorTriggerMode.anywhere,
            child: Obx(() {
              if (controller.isLoading.value) {
                return Center(child: CircularProgressIndicator());
              } else if (controller.imageSliderResponseModel.isEmpty) {
                return ListView(children: [
                  Container(
                    height: Get.height * 0.7,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            orderEmptyIcon,
                            width: 150,
                            height: 150,
                          ),
                          SizedBox(height: 20),
                          Text('No Image slide banner available',
                              style: normalText),
                        ],
                      ),
                    ),
                  ),
                ]);
              } else {
                return ListView.builder(
                  padding: const EdgeInsets.all(20),
                  itemCount: controller.imageSliderResponseModel.length,
                  itemBuilder: (BuildContext context, int index) {
                    final boxPromo = controller.imageSliderResponseModel[index];
                    return SliderBanner(
                      id: boxPromo.id!,
                      image: boxPromo.image!,
                    );
                  },
                );
              }
            }),
          ),
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: myButton(
                  text: 'Tambah image slider',
                  onPressed: () {
                    Get.toNamed(Routes.TAMBAH_IMAGE_BANNER);
                  },
                  color: primaryColor,
                  textColor: white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
