import 'package:fl_chart/fl_chart.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:get/get_rx/get_rx.dart';
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
import 'package:tedikap_admin/app/data/model/status%20store/status_store_response.dart';
import 'package:tedikap_admin/app/pages/feature_pages/home_page/widgets/analytics/sales_controller.dart';
import 'package:tedikap_admin/common/themes.dart';

class HomeController extends GetxController {
  var selectedRange = "This Week".obs;

  var isLoading = true.obs;
  var isSwitched = false.obs;

  StatisticService statisticService = StatisticService();
  StatusStoreService statusStoreService = StatusStoreService();
  StatusStoreResponse? statusStoreResponse;

  EarningsResponse? earningsResponse;
  Rx<EarningsData> earningsResponseModel = EarningsData().obs;

  StatisticResponseWeek? statisticResponseWeek;
  Rx<WeekData> dataWeekModel = WeekData().obs;

  StatisticResponseMonth? statisticResponseMonth;
  Rx<MonthData> dataMonthModel = MonthData().obs;

  StatisticResponseYear? statisticResponseYear;
  Rx<YearData> dataYearModel = YearData().obs;

  Rx<Detail> detailModel = Detail().obs;

  @override
  void onInit() {
    super.onInit();
    isSwitched.value = statusStoreResponse?.data?.StatusStoreResponse ?? false;
    getEarningsData();
    getAnalysticDataWeek();
    loadDataForSelectedRange();
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
      dataWeekModel.value = statisticResponseWeek!.data;
      print('bismillah: ${dataWeekModel.value.friday?.totalPcsSold}');
      update();
    } catch (e) {
      print('bismi : $e');
    }
  }

  Future getAnalysticDataMonth() async {
    try {
      final response = await statisticService.getChartDataMonth();
      statisticResponseMonth = StatisticResponseMonth.fromJson(response.data);
      dataMonthModel.value = statisticResponseMonth!.data;
      print('bismillah: ${dataMonthModel.value.Thursday?.totalPcsSold}');
      update();
    } catch (e) {
      print('bismi : $e');
    }
  }

  Future getAnalysticDataYear() async {
    try {
      final response = await statisticService.getChartDataYear();
      statisticResponseYear = StatisticResponseYear.fromJson(response.data);
      dataYearModel.value = statisticResponseYear!.data;
      print('bismillah: ${dataYearModel.value.january?.totalPcsSold}');
      update();
    } catch (e) {
      print('bismi : $e');
    }
  }

  int sumSales() {
    var sumSalesWeek = 0;
    sumSalesWeek = (dataWeekModel.value.monday?.totalPcsSold ?? 0) +
        (dataWeekModel.value.tuesday?.totalPcsSold ?? 0) +
        (dataWeekModel.value.wednesday?.totalPcsSold ?? 0) +
        (dataWeekModel.value.thursday?.totalPcsSold ?? 0) +
        (dataWeekModel.value.friday?.totalPcsSold ?? 0) +
        (dataWeekModel.value.saturday?.totalPcsSold ?? 0) +
        (dataWeekModel.value.sunday?.totalPcsSold ?? 0);
    print('sumSalesWeek pcs sold: $sumSalesWeek');

    return sumSalesWeek;
  }

  int sumSalesMonth() {
    var sumSalesMonth = 0;
    sumSalesMonth = (dataMonthModel.value.Thursday?.totalPcsSold ?? 0);
    // (dataMonthModel.value.minggu2?.totalPcsSold ?? 0) +
    // (dataMonthModel.value.minggu3?.totalPcsSold ?? 0) +
    // (dataMonthModel.value.minggu4?.totalPcsSold ?? 0) +
    // (dataMonthModel.value.minggu5?.totalPcsSold ?? 0);
    print('sumSalesMonth pcs sold: $sumSalesMonth');
    return sumSalesMonth;
  }

  int sumSalesYear() {
    var sumSalesYear = 0;
    sumSalesYear = (dataYearModel.value.january?.totalPcsSold ?? 0) +
        (dataYearModel.value.february?.totalPcsSold ?? 0) +
        (dataYearModel.value.march?.totalPcsSold ?? 0) +
        (dataYearModel.value.april?.totalPcsSold ?? 0) +
        (dataYearModel.value.may?.totalPcsSold ?? 0) +
        (dataYearModel.value.june?.totalPcsSold ?? 0) +
        (dataYearModel.value.july?.totalPcsSold ?? 0) +
        (dataYearModel.value.august?.totalPcsSold ?? 0) +
        (dataYearModel.value.september?.totalPcsSold ?? 0) +
        (dataYearModel.value.october?.totalPcsSold ?? 0) +
        (dataYearModel.value.november?.totalPcsSold ?? 0) +
        (dataYearModel.value.december?.totalPcsSold ?? 0);
    print('sumSalesYear pcs sold: $sumSalesYear');

    return sumSalesYear;
  }

  int sumIncome() {
    var sumIncomeWeek = 0;
    sumIncomeWeek = (dataWeekModel.value.monday?.totalIncome ?? 0) +
        (dataWeekModel.value.tuesday?.totalIncome ?? 0) +
        (dataWeekModel.value.wednesday?.totalIncome ?? 0) +
        (dataWeekModel.value.thursday?.totalIncome ?? 0) +
        (dataWeekModel.value.friday?.totalIncome ?? 0) +
        (dataWeekModel.value.saturday?.totalIncome ?? 0) +
        (dataWeekModel.value.sunday?.totalIncome ?? 0);
    print('sumIncomeWeek income: $sumIncomeWeek');
    return sumIncomeWeek;
  }

  int sumIncomeMonth() {
    var sumIncomeMonth = 0;
    sumIncomeMonth = (dataMonthModel.value.Thursday?.totalIncome ?? 0);
    // (dataMonthModel.value.minggu2?.totalIncome ?? 0) +
    // (dataMonthModel.value.minggu3?.totalIncome ?? 0) +
    // (dataMonthModel.value.minggu4?.totalIncome ?? 0) +
    // (dataMonthModel.value.minggu5?.totalIncome ?? 0);
    print('sumIncomeMonth income: $sumIncomeMonth');
    return sumIncomeMonth;
  }

  int sumIncomeYear() {
    var sumIncomeYear = 0;
    sumIncomeYear = (dataYearModel.value.january?.totalIncome ?? 0) +
        (dataYearModel.value.february?.totalIncome ?? 0) +
        (dataYearModel.value.march?.totalIncome ?? 0) +
        (dataYearModel.value.april?.totalIncome ?? 0) +
        (dataYearModel.value.may?.totalIncome ?? 0) +
        (dataYearModel.value.june?.totalIncome ?? 0) +
        (dataYearModel.value.july?.totalIncome ?? 0) +
        (dataYearModel.value.august?.totalIncome ?? 0) +
        (dataYearModel.value.september?.totalIncome ?? 0) +
        (dataYearModel.value.october?.totalIncome ?? 0) +
        (dataYearModel.value.november?.totalIncome ?? 0) +
        (dataYearModel.value.december?.totalIncome ?? 0);
    print('sumIncomeYear income: $sumIncomeYear');
    return sumIncomeYear;
  }

  String formatRupiah(num amount) {
    final formatCurrency =
        NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ', decimalDigits: 0);
    return formatCurrency.format(amount);
  }

  void toggeStoreStatus(bool value) async {
    isSwitched.value = value;
    if (value) {
      await statusStore(true);
    } else {
      await statusStore(false);
    }
  }

  Future<void> statusStore(bool value) async{
    try {
      isLoading.value = true;
      final response = statusStoreService.updateStatusStore(value);
      print("Response: $response");

      isLoading.value = false;
      Get.snackbar("Update store status", "Store status updated successfully!");
    } catch (e) {
      isLoading.value = false;
      print("Error: $e");
      Get.snackbar("Error", e.toString());
    }
  }

  // Future<void> openStore() async {
  //   print("Opening store...");
  //   bool result = await statusStoreService.updateStatusStore(true);
  //   if (result) {
  //     print("Store is open");
  //   } else {
  //     print("Failed to open store");
  //   }
  // }

  // Future<void> closeStore() async {
  //   print("Closing store...");
  //   bool result = await statusStoreService.updateStatusStore(false);
  //   if (result) {
  //     print("Store is closed");
  //   } else {
  //     print("Failed to close store");
  //   }
  // }

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
        makeGroupData(
            6, dataWeekModel.value.sunday?.totalPcsSold?.toDouble() ?? 0.0),
      ];

  List<BarChartGroupData> get bulananData => [
        makeGroupData(
            0, dataMonthModel.value.Thursday?.totalPcsSold?.toDouble() ?? 0.0),
        // makeGroupData(
        //     1, dataMonthModel.value.minggu2?.totalPcsSold?.toDouble() ?? 0.0),
        // makeGroupData(
        //     2, dataMonthModel.value.minggu3?.totalPcsSold?.toDouble() ?? 0.0),
        // makeGroupData(
        //     3, dataMonthModel.value.minggu4?.totalPcsSold?.toDouble() ?? 0.0),
        // makeGroupData(
        //     4, dataMonthModel.value.minggu5?.totalPcsSold?.toDouble() ?? 0.0),
      ];

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
