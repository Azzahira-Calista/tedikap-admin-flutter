import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tedikap_admin/app/pages/feature_pages/edit_box_promo/edit_box_promo_controller.dart';

import '../../../../common/themes.dart';
import '../../global_components/button.dart';
import '../../global_components/textfield.dart';

class EditBoxPromo extends GetView<EditBoxPromoController> {
  const EditBoxPromo({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
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
              'Edit Box Promo',
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
                      controller.deleteBoxPromo();
                    },
                    onCancel: () {});
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
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
      body: Column(
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
                            // horizontal: width,
                            vertical: height * 0.03,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(color: offColor, width: 2),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          height: height * 0.2,
                          width: width,
                          child: Obx(
                            () => controller.selectedImage.value != null
                                ? Image.file(
                                    controller.selectedImage.value!,
                                    fit: BoxFit.cover,
                                  )
                                : controller.imageUrl.isNotEmpty
                                    ? Image.network(
                                        "https://tedikap-api.rplrus.com/storage/box-promo/${controller.imageUrl}",
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
                                            style: normalTextPrimary.copyWith(
                                                color: offColor),
                                          ),
                                        ],
                                      ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: GestureDetector(
                              onTap: () async {
                                final ImagePicker picker = ImagePicker();
                                final XFile? image = await picker.pickImage(
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
                                  border:
                                      Border.all(color: primaryColor, width: 2),
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
                          controller: controller.subTitleController,
                          hintText: "Enter the category",
                          name: "Sub title",
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
                controller.editBoxPromo();
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
