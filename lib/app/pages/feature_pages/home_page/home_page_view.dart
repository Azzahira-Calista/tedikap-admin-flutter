import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tedikap_admin/app/pages/feature_pages/home_page/widgets/appbar_home.dart';
import 'package:tedikap_admin/app/pages/feature_pages/home_page/widgets/check_order_button.dart';
import 'package:tedikap_admin/app/pages/feature_pages/home_page/widgets/summary.dart';
import 'package:tedikap_admin/app/pages/feature_pages/home_page/home_controller.dart';

class HomePage extends GetView<HomeController> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  AppBarHome(),
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * 0.02,
                  ),
                  CheckOrderButton(),
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * 0.02,
                  ),
                  SalesSummary(),
                  SizedBox(
                    height: 20,
                  ),
                  
                ],
              )),
        ),
      ),
    );
  }
}


