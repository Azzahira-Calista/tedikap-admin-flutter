import 'package:fl_chart/fl_chart.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:tedikap_admin/app/api/statistic/statistic_service.dart';
import 'package:tedikap_admin/app/api/status%20store/status_store_Service.dart';
import 'package:tedikap_admin/app/data/model/statistic/analystic/month/month_model.dart';
import 'package:tedikap_admin/app/data/model/statistic/analystic/month/statistic_response_month.dart';
import 'package:tedikap_admin/app/data/model/statistic/analystic/statistic_model.dart';
import 'package:tedikap_admin/app/data/model/statistic/analystic/week/statistic_response_week.dart';
import 'package:tedikap_admin/app/data/model/statistic/analystic/week/week_model.dart';
import 'package:tedikap_admin/app/data/model/statistic/analystic/year/statistic_response_year.dart';
import 'package:tedikap_admin/app/data/model/statistic/analystic/year/year_model.dart';
import 'package:tedikap_admin/app/data/model/statistic/earnings/earnings_model.dart';
import 'package:tedikap_admin/app/data/model/statistic/earnings/earnings_response.dart';
import 'package:tedikap_admin/app/data/model/statistic/points/point_earning_response.dart';
import 'package:tedikap_admin/app/data/model/status%20store/status_store_response.dart';
import 'package:tedikap_admin/common/themes.dart';

class HomeController extends GetxController {
  var selectedRange = "This Week".obs;

  var isLoading = true.obs;
  var isSwitched = false.obs;
  RxBool isRefreshing = false.obs;

  StatisticService statisticService = StatisticService();
  StatusStoreService statusStoreService = StatusStoreService();
  StatusStoreResponse? statusStoreResponse;

  PointEarningResponse? pointEarningResponse;
  Rx<Points> pointEarningResponseModel = Points().obs;

  EarningsResponse? earningsResponse;
  Rx<EarningsData> earningsResponseModel = EarningsData().obs;

  StatisticResponseWeek? statisticResponseWeek;
  Rx<WeekData> dataWeekModel = WeekData().obs;

  StatisticResponseMonth? statisticResponseMonth;
  Rx<MonthData> dataMonthModel = MonthData().obs;

  StatisticResponseYear? statisticResponseYear;
  Rx<YearData> dataYearModel = YearData().obs;

  Rx<Detail> detailModel = Detail().obs;

  void refreshData() async {
    try {
      isRefreshing.value = true;
      print('Refreshing data...');
      await getEarningsData();
      await getStatusStore();
      await getAnalysticDataWeek();
      loadDataForSelectedRange();
    } finally {
      isRefreshing.value = false;
      print('Data refreshed!');
    }
  }

  @override
  void onInit() {
    // refreshData();
    super.onInit();
    getStatusStore();
    getEarningsData();
    getAnalysticDataWeek();
    loadDataForSelectedRange();
    getPointsEarning();
  }

  void changeRange(String range) {
    selectedRange.value = range;
    loadDataForSelectedRange();
  }

  void loadDataForSelectedRange() {
    switch (selectedRange.value) {
      case 'This Week':
        getAnalysticDataWeek();
        break;
      case 'This Month':
        getAnalysticDataMonth();
        break;
      case 'This Year':
        getAnalysticDataYear();
        break;
      default:
        getAnalysticDataWeek();
    }
  }

  Future<void> getPointsEarning() async {
    isLoading.value = true;
    try {
      final response = await statisticService.getPointEarninsData();
      pointEarningResponse = PointEarningResponse.fromJson(response.data);
      pointEarningResponseModel.value = pointEarningResponse?.data ?? Points();
      print('Points data loaded: ${pointEarningResponseModel.value}');
    } catch (e) {
      print('Error fetching points data: $e');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> getEarningsData() async {
    isLoading.value = true;
    try {
      final response = await statisticService.getEarningsData();
      earningsResponse = EarningsResponse.fromJson(response.data);
      earningsResponseModel.value = earningsResponse?.data ?? EarningsData();
      print('Earnings data loaded: ${earningsResponseModel.value}');
    } catch (e) {
      print('Error fetching earnings data: $e');
    } finally {
      isLoading.value = false;
    }
  }

  Future getAnalysticDataWeek() async {
    try {
      final response = await statisticService.getChartDataWeek();
      statisticResponseWeek = StatisticResponseWeek.fromJson(response.data);
      dataWeekModel.value = statisticResponseWeek!.data!;
      // print('bismillah: ${dataWeekModel.value.friday?.totalPcsSold}');
      update();
    } catch (e) {
      print('bismi : $e');
    }
  }

  Future<void> getAnalysticDataMonth() async {
    try {
      // Fetching the response
      final response = await statisticService.getChartDataMonth();
      print('API Response: ${response.data}');

      // Parsing the response
      statisticResponseMonth = StatisticResponseMonth.fromJson(response.data);

      // Checking if data is not null and contains entries
      if (statisticResponseMonth?.data != null &&
          statisticResponseMonth!.data!.isNotEmpty) {
        // Iterate over the data map and print each entry
        statisticResponseMonth!.data?.forEach((key, value) {
          print('Key: $key, Value: ${value.toJson()}'); // Debug print
        });

        // Assigning the first MonthData entry to dataMonthModel as an example
        dataMonthModel.value = statisticResponseMonth!.data!.values.first;
        print('Assigned Data Month Model: ${dataMonthModel.value}');
      } else {
        print('Data is null or empty.');
      }

      update(); // Update UI or other dependent logic
    } catch (e) {
      print('Error occurred: $e');
    }
  }

  Future getAnalysticDataYear() async {
    try {
      final response = await statisticService.getChartDataYear();
      print('API Response: ${response.data}');
      statisticResponseYear = StatisticResponseYear.fromJson(response.data);
      dataYearModel.value = statisticResponseYear!.data!;
      print('Data Year Model: ${dataYearModel.value}');
      print('January Total PCS Sold: ${statisticResponseYear?.product_sales}');
      print('January Total PCS Sold: ${statisticResponseYear?.income}');

      update();
    } catch (e) {
      print('Error occurred: $e');
    }
  }

  void toggeStoreStatus(bool value) async {
    isSwitched.value = value;
    await statusStore(value);
  }

  Future<void> statusStore(bool value) async {
    try {
      isLoading.value = true;
      final response = await statusStoreService.updateStatusStore(value);
      print("Response: $response");

      isLoading.value = false;
      Get.snackbar("Update store status", "Store status updated successfully!");
    } catch (e) {
      isLoading.value = false;
      print("Error: $e");
      Get.snackbar("Error", e.toString());
    }
  }

  Future<void> getStatusStore() async {
    try {
      isLoading.value = true;
      final response = await statusStoreService.getStatusStore();
      statusStoreResponse = StatusStoreResponse.fromJson(response.data);
      isSwitched.value = statusStoreResponse?.data?.statusStore ?? false;
      // isSwitched.value = response.data['status_store'] ?? false;

      print("Store status: ${statusStoreResponse?.data?.statusStore}");
    } catch (e) {
      print("Error: $e");
    } finally {
      isLoading.value = false;
    }
  }

  List<BarChartGroupData> get mingguanData => [
        makeGroupData(
            0, dataWeekModel.value.monday?.totalPcsSold?.toDouble() ?? 0.0),
        makeGroupData(
            1, dataWeekModel.value.tuesday?.totalPcsSold?.toDouble() ?? 0.0),
        makeGroupData(
            2, dataWeekModel.value.wednesday?.totalPcsSold?.toDouble() ?? 0.0),
        makeGroupData(
            3, dataWeekModel.value.thursday?.totalPcsSold?.toDouble() ?? 0.0),
        makeGroupData(
            4, dataWeekModel.value.friday?.totalPcsSold?.toDouble() ?? 0.0),
        makeGroupData(
            5, dataWeekModel.value.saturday?.totalPcsSold?.toDouble() ?? 0.0),
      ];

  List<BarChartGroupData> get bulananData {
    if (statisticResponseMonth == null ||
        statisticResponseMonth!.data == null) {
      return [];
    }
    return statisticResponseMonth!.data!.entries.map((entry) {
      int dayIndex = int.parse(entry.key) - 1;
      double totalPcsSold = entry.value.totalPcsSold?.toDouble() ?? 0.0;
      return makeGroupData(dayIndex, totalPcsSold);
    }).toList();
  }

  List<BarChartGroupData> get tahunanData => [
        makeGroupData(
            0, dataYearModel.value.january?.totalPcsSold?.toDouble() ?? 0.0),
        makeGroupData(
            1, dataYearModel.value.february?.totalPcsSold?.toDouble() ?? 0.0),
        makeGroupData(
            2, dataYearModel.value.march?.totalPcsSold?.toDouble() ?? 0.0),
        makeGroupData(
            3, dataYearModel.value.april?.totalPcsSold?.toDouble() ?? 0.0),
        makeGroupData(
            4, dataYearModel.value.may?.totalPcsSold?.toDouble() ?? 0.0),
        makeGroupData(
            5, dataYearModel.value.june?.totalPcsSold?.toDouble() ?? 0.0),
        makeGroupData(
            6, dataYearModel.value.july?.totalPcsSold?.toDouble() ?? 0.0),
        makeGroupData(
            7, dataYearModel.value.august?.totalPcsSold?.toDouble() ?? 0.0),
        makeGroupData(
            8, dataYearModel.value.september?.totalPcsSold?.toDouble() ?? 0.0),
        makeGroupData(
            9, dataYearModel.value.october?.totalPcsSold?.toDouble() ?? 0.0),
        makeGroupData(
            10, dataYearModel.value.november?.totalPcsSold?.toDouble() ?? 0.0),
        makeGroupData(
            11, dataYearModel.value.december?.totalPcsSold?.toDouble() ?? 0.0),
      ];

  static BarChartGroupData makeGroupData(int x, double y1) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(toY: y1, color: primaryColor),
      ],
    );
  }
}
