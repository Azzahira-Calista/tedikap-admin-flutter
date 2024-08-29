import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tedikap_admin/app/pages/feature_pages/image_slider_banner/image_slider_controller.dart';

import '../../../../../common/themes.dart';
import '../../../../api/api_endpoint.dart';

class SliderBanner extends GetView<ImageSliderController> {
  final int id;
  final String image;
  final String imageUrl = ApiEndpoint.imageUrl;

  SliderBanner({
    required this.id,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            height: 120,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image:
                      NetworkImage("$imageUrl/banner/$image") as ImageProvider,
                  fit: BoxFit.cover),
              color: primaryColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () {
                        // Get.toNamed(Routes.EDIT_IMAGE_BANNER, arguments: {
                        //   'id': id,
                        //   'image': image,
                        // });
                        Get.defaultDialog(
                            title: "Delete menu",
                            middleText:
                                "Are you sure want to delete this menu?",
                            textConfirm: "Yes",
                            textCancel: "No",
                            onConfirm: () {
                              Get.back(); // Close the dialog first
                              controller.deleteImageSlider(id);
                            },
                            onCancel: () {});
                      },
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        decoration: BoxDecoration(
                          color: red,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          children: [
                            // SvgPicture.asset(
                            //   editIcon,
                            //   color: Colors.white,
                            // ),
                            // Icon(Icons.edit, color: Colors.white, size: 15),
                            SizedBox(width: 5),
                            Text("Delete", style: smallTextWhite),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
