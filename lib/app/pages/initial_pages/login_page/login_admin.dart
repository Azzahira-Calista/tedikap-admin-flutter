import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:tedikap_admin/app/firebase/global_service.dart';
import 'package:tedikap_admin/app/pages/initial_pages/login_page/login_controller.dart';
import 'package:tedikap_admin/common/constant.dart';
import 'package:tedikap_admin/common/themes.dart';
import 'package:tedikap_admin/app/pages/global_components/button.dart';
import 'package:tedikap_admin/app/pages/global_components/textfield.dart';

class LoginPage extends GetView<LoginController> {
  final LoginController controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: screenWidth * 0.6,
                      child: Text(
                        "Welcome back",
                        style: headline,
                      ),
                    ),
                    SvgPicture.asset(
                      logoTedikap,
                      width: 80,
                    ),
                  ],
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.065),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MyTextField(
                        textInputType: TextInputType.emailAddress,
                        controller: controller.emailController,
                        obsecureText: false,
                        hintText:
                            GlobalVariables.deviceToken ?? "Enter your email",
                        name: "Email",
                        height: 50,
                      ),
                      Obx(
                        () => MyTextField(
                          hintText: "Enter your password",
                          controller: controller.passwordController,
                          obsecureText: controller.obsecureText.value,
                          name: "Password",
                          suffixIcon: IconButton(
                            icon: Icon(
                              controller.obsecureText.value
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: offColor,
                            ),
                            onPressed: () {
                              controller.toggle();
                            },
                          ),
                          height: 50,
                        ),
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.020),
                      myButton(
                        text: "Login",
                        onPressed: () {
                          controller.login();
                        },
                        color: primaryColor,
                        textColor: white,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
