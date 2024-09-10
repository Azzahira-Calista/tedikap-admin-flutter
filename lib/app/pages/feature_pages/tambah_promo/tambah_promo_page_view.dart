import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:tedikap_admin/app/pages/feature_pages/tambah_promo/tambah_promo_controller.dart';
import 'package:tedikap_admin/app/pages/global_components/alert.dart';
import 'package:tedikap_admin/app/pages/global_components/button.dart';
import 'package:tedikap_admin/app/pages/global_components/textfield.dart';
import 'package:tedikap_admin/common/themes.dart';

import '../../../../common/constant.dart';

class TambahPromoPageView extends GetView<TambahPromoController> {
  const TambahPromoPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Promo", style: appBarText),
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
                          hintText: "Enter the discount (eg. 1000)",
                          name: "Discount Percentage (Rp)",
                          textInputType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
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
                          controller: controller.startDateController,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          hintText: "Enter the date",
                          name: "Valid From",
                          textInputType: TextInputType.datetime,
                          onTap: () => controller.selectDate(
                              context, controller.startDateController),
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
                        MyTextField(hintText: 'Product Id', name: "Product Id", expand: false, controller: controller.productIdController, validator: (value) {
                          if (value!.isEmpty) {
                            return "This field cannot be empty";
                          }
                          return null;
                        },
                          readOnly: true,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Price Type",
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
                                  borderSide:
                                  const BorderSide(color: offColor),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: const BorderSide(
                                      color: primaryColor),
                                ),
                                contentPadding:
                                const EdgeInsets.symmetric(
                                    horizontal: 10),
                              ),
                              value: controller.selectedPriceType.value,
                              items: ['large', 'regular', ]
                                  .map((category) => DropdownMenuItem(
                                value: category,
                                child: Text(category,
                                    style: normalText),
                              ))
                                  .toList(),
                              onChanged: (value) {
                                controller.selectedPriceType.value =
                                value!;
                              },
                              hint: Text(
                                "Select the price type",
                                style: normalTextPrimary.copyWith(
                                    color: offColor),
                              ),
                            ),
                            const SizedBox(height: 10),
                          ],
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
                      title: 'Are you sure you want to add this promo?',
                      content: 'Promo cannot be edited after added. Are you sure you want to add this promo?',
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
