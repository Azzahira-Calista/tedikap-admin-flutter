// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:fl_chart/fl_chart.dart';
// import 'package:tedikap_admin/app/pages/feature_pages/home_page/home_controller.dart';
// import 'package:tedikap_admin/app/pages/feature_pages/home_page/widgets/analytics/sales_controller.dart';
// import 'package:tedikap_admin/common/themes.dart';

// class SalesGrafic extends StatelessWidget {
//   final HomeController controller = Get.put(HomeController());
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text(
//               'Summary',
//               style: subTitle,
//             ),
//             Container(
//               padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
//               height: 30,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(10),
//                 border: Border.all(color: offColor),
//               ),
//               child: GetX<HomeController>(
//                 builder: (controller) {
//                   return DropdownButton<String>(
//                     icon: Icon(Icons.keyboard_arrow_down),
//                     iconSize: 15,
//                     style: smallText,
//                     onChanged: (String? value) {
//                       if (value != null) {
//                         controller.changeRange(value);
//                       }
//                     },
//                     hint: Text(
//                       controller.selectedRange.value,
//                       style: smallText,
//                     ),
//                     underline: Container(),
//                     items: [
//                       DropdownMenuItem<String>(
//                         value: 'This Week',
//                         child: Text('This Week'),
//                       ),
//                       DropdownMenuItem<String>(
//                         value: 'This Month',
//                         child: Text('This Month'),
//                       ),
//                       DropdownMenuItem<String>(
//                         value: 'This Year',
//                         child: Text('This Year'),
//                       ),
//                     ],
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//         SizedBox(
//           height: MediaQuery.of(context).size.height * 0.02,
//         ),
//        GetX<HomeController>(
//           builder: (controller) {
//             if (controller.isLoading.value) {
//               return CircularProgressIndicator();
//             }
//             return BarChart(
//               BarChartData(
//                 // barGroups: controller.getBarChartData(),
//               ),
//             );
//           },
//         ),
//       ],
//     );
//   }

    
// }
