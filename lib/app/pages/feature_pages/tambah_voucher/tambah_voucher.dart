import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tedikap_admin/common/themes.dart';
import 'package:tedikap_admin/app/pages/global_components/button.dart';
import 'package:tedikap_admin/app/pages/global_components/textfield.dart';

import '../../../../routes/AppPages.dart';

class TambahVoucher extends StatelessWidget {
  const TambahVoucher({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tambah Voucher"),
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
                            style: normalTextPrimary.copyWith(color: offColor),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.05,
                    ),
                    Column(
                      children: [
                        // MyTextField(
                        //   hintText: "Enter the name",
                        //   name: "Name",
                        //   height: 50,
                        // ),
                        // MyTextField(
                        //   hintText: "Enter the category",
                        //   name: "Deskripsi",
                        //   height: 50,
                        // ),
                        // MyTextField(
                        //   hintText: "Enter the name",
                        //   name: "Persentasi diskon",
                        //   height: 50,
                        // ),
                        // MyTextField(
                        //   hintText: "Enter the name",
                        //   name: "Minimal transaksi",
                        //   height: 50,
                        // ),
                        // MyTextField(
                        //   hintText: "Enter the name",
                        //   name: "Kadaluarsa",
                        //   height: 50,
                        // ),
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
                Get.toNamed(Routes.NAVBAR);
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
