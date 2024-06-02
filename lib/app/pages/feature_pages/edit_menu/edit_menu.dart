import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/themes.dart';
import '../../../../routes/AppPages.dart';
import '../../global_components/button.dart';
import '../../global_components/textfield.dart';
import 'edit_menu_controller.dart';

class EditMenu extends GetView<EditMenuController> {
  const EditMenu({super.key});

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
            'Edit Menu',
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
                            horizontal: MediaQuery.of(context).size.width * 0.1,
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
                              name: "Category",
                              height: 50,
                              obsecureText: false,
                            ),
                            MyTextField(
                              hintText: "Enter the name",
                              name: "Price",
                              height: 50,
                              obsecureText: false,
                            ),
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Description",
                                    style: subTitle,
                                    textAlign: TextAlign.left,
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  TextFormField(
                                    decoration: InputDecoration(
                                      hintText: "Enter the description",
                                      hintStyle: hint,
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15),
                                        borderSide:
                                            BorderSide(color: primaryColor),
                                      ),
                                      focusColor: primaryColor,
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15),
                                        borderSide: BorderSide(color: offColor),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 50),
                child: myButton(
                  text: "Change",
                  onPressed: () {
                    Get.toNamed(Routes.NAVBAR + Routes.MENU);
                  },
                  color: primaryColor,
                  textColor: white,
                ),
              ),
            ],
          ),
        ));
  }
}
