import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../common/themes.dart';
import '../../global_components/button.dart';
import 'tambah_slider_banner_controller.dart.dart';

class TambahSliderBanner extends GetView<TambahSliderBannerController> {
  const TambahSliderBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tambah Slider Banner", style: appBarText),
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
                                              "Klik untuk mengunggah gambar",
                                              style: normalTextPrimary.copyWith(
                                                  color: offColor),
                                            )
                                          ],
                                        ),
                                      ),
                              ))),
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
                  controller.addSliderBanner();
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
