import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:tedikap_admin/app/pages/global_components/button.dart';
import 'package:tedikap_admin/common/themes.dart';

import '../../../../common/constant.dart';
import '../../../../routes/AppPages.dart';
import 'detail_menu_controller.dart';

class DetailMenu extends GetView<DetailMenuController> {
  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> arguments = Get.arguments;

    if (arguments == null) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Error"),
        ),
        body: Center(
          child: Text("No arguments provided"),
        ),
      );
    }
    final String name = arguments['name'];
    final int regular_price = arguments['regular_price'];
    final int large_price = arguments['large_price'];
    final String description =
        arguments['description'] ?? 'No description available';
    final String image = arguments['image'];
    final int id = arguments['id'];

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
              Get.toNamed(Routes.EDIT_MENU, arguments: {
                'id': id,
                'name': name,
                'regular_price': regular_price,
                'large_price': large_price,
                'image': image,
                'description': description,
              });
            },
            child: Container(
              decoration: BoxDecoration(
                color: primaryColor,
                image: DecorationImage(
                  image: AssetImage(image),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(15),
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
                height: MediaQuery.of(context).size.height * 0.7,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.4,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                            "https://tedikap-api.rplrus.com/storage/product/$image",
                          ),
                          fit: BoxFit.cover,
                        ),
                        border: Border.all(color: offColor, width: 2),
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(name, style: cardText),
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.01),
                          Text(description, style: normalText),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4),
                            child: Row(
                              children: [
                                Icon(Icons.favorite_rounded,
                                    color: primaryColor, size: 24),
                                SizedBox(width: 5),
                                Text("Liked by 1000 people",
                                    style: normalTextPrimary),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(),
                          Text("Price",
                              style: normalText.copyWith(
                                  fontWeight: FontWeight.bold)),
                          Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Regular price", style: normalText),
                                  Row(
                                    children: [
                                      Text(
                                        "Rp",
                                        style: normalTextPrimary,
                                      ),
                                      Text(
                                        regular_price.toString(),
                                        style: cardText,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Large price", style: normalText),
                                  Row(
                                    children: [
                                      Text(
                                        "Rp",
                                        style: normalTextPrimary,
                                      ),
                                      Text(
                                        large_price.toString(),
                                        style: cardText,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: myButtonLogo(
                  text: 'Delete menu',
                  onPressed: () {
                    Get.defaultDialog(
                        title: "Delete menu",
                        middleText: "Are you sure want to delete this menu?",
                        textConfirm: "Yes",
                        textCancel: "No",
                        onConfirm: () {
                          Get.back(); // Close the dialog first
                          controller.deleteProduct();
                        },
                        onCancel: () {});
                  },
                  color: red,
                  textColor: white,
                  logo: deleteIcon,
                  logoColor: white,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
