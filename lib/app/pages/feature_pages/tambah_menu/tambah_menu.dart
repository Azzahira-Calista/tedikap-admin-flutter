import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:tedikap_admin/app/pages/feature_pages/tambah_menu/tmbah_menu_controller.dart';
import 'package:tedikap_admin/common/themes.dart';
import 'package:tedikap_admin/app/pages/global_components/button.dart';

// import '../../../../routes/AppPages.dart';
import '../../global_components/textfield.dart';

class TambahMenu extends GetView<TambahMenuController> {
  const TambahMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Tambah Menu",
          style: appBarText,
        ),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(Icons.arrow_back_ios)),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    InkWell(
                        onTap: () {
                          controller.pickImage(controller.imagePath);
                        },
                        child: Obx(() => Container(
                              height: MediaQuery.of(context).size.height * 0.2,
                              width: MediaQuery.of(context).size.width,
                              margin: EdgeInsets.symmetric(
                                horizontal:
                                    MediaQuery.of(context).size.width * 0.1,
                                vertical:
                                    MediaQuery.of(context).size.height * 0.02,
                              ),
                              decoration: BoxDecoration(
                                border: Border.all(color: offColor, width: 2),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: controller.imagePath.value.isNotEmpty
                                  ? Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        image: DecorationImage(
                                          image: FileImage(
                                            File(controller.imagePath.value),
                                          ),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    )
                                  : Center(
                                      child: Column(
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
                                      ),
                                    ),
                            ))),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.05,
                    ),
                    Column(
                      children: [
                        MyTextField(
                          controller: controller.nameController,
                          hintText: "Enter the name",
                          name: "Name",
                          height: 50,
                          obsecureText: false,
                        ),
                        MyTextField(
                          controller: controller.categoryController,
                          hintText: "Enter the category",
                          name: "Category",
                          height: 50,
                          obsecureText: false,
                        ),
                        MyTextField(
                          controller: controller.regularPriceController,
                          obsecureText: false,
                          hintText: "Enter the price for regular size",
                          name: "Regular price",
                          height: 50,
                        ),
                        MyTextField(
                          controller: controller.largePriceController,
                          obsecureText: false,
                          hintText: "Enter the price for large size",
                          name: "Large price",
                          height: 50,
                        ),
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Description",
                                style: subTitle,
                                textAlign: TextAlign.left,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              TextFormField(
                                controller: controller.descrptionController,
                                decoration: InputDecoration(
                                  hintText: "Enter the description",
                                  hintStyle: hint,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide: BorderSide(color: offColor),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 50),
            child: myButton(
              text: "Tambah",
              onPressed: () {
                controller.addProduct();
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
