import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:tedikap_admin/app/pages/feature_pages/tambah_voucher/tambah_voucher_controller.dart';
import 'package:tedikap_admin/app/pages/global_components/alert.dart';
import 'package:tedikap_admin/common/constant.dart';
import 'package:tedikap_admin/common/themes.dart';
import 'package:tedikap_admin/app/pages/global_components/button.dart';
import 'package:tedikap_admin/app/pages/global_components/textfield.dart';

class TambahVoucher extends GetView<TambahVoucherController> {
  const TambahVoucher({super.key});

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
            icon: const Icon(Icons.arrow_back_ios)),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20),
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
                            height: MediaQuery.of(context).size.height * 0.2,
                            width: MediaQuery.of(context).size.width,
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
                                        ),
                                      ],
                                    ),
                                  ),
                          )),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.05,
                    ),
                    Column(
                      children: [
                        MyTextField(
                          expand: false,
                          controller: controller.nameController,
                          hintText: "Enter the title",
                          name: "Title",
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "This field cannot be empty";
                            }
                            return null;
                          },
                        ),
                        MyTextField(
                          expand: false,
                          controller: controller.descriptionController,
                          hintText: "Enter the description",
                          name: "Description",
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "This field cannot be empty";
                            }
                            return null;
                          },
                        ),
                        MyTextField(
                          expand: false,
                          controller: controller.discountController,
                          hintText: "Enter the discount (eg. 10)",
                          name: "Discount Percentage (%)",
                          textInputType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          validator: (value) {
                            int discount = int.tryParse(
                                    controller.discountController.text) ??
                                0;
                            if (value!.isEmpty) {
                              return "This field cannot be empty";
                            }
                            if (discount > 100) {
                              return "Discount cannot be more than 100";
                            }
                            return null;
                          },
                        ),
                        MyTextField(
                          expand: false,
                          controller: controller.maxDiscountController,
                          textInputType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          hintText: "Enter the maximum discount",
                          name: "Maximum discount",
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "This field cannot be empty";
                            }
                            return null;
                          },
                        ),
                        MyTextField(
                          expand: false,
                          controller: controller.minTransactionController,
                          textInputType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          hintText: "Enter the minimum transaction",
                          name: "Minimum transaction",
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "This field cannot be empty";
                            }
                            return null;
                          },
                        ),

                        MyTextField(
                          expand: false,
                          readOnly: true,
                          controller: controller.endDateController,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          hintText: "Enter the date",
                          name: "Valid Until",
                          textInputType: TextInputType.datetime,
                          onTap: () => controller.selectDate(
                              context, controller.endDateController),
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
            Container(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 50),
              child: myButton(
                text: "Add",
                onPressed: () {
                  Get.dialog(
                    ReusableDialog(
                      title: 'Are you sure you want to add this voucher?',
                      content: 'Voucher auto valid if you click "Yes" button',
                      cancelText: 'No',
                      confirmText: 'Yes',
                      onCancelPressed: (){Get.back();},
                      onConfirmPressed: (){controller.addPromo();},
                      dialogImage: SvgPicture.asset(coupon),
                    ),
                  );
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
