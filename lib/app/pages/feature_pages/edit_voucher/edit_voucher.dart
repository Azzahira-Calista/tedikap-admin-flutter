import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

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
                      Stack(
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(
                              vertical:
                                  MediaQuery.of(context).size.height * 0.03,
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(color: offColor, width: 2),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            height: MediaQuery.of(context).size.height * 0.2,
                            width: MediaQuery.of(context).size.width,
                            child:
                                Obx(() => controller.selectedImage.value != null
                                    ? Image.file(
                                        controller.selectedImage.value!,
                                        fit: BoxFit.cover,
                                      )
                                    : controller.imageUrl.isNotEmpty
                                        ? Image.network(
                                            "https://tedikap-api.rplrus.com/storage/voucher/${controller.imageUrl}",
                                            fit: BoxFit.cover,
                                          )
                                        : Column(
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
                                                style: normalTextPrimary
                                                    .copyWith(color: offColor),
                                              ),
                                            ],
                                          )),
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Padding(
                              padding: EdgeInsets.only(bottom: 10),
                              child: GestureDetector(
                                onTap: () async {
                                  final ImagePicker _picker = ImagePicker();
                                  final XFile? image = await _picker.pickImage(
                                      source: ImageSource.gallery);
                                  if (image != null) {
                                    controller.setImage(image);
                                  }
                                },
                                child: Container(
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                    color: white,
                                    border: Border.all(
                                        color: primaryColor, width: 2),
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  child: Icon(
                                    Icons.edit,
                                    size: 40,
                                    color: primaryColor,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
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
                            name: "Maximum Discount",
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
                text: "Change",
                onPressed: () {
                  controller.editVoucher();
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
