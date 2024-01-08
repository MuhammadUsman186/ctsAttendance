import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class RadialGauge extends StatelessWidget {
  const RadialGauge({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: SfRadialGauge(
        axes: <RadialAxis>[
          RadialAxis(
            canScaleToFit: true,
            useRangeColorForAxis: true,
            showTicks: false,
            showLabels: false,
            axisLineStyle: const AxisLineStyle(
                thickness: 12, cornerStyle: CornerStyle.bothCurve),
            pointers: const <GaugePointer>[
              RangePointer(
                width: 12,
                value: 70,
                color: Color(0xff7A9AEE),
                cornerStyle: CornerStyle.bothCurve,
              )
            ],
            annotations: <GaugeAnnotation>[
              GaugeAnnotation(
                widget: Text(
                    '\n\n\t\t\t\t\t70 % \n\n\t\t\t\t Total \nAttendance',
                    style: Theme.of(context).textTheme.headline4),
                axisValue: 120,
                positionFactor: 0.15,
              )
            ],
          ),
        ],
      )),
    );
  }
}
