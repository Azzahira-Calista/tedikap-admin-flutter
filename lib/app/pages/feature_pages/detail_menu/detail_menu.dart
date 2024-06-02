import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:tedikap_admin/app/pages/global_components/button.dart';
import 'package:tedikap_admin/common/themes.dart';

import '../../../../common/constant.dart';
import '../../../../routes/AppPages.dart';
import 'detail_menu_controller.dart';

class DetailMenu extends GetView<DetailMenuController> {
  const DetailMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(Icons.arrow_back_ios)),
        automaticallyImplyLeading: false,
        title: Align(
          alignment: Alignment.centerRight,
          child: InkWell(
            onTap: () {
              Get.toNamed(Routes.EDIT_MENU);
            },
            child: Container(
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(10),
              ),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              height: 40,
              width: 125,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SvgPicture.asset(
                    editIcon,
                    width: 16,
                  ),
                  Text(
                    "Edit menu",
                    style: normalText.copyWith(color: Colors.white),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.6,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.4,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        border: Border.all(color: offColor, width: 2),
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Nama Menu", style: cardText),
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.01),
                          Text("Deskerpsi Menu", style: normalText),
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.005),
                          Row(
                            children: [
                              Icon(Icons.favorite_rounded,
                                  color: primaryColor, size: 18),
                              SizedBox(width: 5),
                              Text("Liked by 1000 people",
                                  style: normalTextPrimary),
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Harga",
                              style: normalText.copyWith(
                                  fontWeight: FontWeight.bold)),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "Rp",
                                    style: normalTextPrimary,
                                  ),
                                  Text(
                                    " 100.000",
                                    style: cardText,
                                  ),
                                ],
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                                decoration: BoxDecoration(
                                  color: primaryColor,
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                child: Text(
                                  "Rating",
                                  style: cardText.copyWith(color: white),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              myButtonLogo(
                text: 'Delete menu',
                onPressed: () {
                  Get.defaultDialog(
                      title: "Delete menu",
                      middleText: "Are you sure want to delete this menu?",
                      textConfirm: "Yes",
                      textCancel: "No",
                      onConfirm: () {
                        Get.toNamed(Routes.NAVBAR + Routes.MENU);
                      },
                      onCancel: () {});
                },
                color: red,
                textColor: white,
                logo: deleteIcon,
                logoColor: white,
              )
            ],
          ),
        ),
      ),
    );
  }
}
