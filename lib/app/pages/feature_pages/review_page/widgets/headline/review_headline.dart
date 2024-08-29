import 'package:flutter/widgets.dart';
import 'package:tedikap_admin/app/pages/feature_pages/review_page/widgets/headline/bar_chart_review.dart';
import 'package:tedikap_admin/common/themes.dart';

class HeadlineReview extends StatelessWidget {
  const HeadlineReview({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Container(
      // height: height * 0.3,
      width: width,
      // color: lightGrey,
      child: Column(
        children: [
          Container(
            // color: darkGrey,
            padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 20),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Overall Rating',
                  style: cardText.copyWith(color: primaryTextColor),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      color: cream, borderRadius: BorderRadius.circular(100)),
                  child: Text(
                    '⭐⭐⭐⭐' + ' 4 out of 5',
                    style: normalTextPrimary,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Based on ' + '26' + ' reviews',
                  style: hint,
                ),
              ],
            ),
          ),
          Container(
            height: height * 0.4,
            child: RatingBarChart(),
          ),
        ],
      ),
    );
  }
}
