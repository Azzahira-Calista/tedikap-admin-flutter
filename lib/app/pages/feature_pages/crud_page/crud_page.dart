import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:get/get.dart';
import 'package:tedikap_admin/app/pages/feature_pages/crud_page/crud_controller.dart';
import 'package:tedikap_admin/app/pages/feature_pages/crud_page/widgets/crud_buttons.dart';
import 'package:tedikap_admin/app/pages/feature_pages/crud_page/widgets/crud_small_button.dart';
import 'package:tedikap_admin/common/themes.dart';

import '../../../../routes/AppPages.dart';

class CrudPage extends GetView<CrudController> {
  const CrudPage({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Widgets Page',
          style: appBarText,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          width: width,
          // color: lightGrey,
          margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Review',
                    style: normalText.copyWith(color: darkGrey),
                  ),
                  // Container(
                  //   height: 2,
                  //   width: width * 0.7,
                  //   color: darkGrey,
                  // ),
                ],
              ),

              CrudButton(
                  title: "Customer Review",
                  iconData: Icons.reviews,
                  routeName: Routes.REVIEW_PAGE),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  Text(
                    'Global Notification',
                    style: normalText.copyWith(color: darkGrey),
                  ),
                  // Container(
                  //   height: 2,
                  //   width: width * 0.5,
                  //   color: darkGrey,
                  // ),
                ],
              ),

              CrudButton(
                  title: "Notification",
                  iconData: Icons.notification_add,
                  routeName: Routes.TAMBAH_NOTIF),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  Text(
                    'Create and Update',
                    style: normalText.copyWith(color: darkGrey),
                  ),
                  // Container(
                  //   height: 2,
                  //   width: width * 0.5,
                  //   color: darkGrey,
                  // ),
                ],
              ),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10.0,
                  crossAxisSpacing: 10.0,
                ),
                itemCount: 5,
                itemBuilder: (BuildContext context, int index) {
                  switch (index) {
                    case 0:
                      return const CrudSmallButton(
                          title: "Banner",
                          iconData: Icons.image,
                          routeName: Routes.IMAGE_BANNER);
                    case 1:
                      return const CrudSmallButton(
                          title: "Box Promo",
                          iconData: Icons.confirmation_number_sharp,
                          routeName: Routes.BOX_PROMO);
                    case 2:
                      return const CrudSmallButton(
                          title: "Voucher",
                          iconData: Icons.discount,
                          routeName: Routes.VOUCHER_VIEW);
                      case 3:
                        return const CrudSmallButton(
                          title: "Session Time",
                          iconData: Icons.timer,
                          routeName: Routes.EDIT_SESSION_TIME);
                        case 4:
                        return const CrudSmallButton(
                          title: "Promo",
                          iconData: Icons.money_off_csred_rounded,
                          routeName: Routes.PROMO_PAGE);
                    default:
                      return Container();
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
