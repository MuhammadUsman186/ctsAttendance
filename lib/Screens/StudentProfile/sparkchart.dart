import 'package:cts_app/utils/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class SparkChart extends StatefulWidget {
  const SparkChart({super.key});

  @override
  State<SparkChart> createState() => _SparkChartState();
}

class _SparkChartState extends State<SparkChart> {
  TooltipBehavior? _tooltipBehavior;
  CrosshairBehavior? _crosshairBehavior;
  @override
  void initState() {
    _crosshairBehavior = CrosshairBehavior(
        lineType: CrosshairLineType.vertical,
        lineColor: AppColors.primaryColor,
        lineDashArray: <double>[5, 5],
        enable: true,
        // Displays the crosshair on single tap
        activationMode: ActivationMode.singleTap);
    _tooltipBehavior = TooltipBehavior(
        enable: true,
        color: Colors.white,
        textStyle: const TextStyle(color: AppColors.primaryTextColor));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final LinearGradient _linearGradient = LinearGradient(
      colors: <Color>[
        AppColors.primaryColorShadetwo,
        AppColors.primaryColorShadeThree,
        AppColors.white
      ],
      stops: <double>[0.2, 0.7, 1.4],
      // Setting alignment for the series gradient
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    );
    final List<ChartData> chartData = [
      ChartData(2009, 25),
      ChartData(2010, 26),
      ChartData(2011, 27),
      ChartData(2012, 27),
      ChartData(2013, 28),
      ChartData(2014, 30),
      ChartData(2015, 38),
      ChartData(2016, 30),
      ChartData(2017, 31),
      ChartData(2018, 30),
      ChartData(2019, 29),
      ChartData(2020, 32),
      ChartData(2021, 45)
    ];

    return Container(
        child: SfCartesianChart(
            crosshairBehavior: _crosshairBehavior,
            plotAreaBorderWidth: 0,
            primaryXAxis: NumericAxis(
              isVisible: false,
            ),
            tooltipBehavior: _tooltipBehavior,
            primaryYAxis: NumericAxis(
                plotBands: <PlotBand>[
                  PlotBand(
                      borderColor: AppColors.primaryTextColor,
                      shouldRenderAboveSeries: true,
                      start: 10,
                      end: 10,
                      horizontalTextPadding: '3%',
                      //Specify the width for the line
                      // verticalTextAlignment: TextAnchor.start,
                      horizontalTextAlignment: TextAnchor.start,
                      borderWidth: 2,
                      text: 'Allowed Absence Percentage',
                      textStyle: TextStyle(
                        color: AppColors.primaryTextColor,
                      ),
                      //Specify the dash array for the line
                      dashArray: const <double>[4, 5])
                ],
                isVisible: false,
                labelFormat: '{value}',
                labelStyle: TextStyle(color: AppColors.primaryTextColor)),
            series: <ChartSeries>[
          // Renders area charte

          AreaSeries<ChartData, int>(
              enableTooltip: true,
              borderColor: AppColors.primaryColor,
              borderWidth: 2,
              color: AppColors.primaryColorShadetwo,
              dataSource: chartData,
              gradient: _linearGradient,
              xValueMapper: (ChartData data, _) => data.x,
              yValueMapper: (ChartData data, _) => data.y)
        ]));
  }
}

class ChartData {
  ChartData(this.x, this.y);
  final int x;
  final double y;
}
