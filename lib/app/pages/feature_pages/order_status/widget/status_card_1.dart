import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tedikap_admin/common/constant.dart';
import 'package:tedikap_admin/app/pages/global_components/button.dart';

import '../../../../../common/themes.dart';

class NewOrderStatus extends StatelessWidget {
  const NewOrderStatus({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
              color: offColor,
              offset: Offset(0, 4),
              blurRadius: 4,
              spreadRadius: 0.25)
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            decoration: BoxDecoration(
              // color: primaryColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
            ),
            child:
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                Row(
              children: [
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Yasa kafi",
                  style: cardText.copyWith(color: primaryTextColor),
                ),
              ],
            ),
            //     Container(
            //         height: 25,
            //         child: ElevatedButton(
            //           onPressed: () {},
            //           child: Center(
            //             child: Text("Belum siap",
            //                 style: button2.copyWith(color: primaryTextColor)),
            //           ),
            //           style: ElevatedButton.styleFrom(
            //               // primary: Colors.transparent,
            //               // shadowColor: Colors.transparent,
            //               backgroundColor: offColor,
            //               foregroundColor: white,
            //               shape: RoundedRectangleBorder(
            //                 borderRadius: BorderRadius.circular(10),
            //               )),
            //         ))
            //   ],
            // ),
          ),
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.02,
          ),
          Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Daftar Pesanan",
                  style: cardText,
                ),
              ),
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "2",
                        style: subTitle,
                      ),
                      SizedBox(
                        width: MediaQuery.sizeOf(context).width * 0.04,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Teh Lemon Tedikap",
                            style: subTitle,
                          ),
                          Text(
                            "Ice Temp, Regular Size, Less Ice",
                            style: cardTitle.copyWith(color: offColor),
                          )
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "Rp",
                        style: cardTitle,
                      ),
                      Text(
                        "8.000",
                        style: cardTitle,
                      ),
                    ],
                  )
                ],
              ),
              Divider(
                color: offColor,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.08,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Total Pesanan :", style: cardTitle),
                        Text("2", style: cardTitle),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Total Harga :", style: cardTitle),
                        Row(
                          children: [
                            Text(
                              "Rp",
                              style: cardTitle,
                            ),
                            Text(
                              "8.000",
                              style: cardTitle,
                            ),
                          ],
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Metode Pembayaran :", style: cardTitle),
                        Text("Gopay", style: cardTitle),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.05,
                    width: MediaQuery.of(context).size.width * 0.38,
                    child: myButton(
                        text: "Terima",
                        onPressed: () => (),
                        color: primaryColor,
                        textColor: white),
                  ),
                  Container(
                      height: MediaQuery.of(context).size.height * 0.05,
                      width: MediaQuery.of(context).size.width * 0.38,
                      child: Container(
                          height: MediaQuery.of(context).size.height * 0.05,
                          width: MediaQuery.of(context).size.width * 0.38,
                          child: ElevatedButton(
                            onPressed: () {},
                            child: Center(
                              child: Text("Tolak",
                                  style: button.copyWith(color: red)),
                            ),
                            style: ElevatedButton.styleFrom(
                                // primary: Colors.transparent,
                                surfaceTintColor: white,
                                shadowColor: Colors.transparent,
                                backgroundColor: white,
                                foregroundColor: red,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    side: BorderSide(color: red, width: 1))),
                          ))),
                ],
              ),
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.02,
              ),
              myButtonLogo(
                  logoColor: primaryColor,
                  sideColor: cream,
                  text: "Hubungi Pelanggan",
                  onPressed: () {},
                  color: cream,
                  textColor: primaryColor,
                  logo: chatIcon)
            ],
          ),
        ],
      ),
    );
  }
}
