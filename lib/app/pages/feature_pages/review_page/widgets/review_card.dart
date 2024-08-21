import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:tedikap_admin/app/pages/feature_pages/review_page/review_controller.dart';
import 'package:tedikap_admin/common/themes.dart';

class ReviewCard extends GetView<ReviewController> {
  final int id;
  final int user_id;
  final String order_id;
  final String name;
  final String avatar;
  final double staff_service;
  final double product_quality;
  final String note;

  ReviewCard({
    required this.id,
    required this.user_id,
    required this.order_id,
    required this.name,
    required this.avatar,
    required this.staff_service,
    required this.product_quality,
    required this.note,
  }); 
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      width: width,
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: lightGrey,
            spreadRadius: 1,
            blurRadius: 10,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                            "https://tedikap-api.rplrus.com/storage/avatar/$avatar"),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(name, style: cardText),
                      Text(
                        order_id,
                        style: normalText,
                      ),
                    ],
                  ),
                ],
              ),
              Text("August-09-2025",
                  style: cardTitle.copyWith(color: offColor)),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Column(
            children: [
              Row(
                children: [
                  Text('Product Quality', style: normalText),
                  Text(
                    product_quality.toString() + '⭐⭐⭐⭐',
                    style: normalText,
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text('Staff Serving', style: normalText),
                  Text(
                    staff_service.toString() + '⭐⭐⭐⭐', 
                    style: normalText,
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Text(
              '"' +
                  note +
                  '"',
              style: normalText),
        ],
      ),
    );
  }
}
