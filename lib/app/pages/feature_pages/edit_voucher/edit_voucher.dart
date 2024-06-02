// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

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
        title: Text(
          'Edit Voucher',
          style: appBarText,
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
                          vertical: MediaQuery.of(context).size.height * 0.02,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(color: offColor, width: 2),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        height: MediaQuery.of(context).size.height * 0.2,
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.add_photo_alternate,
                              size: 50,
                              color: offColor,
                            ),
                            Text(
                              "Klik untuk mengunggah gambar",
                              style:
                                  normalTextPrimary.copyWith(color: offColor),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.05,
                      ),
                      Column(
                        children: [
                          MyTextField(
                            hintText: "Enter the name",
                            name: "Name",
                            height: 50,
                            obsecureText: false,
                          ),
                          MyTextField(
                            hintText: "Enter the category",
                            name: "Deskripsi",
                            height: 50,
                            obsecureText: false,
                          ),
                          MyTextField(
                            hintText: "Enter the name",
                            name: "Persentasi diskon",
                            height: 50,
                            obsecureText: false,
                          ),
                          MyTextField(
                            hintText: "Enter the name",
                            name: "Minimal transaksi",
                            height: 50,
                            obsecureText: false,
                          ),
                          MyTextField(
                            hintText: "Enter the name",
                            name: "Kadaluarsa",
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
                  Get.toNamed(Routes.VOUCHER_VIEW);
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
