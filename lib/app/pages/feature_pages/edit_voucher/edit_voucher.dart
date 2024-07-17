import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/themes.dart';
import '../../../../routes/AppPages.dart';
import '../../global_components/button.dart';
import '../../global_components/textfield.dart';
import 'edit_voucher_controller.dart';

class EditVoucher extends GetView<EditVoucherController> {
  const EditVoucher({super.key});

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
              width: MediaQuery
                  .sizeOf(context)
                  .width * 0.15,
            ),
            InkWell(
              onTap: () {
                Get.defaultDialog(
                    title: "Delete menu",
                    middleText: "Are you sure want to delete this menu?",
                    textConfirm: "Yes",
                    textCancel: "No",
                    onConfirm: () {
                      Get.back(); // Close the dialog first
                      controller.deleteVoucher();
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
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(
                          vertical: MediaQuery
                              .of(context)
                              .size
                              .height * 0.02,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(color: offColor, width: 2),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        height: MediaQuery
                            .of(context)
                            .size
                            .height * 0.2,
                        width: MediaQuery
                            .of(context)
                            .size
                            .width,
                        child: controller.imageUrl.isNotEmpty
                            ? InkWell(
                          onTap: () {
                            controller.pickImage();
                          },
                          child: controller.imagePath.isEmpty ? Image(
                            image: NetworkImage(
                                "https://tedikap-api.rplrus.com/storage/voucher/${controller
                                    .imageUrl}"),
                            fit: BoxFit.cover,
                          ) : Obx(() {
                            return Image.file(File(controller.imagePath.value),
                              fit: BoxFit.cover,);
                          }),
                        )
                            : InkWell(
                          onTap: () {
                            controller.pickImage();
                          },
                          child: controller.imagePath.isEmpty ? Column(
                            mainAxisAlignment: MainAxisAlignment.center,
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
                          ) : Image.file(File(controller.imagePath.value),
                            fit: BoxFit.cover,),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery
                            .of(context)
                            .size
                            .height * 0.05,
                      ),
                      Column(
                        children: [
                          MyTextField(
                            controller: controller.titleController,
                            hintText: "Enter the name",
                            name: "Name",
                            height: 50,
                            obsecureText: false,
                          ),
                          MyTextField(
                            controller: controller.descriptionController,
                            hintText: "Enter the category",
                            name: "Deskripsi",
                            height: 50,
                            obsecureText: false,
                          ),
                          MyTextField(
                            controller: controller.discountController,
                            hintText: "Enter the discount",
                            name: "Persentasi diskon",
                            height: 50,
                            obsecureText: false,
                          ),
                          MyTextField(
                            controller: controller.minTransactionController,
                            hintText: "Enter the minimum transaction",
                            name: "Minimal transaksi",
                            height: 50,
                            obsecureText: false,
                          ),
                          MyTextField(
                            controller: controller.startDateController,
                            hintText: "Enter the start date",
                            name: "Berlaku mulai",
                            height: 50,
                            obsecureText: false,
                            textInputType: TextInputType.datetime,
                            onTap: () =>
                                controller.selectDate(
                                    context, controller.startDateController),
                          ),
                          MyTextField(
                            controller: controller.endDateController,
                            hintText: "Enter the end date",
                            name: "Berlaku hingga",
                            height: 50,
                            obsecureText: false,
                            textInputType: TextInputType.datetime,
                            onTap: () =>
                                controller.selectDate(
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
                text: "Change",
                onPressed: () {
                  controller.editVoucher();
                  Get.toNamed(Routes.PROMO_VIEW);
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
