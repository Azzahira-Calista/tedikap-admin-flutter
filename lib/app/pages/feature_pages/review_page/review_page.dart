import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:tedikap_admin/app/pages/feature_pages/review_page/review_controller.dart';
import 'package:tedikap_admin/app/pages/feature_pages/review_page/widgets/review_card.dart';
import 'package:tedikap_admin/app/pages/feature_pages/review_page/widgets/headline/review_headline.dart';
import 'package:tedikap_admin/app/pages/feature_pages/review_page/widgets/review_filter.dart';
import 'package:tedikap_admin/common/constant.dart';

import '../../../../common/themes.dart';

class ReviewPage extends GetView<ReviewController> {
  const ReviewPage({super.key});

  Future<void> _refreshData() async {
    await controller.getReview();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
        title: Text(
          'Customer Reviews',
          style: appBarText,
        ),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: _refreshData,
          triggerMode: RefreshIndicatorTriggerMode.anywhere,
          child: SingleChildScrollView(
            child: Column(
              children: [
                ReviewFilter(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Obx(() {
                    if (controller.isLoading.value) {
                      return Center(child: CircularProgressIndicator());
                    }
                    if (controller.reviewResponseModel.isEmpty) {
                      return Container(
                        height: height * 0.7,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                  height: 100,
                                  width: 200,
                                  child: SvgPicture.asset(reviewEmptyIcon)),
                              Text('No review available', style: normalText),
                            ],
                          ),
                        ),
                      );
                    }

                    return Column(
                      children: [
                        ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: controller.reviewResponseModel.length,
                          shrinkWrap: true,
                          itemBuilder: (BuildContext context, int index) {
                            final review =
                                controller.reviewResponseModel[index];
                            return ReviewCard(
                              id: review.id!,
                              user_id: review.userId!,
                              order_id: review.orderId!,
                              name: review.name!,
                              avatar: review.avatar!,
                              staff_service: review.staffService!,
                              product_quality: review.productQuality!,
                              note: review.note ?? 'Customers note',
                            );
                          },
                        ),
                      ],
                    );
                  }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
