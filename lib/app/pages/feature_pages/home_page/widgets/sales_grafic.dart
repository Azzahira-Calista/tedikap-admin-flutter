import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../../../common/themes.dart';

class SalesGrafic extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.sizeOf(context).height * 0.25,
        width: MediaQuery.sizeOf(context).width * 0.898,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: darkGrey)),
        child: SfCartesianChart(
          primaryXAxis: CategoryAxis(),
          title: ChartTitle(
            text: "Inventory Data - Today",
            textStyle: subTitle,
          ),
          tooltipBehavior: TooltipBehavior(enable: true),
          series: <ColumnSeries<salesData, double>>[
            ColumnSeries<salesData, double>(
              dataSource: <salesData>[
                salesData(0, 10),
                salesData(1, 20),
                salesData(2, 30),
                salesData(3, 40),
                salesData(4, 50),
                salesData(5, 60),
                salesData(6, 50),
                salesData(7, 70),
              ],
              xValueMapper: (salesData sales, _) => sales.x.toDouble(),
              yValueMapper: (salesData sales, _) => sales.y,
              name: "Inventory",
              color: primaryColor,
              // dataLabelSettings: DataLabelSettings(
              //     isVisible: true,
              //     labelAlignment:
              //         ChartDataLabelAlignment.top)
            ),
          ],
        ));
  }
}

class salesData {
  salesData(this.x, this.y);
  final int x;
  final double y;
}
