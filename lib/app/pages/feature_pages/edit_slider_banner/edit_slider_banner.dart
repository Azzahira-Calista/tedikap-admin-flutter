import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../../common/themes.dart';
import '../../../../routes/AppPages.dart';
import '../../../api/api_endpoint.dart';
import '../../global_components/button.dart';
import 'edit_slider_banner_controller.dart';

class EditSliderBanner extends GetView<EditSliderBannerController> {
  const EditSliderBanner({super.key});

  final String image = ApiEndpoint.imageUrl;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(Icons.arrow_back_ios)),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              'Edit Image slider banner',
              style: appBarText,
            ),
            SizedBox(
              width: MediaQuery.sizeOf(context).width * 0.15,
            ),
            InkWell(
              onTap: () {
                Get.defaultDialog(
                    title: "Delete menu",
                    middleText: "Are you sure want to delete this menu?",
                    textConfirm: "Yes",
                    textCancel: "No",
                    onConfirm: () {
                      Get.back();
                      controller.deleteImageBanner();
                    },
                    onCancel: () {});
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                decoration: BoxDecoration(
                  color: red,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  "Delete",
                  style: normalText.copyWith(color: Colors.white),
                ),
              ),
            )
          ],
        ),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: Column(children: [
        Expanded(
          child: Container(
            margin: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.height * 0.02,
            ),
            decoration: BoxDecoration(
              border: Border.all(color: offColor, width: 2),
              borderRadius: BorderRadius.circular(15),
            ),
            height: MediaQuery.of(context).size.height * 0.2,
            width: MediaQuery.of(context).size.width,
            child: controller.imageUrl.isNotEmpty
                ? InkWell(
                    onTap: () {
                      controller.pickImage();
                    },
                    child: controller.imagePath.isEmpty
                        ? Image(
                            image: NetworkImage(
                                // imageUrl
                                "$image/banner/${controller.imageUrl}"),
                            fit: BoxFit.cover,
                          )
                        : Obx(() {
                            return Image.file(
                              File(controller.imagePath.value),
                              fit: BoxFit.cover,
                            );
                          }),
                  )
                : InkWell(
                    onTap: () {
                      controller.pickImage();
                    },
                    child: controller.imagePath.isEmpty
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.add_photo_alternate,
                                size: 50,
                                color: offColor,
                              ),
                              Text(
                                "Click to upload image",
                                style:
                                    normalTextPrimary.copyWith(color: offColor),
                              )
                            ],
                          )
                        : Image.file(
                            File(controller.imagePath.value),
                            fit: BoxFit.cover,
                          ),
                  ),
          ),
        ),
        Container(
          padding: EdgeInsets.only(left: 20, right: 20, bottom: 50),
          child: myButton(
            text: "Change",
            onPressed: () {
              controller.editImageBanner();
              // Get.toNamed(Routes.EDIT_IMAGE_BANNER);
            },
            color: primaryColor,
            textColor: white,
          ),
        ),
      ]),
    );
  }
}
