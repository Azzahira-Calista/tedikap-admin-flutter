import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:tedikap_admin/app/pages/feature_pages/review_page/review_controller.dart';
import 'package:tedikap_admin/app/pages/feature_pages/review_page/widgets/review_card.dart';
import 'package:tedikap_admin/app/pages/feature_pages/review_page/widgets/review_headline.dart';

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
    List<String> _tabs = ['All', '1 ⭐', '2 ⭐', '3 ⭐', '4 ⭐', '5 ⭐'];

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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: RefreshIndicator(
            onRefresh: _refreshData,
            triggerMode: RefreshIndicatorTriggerMode.anywhere,
            child: Obx(
              ()=> Column(
                children: [
                  Container(
                    height: 50,
                    child: ListView.builder(
                      itemCount: _tabs.length,
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: EdgeInsets.only(right: 10),
                          child: GestureDetector(
                            onTap: () {
                              controller.changeIndex(index);
                              _refreshData();
                            },
                            child: Obx(() => ChipTheme(
                                  data: ChipTheme.of(context).copyWith(
                                    side: controller.selectrdTab.value ==
                                            _tabs[index]
                                        ? BorderSide(color: primaryColor, width: 1)
                                        : BorderSide(color: offColor, width: 1),
                                  ),
                                  child: Chip(
                                    label: Text(
                                      _tabs[index],
                                      style: subTitle.copyWith(
                                        color: controller.selectrdTab.value ==
                                                _tabs[index]
                                            ? primaryColor
                                            : offColor,
                                      ),
                                    ),
                                    backgroundColor:
                                        controller.selectrdTab.value ==
                                                _tabs[index]
                                            ? white
                                            : white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(35),
                                    ),
                                  ),
                                )),
                          ),
                        );
                      },
                    ),
                  ),
                  Expanded(
                    child: RefreshIndicator(
                      onRefresh: _refreshData,
                      child: ListView.builder(
                        itemCount: controller.reviewResponseModel.length,
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index) {
                          final review = controller.reviewResponseModel[index];
                          return ReviewCard(
                            id: review.id!,
                            user_id: review.userId!,
                            order_id: review.orderId!,
                            name: review.name!,
                            avatar: review.avatar!,
                            staff_service: review.staffService!,
                            product_quality: review.productQuality!,
                            note: review.note ?? '',
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
