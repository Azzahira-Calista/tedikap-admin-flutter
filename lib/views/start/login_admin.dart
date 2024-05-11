import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tedikap_admin/themes.dart';
import 'package:tedikap_admin/widgets/button.dart';
import 'package:tedikap_admin/widgets/textfield.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        // controller: controller,
        child: Container(
            decoration: BoxDecoration(color: Colors.white),
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
                              hintText: "Enter your name", name: "Name", height: 50),
                          MyTextField(
                              hintText: "Enter your email", name: "Email", height: 50),
                          SizedBox(
                            height: 10,
                          ),
                          Text("Forgot Password?", style: normalText),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.020,
                          ),
                          // Container(
                          //   width: MediaQuery.of(context).size.width,
                          //   height: 50,
                          //   decoration: BoxDecoration(color: primaryColor),
                          // )
                          myButton(
                              text: "Login",
                              onPressed: () => (),
                              color: primaryColor,
                              textColor: white),

                          Row(children: <Widget>[
                            Expanded(
                              child: Divider(
                                color: black,
                                thickness: 1,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: MediaQuery.of(context).size.height *
                                      0.020),
                              child: Text(
                                "Or",
                                style: smallText,
                              ),
                            ),
                            Expanded(
                              child: Divider(
                                color: black,
                                thickness: 1,
                              ),
                            ),
                          ]),
                          // SizedBox(
                          //   height: MediaQuery.of(context).size.height * 0.010,
                          // ),
                          myButtonLogo(
                              sideColor: offColor,
                              text: "Login with Google",
                              onPressed: () {},
                              color: Colors.white,
                              textColor: primaryTextColor,
                              logo: logoGoogle),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.030,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Don't have an account?",
                                style: normalText,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "Register",
                                style: normalTextPrimary,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ))),
      ),
    );
  }
}
