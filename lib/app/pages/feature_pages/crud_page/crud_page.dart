import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tedikap_admin/app/pages/feature_pages/crud_page/crud_controller.dart';
import 'package:tedikap_admin/app/pages/feature_pages/crud_page/widgets/crud_buttons.dart';
import 'package:tedikap_admin/common/themes.dart';

import '../../../../routes/AppPages.dart';

class CrudPage extends GetView<CrudController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'CRUD Page',
          style: appBarText,
        ),
        centerTitle: true,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        // color: lightGrey,
        margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        child: Column(
          children: [
            CrudButton(
                title: "Image Slide Banner",
                iconData: Icons.image,
                routeName: Routes.IMAGE_BANNER),
            // CrudButton(
            //     title: "Box Promo",
            //     iconData: Icons.abc,
            //     routeName: Routes.BOX_PROMO),
            CrudButton(
                title: "Voucher",
                iconData: Icons.discount,
                routeName: Routes.VOUCHER_VIEW),
          ],
        ),
      ),
    );
  }
}
