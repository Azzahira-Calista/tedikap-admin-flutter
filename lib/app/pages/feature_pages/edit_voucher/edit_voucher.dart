import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../common/constant.dart';
import '../../../../common/themes.dart';
import '../../global_components/alert.dart';
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
            icon: const Icon(Icons.arrow_back_ios)),
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
                Get.dialog(
                  ReusableDialog(
                      dialogImage: SvgPicture.asset(iconDelete, height: 100,),
                      title: "Delete Voucher",
                      content: "Are you sure want to delete this voucher?",
                      cancelText: "No",
                      confirmText: "Yes",
                      onCancelPressed: (){Get.back();},
                      onConfirmPressed: (){Get.back();controller.deleteVoucher();}),
                );

              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
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
                  padding: const EdgeInsets.all(20),
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
                                              const Icon(
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
                              padding: const EdgeInsets.only(bottom: 10),
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
                                  child: const Icon(
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
                            expand: false,
                            controller: controller.titleController,
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
                            textInputType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            hintText: "Enter the discount (eg. 10)",
                            name: "Discount Percentage (%)",
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
                          // MyTextField(
                          //   expand: false,
                          //   readOnly: true,
                          //   controller: controller.startDateController,
                          //   inputFormatters: [
                          //     FilteringTextInputFormatter.digitsOnly
                          //   ],
                          //   hintText: "Enter the date",
                          //   name: "Valid From",
                          //   textInputType: TextInputType.datetime,
                          //   onTap: () => controller.selectDate(
                          //       context, controller.startDateController),
                          //   validator: (value) {
                          //     if (value!.isEmpty) {
                          //       return "This field cannot be empty";
                          //     }
                          //     return null;
                          //   },
                          // ),
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
            ),
            Container(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 50),
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
