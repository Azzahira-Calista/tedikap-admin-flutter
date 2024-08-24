// import 'package:tedikap_admin/app/data/model/statistic/analystic/statistic_response.dart';

// class SalesData {
//   SalesData(this.x, this.y);
//   final dynamic x;
//   final double y;
// }

// List<SalesData> getDataForRange(String range, StatisticResponse statisticResponse) {
//   switch (range) {
//     case 'This Year':
//       final dataYear = statisticResponse.dataYear;
//       if (dataYear == null) return [];
//       return [
//         SalesData('Jan', dataYear.january?.totalPcsSold?.toDouble() ?? 0),
//         SalesData('Feb', dataYear.february?.totalPcsSold?.toDouble() ?? 0),
//         SalesData('Mar', dataYear.march?.totalPcsSold?.toDouble() ?? 0),
//         SalesData('Apr', dataYear.april?.totalPcsSold?.toDouble() ?? 0),
//         SalesData('May', dataYear.may?.totalPcsSold?.toDouble() ?? 0),
//         SalesData('Jun', dataYear.june?.totalPcsSold?.toDouble() ?? 0),
//         SalesData('Jul', dataYear.july?.totalPcsSold?.toDouble() ?? 0),
//         SalesData('Aug', dataYear.august?.totalPcsSold?.toDouble() ?? 0),
//         SalesData('Sep', dataYear.september?.totalPcsSold?.toDouble() ?? 0),
//         SalesData('Oct', dataYear.october?.totalPcsSold?.toDouble() ?? 0),
//         SalesData('Nov', dataYear.november?.totalPcsSold?.toDouble() ?? 0),
//         SalesData('Dec', dataYear.december?.totalPcsSold?.toDouble() ?? 0),
//       ];
//     case 'This Month':
//       final dataMonth = statisticResponse.dataMonth;
//       if (dataMonth == null) return [];
//       return [
//         SalesData('Week 1', dataMonth.minggu1?.totalPcsSold?.toDouble() ?? 0),
//         SalesData('Week 2', dataMonth.minggu2?.totalPcsSold?.toDouble() ?? 0),
//         SalesData('Week 3', dataMonth.minggu3?.totalPcsSold?.toDouble() ?? 0),
//         SalesData('Week 4', dataMonth.minggu4?.totalPcsSold?.toDouble() ?? 0),
//         SalesData('Week 5', dataMonth.minggu5?.totalPcsSold?.toDouble() ?? 0),
//       ];
//     case 'This Week':
//     default:
//       final dataWeek = statisticResponse.dataWeek;
//       if (dataWeek == null) return [];
//       return [
//         SalesData('Mon', dataWeek.monday?.totalPcsSold?.toDouble() ?? 0),
//         SalesData('Tue', dataWeek.tuesday?.totalPcsSold?.toDouble() ?? 0),
//         SalesData('Wed', dataWeek.wednesday?.totalPcsSold?.toDouble() ?? 0),
//         SalesData('Thu', dataWeek.thursday?.totalPcsSold?.toDouble() ?? 0),
//         SalesData('Fri', dataWeek.friday?.totalPcsSold?.toDouble() ?? 0),
//         SalesData('Sat', dataWeek.saturday?.totalPcsSold?.toDouble() ?? 0),
//         SalesData('Sun', dataWeek.sunday?.totalPcsSold?.toDouble() ?? 0),
//       ];
//   }
// }

