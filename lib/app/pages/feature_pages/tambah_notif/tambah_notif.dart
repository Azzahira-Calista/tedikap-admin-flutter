import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tedikap_admin/app/pages/feature_pages/tambah_notif/tambah_notif_controller.dart';
import 'package:tedikap_admin/common/themes.dart';
import 'package:tedikap_admin/app/pages/global_components/button.dart';
import 'package:tedikap_admin/app/pages/global_components/textfield.dart';

import '../../../../routes/AppPages.dart';

class TambahNotif extends GetView<TambahNotifController> {
  const TambahNotif({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tambah Notifikasi", style: appBarText),
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
                        onTap: () => controller.pickImage(),
                        child: Obx(() => Container(
                              height: MediaQuery.of(context).size.height * 0.3,
                              width: MediaQuery.of(context).size.width,
                              margin: EdgeInsets.symmetric(
                                // horizontal:
                                //     MediaQuery.of(context).size.width * 0.1,
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
                                            "Klik untuk mengunggah gambar (opsional)",
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
                          controller: controller.titleController,
                          hintText: "Enter the title",
                          name: "TItle",
                          height: 50,
                          obsecureText: false,
                        ),
                        MyTextField(
                          controller: controller.bodyController,
                          hintText: "Enter the description",
                          name: "Description",
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
              text: "Tambah",
              onPressed: () {
                controller.sendNotification();
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
