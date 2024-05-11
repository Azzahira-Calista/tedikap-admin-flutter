import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:tedikap_admin/themes.dart';

class OrderCard extends StatelessWidget {
  const OrderCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      margin: EdgeInsets.only(bottom: 20),
      width: MediaQuery.of(context).size.width,
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
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
            ),
            child: Row(
              children: [
                Container(
                  height: 25,
                  width: 25,
                  decoration: BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Yasa kafi",
                  style: cardText.copyWith(color: white),
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            deliveryIcon,
                            height: 25,
                          ),
                          Text(
                            "Delivery",
                            style: cardTitle.copyWith(
                              fontWeight: FontWeight.w500,
                            ),
                          )
                        ],
                      ),
                    ),
                    Text("5 minutes ago",
                        style: smallText.copyWith(
                            color: offColor, fontWeight: FontWeight.w700)),
                  ],
                ),
                Divider(
                  color: offColor,
                ),
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          width: 180,
                          child: Text(
                            "Original tea, Chocolate Hazelnut",
                            style: normalText,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          )),
                      SizedBox(
                          height: MediaQuery.sizeOf(context).height * 0.01),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("2 items",
                              style: smallText.copyWith(
                                  color: offColor,
                                  fontWeight: FontWeight.w500)),
                          Row(
                            children: [
                              Text("Total :",
                                  style: smallText.copyWith(
                                      color: offColor,
                                      fontWeight: FontWeight.w500)),
                              Text("Rp 50.000",
                                  style: smallText.copyWith(
                                      color: offColor,
                                      fontWeight: FontWeight.w700)),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                          height: MediaQuery.sizeOf(context).height * 0.015),
                      Container(
                          width: MediaQuery.sizeOf(context).width,
                          height: 30,
                          child: ElevatedButton(
                            onPressed: () {
                              Get.toNamed("/order-status");
                            },
                            child: Center(
                              child: Text("Detail Pesanan",
                                  style: button2.copyWith(color: white)),
                            ),
                            style: ElevatedButton.styleFrom(
                                // primary: Colors.transparent,
                                shadowColor: Colors.transparent,
                                backgroundColor: primaryColor,
                                foregroundColor: white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                )),
                          ))
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
