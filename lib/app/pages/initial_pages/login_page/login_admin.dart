// ignore_for_file: use_key_in_widget_constructors, must_be_immutable, override_on_non_overriding_member

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:tedikap_admin/app/pages/initial_pages/login_page/login_controller.dart';
import 'package:tedikap_admin/common/constant.dart';
import 'package:tedikap_admin/common/themes.dart';
import 'package:tedikap_admin/app/pages/global_components/button.dart';
import 'package:tedikap_admin/app/pages/global_components/textfield.dart';

class LoginPage extends GetView<LoginController> {
  LoginController controller = Get.put(LoginController());
  LoginPage({Key? key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    // double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
        backgroundColor: white,
        body: SafeArea(
          child: SingleChildScrollView(
              // controller: controller,

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
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.065,
                      ),
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            MyTextField(
                                controller: controller.emailController,
                                obsecureText: false,
                                hintText: "Enter your email",
                                name: "Email",
                                height: 50),
                            MyTextField(
                                hintText: "Enter your password",
                                controller: controller.passwordController,
                                obsecureText: true,
                                name: "Password",
                                height: 50),
                            SizedBox(
                              height: 10,
                            ),
                            Text("Forgot Password?", style: normalText),
                            SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.020,
                            ),
                            myButton(
                                text: "Login",
                                onPressed: () {
                                  controller.login();
                                },
                                color: primaryColor,
                                textColor: white),

                            // Row(children: <Widget>[
                            //   Expanded(
                            //     child: Divider(
                            //       color: black,
                            //       thickness: 1,
                            //     ),
                            //   ),
                            //   Container(
                            //     margin: EdgeInsets.symmetric(
                            //         horizontal: 10,
                            //         vertical: MediaQuery.of(context)
                            //                 .size
                            //                 .height *
                            //             0.020),
                            //     child: Text(
                            //       "Or",
                            //       style: smallText,
                            //     ),
                            //   ),
                            // Expanded(
                            //   child: Divider(
                            //     color: black,
                            //     thickness: 1,
                            //   ),
                            // ),
                            // ]),
                            // SizedBox(
                            //   height: MediaQuery.of(context).size.height * 0.010,
                            // ),
                            // myButtonLogo(
                            //     sideColor: offColor,
                            //     text: "Login with Google",
                            //     onPressed: () {},
                            //     color: Colors.white,
                            //     textColor: primaryTextColor,
                            //     logo: logoGoogle),
                            // SizedBox(
                            //   height:
                            //       MediaQuery.of(context).size.height *
                            //           0.030,
                            // ),
                            // Row(
                            //   mainAxisAlignment:
                            //       MainAxisAlignment.center,
                            //   children: [
                            //     Text(
                            //       "Don't have an account?",
                            //       style: normalText,
                            //     ),
                            //     SizedBox(
                            //       width: 5,
                            //     ),
                            //     Text(
                            //       "Register",
                            //       style: normalTextPrimary,
                            //     ),
                            //   ],
                            // )
                          ],
                        ),
                      ),
                    ],
                  ))),
        ));
  }
}
