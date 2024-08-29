import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:tedikap_admin/app/pages/feature_pages/tambah_notif/tambah_notif_controller.dart';
import 'package:tedikap_admin/common/constant.dart';
import 'package:tedikap_admin/common/themes.dart';
import 'package:tedikap_admin/app/pages/global_components/button.dart';
import 'package:tedikap_admin/app/pages/global_components/textfield.dart';

class TambahNotif extends GetView<TambahNotifController> {
  const TambahNotif({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Send Notification", style: appBarText),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.arrow_back_ios)),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Column(
                      children: [
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 20),
                              child: SvgPicture.asset(
                                sendNotifIcon,
                                width: MediaQuery.sizeOf(context).width * 0.5,
                              ),
                            ),
                            Text('Send Notification to all users',
                                style: normalText)
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        MyTextField(
                                                    expand: false,

                          controller: controller.titleController,
                          hintText: "Enter the title",
                          name: "TItle",
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "This field cannot be empty";
                            }
                            return null;
                          },
                        ),
                        MyTextField(
                                                    expand: false,

                          controller: controller.bodyController,
                          hintText: "Enter the description",
                          name: "Description",
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
              text: "Send",
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
