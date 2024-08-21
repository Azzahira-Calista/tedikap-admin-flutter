import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:tedikap_admin/common/themes.dart';

class RatingBarChart extends StatefulWidget {
  RatingBarChart({Key? key}) : super(key: key);

  @override
  _RatingBarChartState createState() => _RatingBarChartState();
}

class _RatingBarChartState extends State<RatingBarChart> {
  late List<_ChartData> data;
  late TooltipBehavior _tooltipBehavior;

  @override
  void initState() {
    super.initState();
    data = [
      _ChartData('1 Star', 2),
      _ChartData('2 Star', 6),
      _ChartData('3 Star', 5),
      _ChartData('4 Star', 1),
      _ChartData('5 Star', 12),
    ];
    _tooltipBehavior = TooltipBehavior(enable: true);
  }

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      borderColor: Colors.transparent,
      plotAreaBorderWidth: 0,
      plotAreaBackgroundColor: Colors.transparent,
      primaryXAxis: CategoryAxis(),
      primaryYAxis: NumericAxis(
        isVisible: false,
        majorGridLines: MajorGridLines(width: 0),
      ),
      tooltipBehavior: _tooltipBehavior,
      legend: Legend(isVisible: false),
      series: <CartesianSeries<_ChartData, String>>[
        BarSeries<_ChartData, String>(
            dataSource: data,
            xValueMapper: (_ChartData data, _) => data.x,
            yValueMapper: (_ChartData data, _) => data.y,
            name: 'rating',
            color: primaryColor,
            width: 0.3,
            spacing: 0.1,
            trackColor: lightGrey,
            isTrackVisible: true,
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(20),
                topRight: Radius.circular(20))),
      ],
    );
  }
}

class _ChartData {
  _ChartData(this.x, this.y);

  final String x;
  final double y;
}
