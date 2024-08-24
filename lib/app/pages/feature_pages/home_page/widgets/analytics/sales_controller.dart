// import 'package:fl_chart/fl_chart.dart';
// import 'package:get/get.dart';
// import 'package:tedikap_admin/app/api/statistic/statistic_service.dart';
// import 'package:tedikap_admin/app/data/model/statistic/analystic/month_model.dart';
// import 'package:tedikap_admin/app/data/model/statistic/analystic/statistic_model.dart';
// import 'package:tedikap_admin/app/data/model/statistic/analystic/statistic_response_week.dart';
// import 'package:tedikap_admin/app/data/model/statistic/analystic/week_model.dart';
// import 'package:tedikap_admin/app/data/model/statistic/analystic/year_model.dart';
// import 'package:tedikap_admin/common/themes.dart';

// class StatisticController extends GetxController {
//   var selectedRange = "This Week".obs;
//   RxBool isLoading = false.obs;

//   StatisticResponse? statisticResponse;
//   StatisticService statisticService = StatisticService();
//   Rx<WeekData> dataWeekModel = WeekData().obs;
//   Rx<Detail> detailModel = Detail().obs;

//   // var dataYearModel = DataYear().obs;
//   // var dataWeekModel = DataWeek().obs;
//   // var dataMonthModel = DataMonth().obs;

//   @override
//   void onInit() {
//     // TODO: implement onInit
//     super.onInit();
//     getAnalysticDataWeek();
//     loadDataForSelectedRange;
//   }

//   void changeRange(String range) {
//     selectedRange.value = range;
//     loadDataForSelectedRange();
//   }

//   void loadDataForSelectedRange() {
//     switch (selectedRange.value) {
//       case 'This Week':
//         getAnalysticDataWeek();
//         break;
//       // case 'This Month':
//       //   getAnalysticDataMonth();
//       //   break;
//       // case 'This Year':
//       //   getAnalysticDataYear();
//       //   break;
//       default:
//         getAnalysticDataWeek();
//     }
//   }

//   Future getAnalysticDataWeek() async {
//     try {
//       final response = await statisticService.getChartDataWeek();
//       statisticResponse = StatisticResponseWeek.fromJson(response.data);
//       dataWeekModel.value = statisticResponse!.data;
//       print('bismillah: ${dataWeekModel.value}');
//       update();
//     } catch (e) {
//       print(e);
//     }
//   }
//   // Future<void> getAnalysticDataWeek() async {
//   //   try {
//   //     isLoading(true);
//   //     final response = await statisticService.getChartData();

//   //     print("CHECK CURRENT RESPONSE");
//   //     print(statisticResponse.dataWeek);

//   //     if (response.statusCode == 200) {
//   //       statisticResponse = StatisticResponse.fromJson(response.data);
//   //       final List<dynamic> data = response.data['data'];
//   //       dataWeekModel.value =
//   //           data.map((json) => DataWeek.fromJson(json)).toList();
//   //       print('Statistic data loaded successfully');
//   //       print(dataWeekModel);
//   //     } else {
//   //       dataWeekModel.clear();
//   //       print('No products found for category: $dataWeekModel');
//   //     }
//   //   } catch (e) {
//   //     print('Error fetching data $e');
//   //   }
//   // }

//   // Future<void> getAnalysticDataMonth() async {
//   //   try {
//   //     isLoading(true);
//   //     final response = await statisticService.getChartData(query: 'data_month');

//   //     print("CHECK CURRENT RESPONSE");
//   //     print(statisticResponse.dataMonth);

//   //     if (response.statusCode == 200) {
//   //       statisticResponse = StatisticResponse.fromJson(response.data);
//   //       final List<dynamic> data = response.data['data'];
//   //       dataMonthModel.value =
//   //           data.map((json) => DataMonth.fromJson(json)).toList();
//   //       print('Statistic data loaded successfully');
//   //       print(dataMonthModel);
//   //     } else {
//   //       dataWeekModel.clear();
//   //       print('No products found for category: $dataMonthModel');
//   //     }
//   //   } catch (e) {
//   //     print('Error fetching data $e');
//   //   }
//   // }

//   // Future<void> getAnalysticDataYear() async {
//   //   try {
//   //     isLoading(true);
//   //     final response = await statisticService.getChartData(query: 'data_year');

//   //     print("CHECK CURRENT RESPONSE");
//   //     print(statisticResponse.dataYear);

//   //     if (response.statusCode == 200) {
//   //       statisticResponse = StatisticResponse.fromJson(response.data);
//   //       final List<dynamic> data = response.data['data'];
//   //       dataYearModel.value =
//   //           data.map((json) => DataYear.fromJson(json)).toList();
//   //       print('Statistic data loaded successfully');
//   //       print(dataYearModel);
//   //     } else {
//   //       dataWeekModel.clear();
//   //       print('No products found for category: $dataYearModel');
//   //     }
//   //   } catch (e) {
//   //     print('Error fetching data $e');
//   //   }
//   // }

//   //  List<SalesData> getSalesDataForRange() {
//   //   return getDataForRange(selectedRange.value, statisticResponse);
//   // }

//   // String _getQueryForSelectedRange(String range) {
//   //   switch (range) {
//   //     case "This Week":
//   //       return "this_week";
//   //     case "This Month":
//   //       return "this_month";
//   //     case "This Year":
//   //       return "this_year";
//   //     default:
//   //       return "week";
//   //   }
//   // }

//   // List<BarChartGroupData> getBarChartData() {
//   //   switch (selectedRange.value) {
//   //     case "This Week":
//   //       if (dataWeekModel.isEmpty) return [];
//   //       DataWeek dataWeek = dataWeekModel.first;
//   //       return [
//   //         if (dataWeek.monday != null)
//   //           BarChartGroupData(
//   //             x: 0, // Monday
//   //             barRods: [
//   //               BarChartRodData(
//   //                 toY: dataWeek.monday!.totalPcsSold?.toDouble() ?? 0.0,
//   //                 color: primaryColor,
//   //               )
//   //             ],
//   //           ),
//   //         if (dataWeek.tuesday != null)
//   //           BarChartGroupData(
//   //             x: 1, // Tuesday
//   //             barRods: [
//   //               BarChartRodData(
//   //                 toY: dataWeek.tuesday!.totalPcsSold?.toDouble() ?? 0.0,
//   //                 color: primaryColor,
//   //               )
//   //             ],
//   //           ),
//   //         if (dataWeek.wednesday != null)
//   //           BarChartGroupData(
//   //             x: 2, // Wednesday
//   //             barRods: [
//   //               BarChartRodData(
//   //                 toY: dataWeek.wednesday!.totalPcsSold?.toDouble() ?? 0.0,
//   //                 color: primaryColor,
//   //               )
//   //             ],
//   //           ),
//   //         if (dataWeek.thursday != null)
//   //           BarChartGroupData(
//   //             x: 3, // Thursday
//   //             barRods: [
//   //               BarChartRodData(
//   //                 toY: dataWeek.thursday!.totalPcsSold?.toDouble() ?? 0.0,
//   //                 color: primaryColor,
//   //               )
//   //             ],
//   //           ),
//   //         if (dataWeek.friday != null)
//   //           BarChartGroupData(
//   //             x: 4, // Friday
//   //             barRods: [
//   //               BarChartRodData(
//   //                 toY: dataWeek.friday!.totalPcsSold?.toDouble() ?? 0.0,
//   //                 color: primaryColor,
//   //               )
//   //             ],
//   //           ),
//   //         if (dataWeek.saturday != null)
//   //           BarChartGroupData(
//   //             x: 5, // Saturday
//   //             barRods: [
//   //               BarChartRodData(
//   //                 toY: dataWeek.saturday!.totalPcsSold?.toDouble() ?? 0.0,
//   //                 color: primaryColor,
//   //               )
//   //             ],
//   //           ),
//   //         if (dataWeek.sunday != null)
//   //           BarChartGroupData(
//   //             x: 6, // Sunday
//   //             barRods: [
//   //               BarChartRodData(
//   //                 toY: dataWeek.sunday!.totalPcsSold?.toDouble() ?? 0.0,
//   //                 color: primaryColor,
//   //               )
//   //             ],
//   //           ),
//   //       ];
//   //   }
//   //   return [];
//   // }
// }
