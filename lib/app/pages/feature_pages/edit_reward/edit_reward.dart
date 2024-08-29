import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../common/themes.dart';
import '../../global_components/button.dart';
import '../../global_components/textfield.dart';
import 'edit_reward_controller.dart';

class EditReward extends GetView<EditRewardController> {
  const EditReward({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(Icons.arrow_back_ios)),
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
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            Container(
                              margin: EdgeInsets.symmetric(
                                horizontal: width * 0.1,
                                vertical: height * 0.02,
                              ),
                              decoration: BoxDecoration(
                                border: Border.all(color: offColor, width: 2),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              height: height * 0.3,
                              width: width,
                              child: Obx(
                                () => controller.selectedImage.value != null
                                    ? Image.file(
                                        controller.selectedImage.value!,
                                        fit: BoxFit.cover,
                                      )
                                    : controller.imageUrl.isNotEmpty
                                        ? Image.network(
                                            "https://tedikap-api.rplrus.com/storage/reward-product/${controller.imageUrl}",
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
                              controller: controller.nameController,
                              hintText: "Enter the name",
                              name: "Name",
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "This field cannot be empty";
                                }
                                return null;
                              },
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Category",
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
                                      borderSide:
                                          const BorderSide(color: primaryColor),
                                    ),
                                    contentPadding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                  ),
                                  value: controller.selectedCategory.value,
                                  items:
                                      ['tea', 'nontea', 'yakult', 'merchandise']
                                          .map((category) => DropdownMenuItem(
                                                value: category,
                                                child: Text(category,
                                                    style: normalText),
                                              ))
                                          .toList(),
                                  onChanged: (value) {
                                    controller.selectedCategory.value = value!;
                                  },
                                  hint: Text(
                                    "Select a category",
                                    style: normalTextPrimary.copyWith(
                                        color: offColor),
                                  ),
                                ),
                                const SizedBox(height: 10),
                              ],
                            ),
                            MyTextField(
                              expand: false,
                              controller: controller.regularPointController,
                              hintText: "Enter the point for regular size",
                              name: "Regular price",
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "This field cannot be empty";
                                }
                                return null;
                              },
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              textInputType: TextInputType.number,
                            ),
                            MyTextField(
                              expand: false,
                              controller: controller.largePointController,
                              hintText: "Enter the point for large size",
                              name: "Large price",
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "This field cannot be empty";
                                }
                                return null;
                              },
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              textInputType: TextInputType.number,
                            ),
                            MyTextField(
                              hintText: 'Enter the description',
                              name: 'Description',
                              expand: false,
                              textInputType: TextInputType.multiline,
                              controller: controller.descriptionController,
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
                child: myButton(
                  text: "Change",
                  onPressed: () {
                    //  error
                    controller.editProduct();
                    // Get.toNamed(Routes.NAVBAR + Routes.MENU);
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
