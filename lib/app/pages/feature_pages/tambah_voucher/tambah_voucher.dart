import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tedikap_admin/app/pages/feature_pages/tambah_voucher/tambah_voucher_controller.dart';
import 'package:tedikap_admin/common/themes.dart';
import 'package:tedikap_admin/app/pages/global_components/button.dart';
import 'package:tedikap_admin/app/pages/global_components/textfield.dart';

class TambahVoucher extends GetView<TambahVoucherController> {
  const TambahVoucher({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Voucher", style: appBarText),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(Icons.arrow_back_ios)),
      ),
      body: SafeArea(
        child: Column(
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
                                margin: EdgeInsets.symmetric(
                                  vertical:
                                      MediaQuery.of(context).size.height * 0.02,
                                ),
                                decoration: BoxDecoration(
                                  border: Border.all(color: offColor, width: 2),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                height:
                                    MediaQuery.of(context).size.height * 0.2,
                                width: MediaQuery.of(context).size.width,
                                child: controller.imagePath.value.isNotEmpty
                                    ? Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
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
                            controller: controller.nameController,
                            hintText: "Enter the title",
                            name: "Title",
                            height: 50,
                            obsecureText: false,
                          ),
                          MyTextField(
                            controller: controller.descriptionController,
                            hintText: "Enter the description",
                            name: "Description",
                            height: 50,
                            obsecureText: false,
                            
                          ),
                          MyTextField(
                            controller: controller.discountController,
                             hintText: "Enter the discount (eg. 10)",
                            name: "Discount Percentage (%)",
                            height: 50,
                            obsecureText: false,
                            onTap: () {
                              int maxDiscount = int.tryParse(
                                      controller.maxDiscountController.text) ??
                                  0;
                              if (maxDiscount > 100) {
                                controller.maxDiscountController.text = '100';
                                Get.snackbar("Notice",
                                    "Maximum discount cannot be more than 100");
                              }
                            },
                          ),
                          MyTextField(
                            controller: controller.maxDiscountController,
                            hintText: "Enter the maximum discount",
                            name: "Maximum discount",
                            height: 50,
                            obsecureText: false,
                          ),
                          MyTextField(
                            controller: controller.minTransactionController,
                            hintText: "Enter the minimum transaction",
                            name: "Minimum transaction",
                            height: 50,
                            obsecureText: false,
                          ),
                          MyTextField(
                            readOnly: true,
                            controller: controller.startDateController,
                            hintText: "Enter the date",
                            name: "Valid From",
                            height: 50,
                            obsecureText: false,
                            textInputType: TextInputType.datetime,
                            onTap: () => controller.selectDate(
                                context, controller.startDateController),
                          ),
                          MyTextField(
                            readOnly: true,
                            controller: controller.endDateController,
                            hintText: "Enter the date",
                            name: "Valid Until",
                            height: 50,
                            obsecureText: false,
                            textInputType: TextInputType.datetime,
                            onTap: () => controller.selectDate(
                                context, controller.endDateController),
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
                text: "Add",
                onPressed: () {
                  controller.addPromo();
                },
                color: primaryColor,
                textColor: white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
