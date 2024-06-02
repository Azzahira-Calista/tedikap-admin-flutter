import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:tedikap_admin/app/pages/feature_pages/voucher_page/voucher_controller.dart';
import 'package:tedikap_admin/app/pages/feature_pages/voucher_page/widget/voucher_banner.dart';
import 'package:tedikap_admin/app/pages/global_components/button.dart';
import 'package:tedikap_admin/common/themes.dart';
import 'package:tedikap_admin/routes/AppPages.dart';

class VoucherView extends GetView<VoucherController> {
  const VoucherView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Get.offAndToNamed(Routes.NAVBAR);
              },
              icon: Icon(Icons.arrow_back_ios)),
          title: Text(
            'Voucher ',
            style: appBarText,
          ),
          automaticallyImplyLeading: false,
          centerTitle: true,
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.8,
                  child: ListView.builder(
                    // shrinkWrap: true,
                    itemCount: 2,
                    itemBuilder: (BuildContext context, int index) {
                      return VoucherBanner();
                    },
                  ),
                ),
                myButton(
                  text: 'Tambah voucher',
                  onPressed: () {
                    Get.toNamed(Routes.TAMBAH_VOUCHER);
                  },
                  color: primaryColor,
                  textColor: white,
                ),
              ],
            ),
          ),
        ));
  }
}
