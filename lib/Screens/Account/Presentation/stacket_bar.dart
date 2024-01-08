import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ColumnBar extends StatelessWidget {
  ColumnBar({super.key});
  final Color color1 = _colorFromHex('#7A9AEE');
  final Color color2 = _colorFromHex('#C9D7F8');
  final List<ChartData> chartData = [
    ChartData('7A', 100, 90, Color(0xff7A9AEE)),
    ChartData('7B', 100, 100, Color(0xff7A9AEE)),
    ChartData('7C', 100, 100, Color(0xff7A9AEE)),
    ChartData('8A', 100, 70, Color(0xffD396AB)),
    ChartData('8B', 100, 80, Color(0xff7A9AEE)),
    ChartData('9B', 100, 90, Color(0xff7A9AEE)),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Container(
                child: SfCartesianChart(
                    enableMultiSelection: true,
                    plotAreaBorderWidth: 0,
                    primaryXAxis: CategoryAxis(
                        majorGridLines: MajorGridLines(width: 0),
                        axisLine: AxisLine(width: 0),
                        majorTickLines: MajorTickLines(width: 0),
                        labelStyle: Theme.of(context).textTheme.headline5),
                    primaryYAxis:
                        NumericAxis(isVisible: false, labelFormat: '{value}%'),
                    enableSideBySideSeriesPlacement: false,
                    series: <ChartSeries>[
          ColumnSeries<ChartData, String>(
            borderRadius: BorderRadius.circular(5),
            color: color2,
            dataSource: chartData,
            xValueMapper: (ChartData data, _) => data.x,
            yValueMapper: (ChartData data, _) => data.y,
            width: 0.9, // Width of the columns
            // Spacing between the columns
          ),
          ColumnSeries<ChartData, String>(
            dataLabelSettings: const DataLabelSettings(
                textStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 8,
                    fontWeight: FontWeight.bold),
                isVisible: true,
                labelAlignment: ChartDataLabelAlignment.top),

            pointColorMapper: (ChartData data, _) => data.color,
            borderRadius: BorderRadius.circular(5),
            dataSource: chartData,
            xValueMapper: (ChartData data, _) => data.x,
            yValueMapper: (ChartData data, _) => data.y2,
            width: 0.8,
            // Width of the columns
            // Spacing between the columns
          )
        ]))));
  }
}

class ChartData {
  final String x;
  final num y;
  final num y2;
  final Color? color;

  ChartData(this.x, this.y, this.y2, this.color);
}

_colorFromHex(String hexColor) {
  final hexCode = hexColor.replaceAll('#', '');
  return Color(int.parse('FF$hexCode', radix: 16));
}
