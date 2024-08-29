import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:tedikap_admin/app/pages/feature_pages/tambah_reward_product/tambah_reward_controller.dart';
import 'package:tedikap_admin/common/themes.dart';
import 'package:tedikap_admin/app/pages/global_components/button.dart';

// import '../../../../routes/AppPages.dart';
import '../../global_components/textfield.dart';

class TambahReward extends GetView<TambahRewardController> {
  const TambahReward({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Add Reward Menu",
          style: appBarText,
        ),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.arrow_back_ios)),
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
                        onTap: () => controller.pickImage(),
                        child: Obx(() => Container(
                              height: MediaQuery.of(context).size.height * 0.3,
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
                                          const Icon(
                                            Icons.add_photo_alternate,
                                            size: 50,
                                            color: offColor,
                                          ),
                                          Text(
                                            "Click to upload image",
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
                          expand: false,
                          controller: controller.nameController,
                          hintText: "Enter the name",
                          name: "Name",
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "This field cannot be empty";
                            }
                            return null;
                          },
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Category",
                              style: subTitle,
                              textAlign: TextAlign.left,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            DropdownButtonFormField<String>(
                              decoration: InputDecoration(
                                focusColor: primaryColor,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: const BorderSide(color: offColor),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide:
                                      const BorderSide(color: primaryColor),
                                ),
                                contentPadding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                              ),
                              value: controller.selectedCategory.value,
                              items: ['tea', 'nontea', 'yakult', 'merchandise']
                                  .map((category) => DropdownMenuItem(
                                        value: category,
                                        child:
                                            Text(category, style: normalText),
                                      ))
                                  .toList(),
                              onChanged: (value) {
                                controller.selectedCategory.value = value!;
                              },
                              hint: Text(
                                "Select a category",
                                style:
                                    normalTextPrimary.copyWith(color: offColor),
                              ),
                            ),
                            const SizedBox(height: 10),
                          ],
                        ),
                        MyTextField(
                          expand: false,
                          controller: controller.regularPointController,
                          hintText: "Enter the price for regular size",
                          textInputType: TextInputType.number,
                          name: "Regular price",
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "This field cannot be empty";
                            }
                            return null;
                          },
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                        ),
                        MyTextField(
                          expand: false,
                          controller: controller.largePointController,
                          hintText: "Enter the price for large size",
                          name: "Large price",
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "This field cannot be empty";
                            }
                            return null;
                          },
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          textInputType: TextInputType.number,
                        ),
                        MyTextField(
                          hintText: 'Enter the description',
                          name: 'Description',
                          expand: false,
                          textInputType: TextInputType.multiline,
                          controller: controller.descriptionController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "This field cannot be empty";
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
            child: myButton(
              text: "Add",
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
