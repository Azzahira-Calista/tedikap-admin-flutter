import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tedikap_admin/app/pages/feature_pages/edit_box_promo/edit_box_promo_controller.dart';

import '../../../../common/themes.dart';
import '../../../../routes/AppPages.dart';
import '../../global_components/button.dart';
import '../../global_components/textfield.dart';

class EditBoxPromo extends GetView<EditBoxPromoController> {
  const EditBoxPromo({super.key});

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
              'Edit Voucher',
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
                      controller.deleteBoxPromo();
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
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    Container(
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
                                          "https://tedikap-api.rplrus.com/storage/box-promo/${controller.imageUrl}"),
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.add_photo_alternate,
                                          size: 50,
                                          color: offColor,
                                        ),
                                        Text(
                                          "Klik untuk mengunggah gambar",
                                          style: normalTextPrimary.copyWith(
                                              color: offColor),
                                        )
                                      ],
                                    )
                                  : Image.file(
                                      File(controller.imagePath.value),
                                      fit: BoxFit.cover,
                                    ),
                            ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.05,
                    ),
                    Column(
                      children: [
                        MyTextField(
                          controller: controller.titleController,
                          hintText: "Enter the title",
                          name: "Title",
                          height: 50,
                          obsecureText: false,
                        ),
                        MyTextField(
                          controller: controller.subTitleController,
                          hintText: "Enter the category",
                          name: "Sub title",
                          height: 50,
                          obsecureText: false,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 20, right: 20, bottom: 50),
            child: myButton(
              text: "Change",
              onPressed: () {
                controller.editBoxPromo();
                Get.toNamed(Routes.EDIT_BOX_PROMO);
              },
              color: primaryColor,
              textColor: white,
            ),
          ),
        ],
      ),
    );
  }
}
