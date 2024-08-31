import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:tedikap_admin/app/pages/feature_pages/image_slider_banner/image_slider_controller.dart';
import 'package:tedikap_admin/app/pages/global_components/alert.dart';

import '../../../../../common/constant.dart';
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
                        Get.dialog(
                          ReusableDialog(
                              dialogImage: SvgPicture.asset(iconDelete, height: 100,),
                              title: "Delete Image Slider Banner",
                              content: "Are you sure want to delete this image?",
                              cancelText: "No",
                              confirmText: "Yes",
                              onCancelPressed: (){Get.back();},
                              onConfirmPressed: (){Get.back();
                                controller.deleteImageSlider(id);}),
                        );
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
