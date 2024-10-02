import 'package:cyber_triage_tool/theme_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class RiskScoreWidget extends StatelessWidget {
  const RiskScoreWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final themeData = Provider.of<ThemeNotifier>(context).getTheme();
    return Container(
      width: 200,
      height: 250,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: themeData.brightness == Brightness.dark
            ? Colors.white12
            : Colors.teal.withOpacity(0.1),
      ),
      child: Column(
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Current Risk", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
              Icon(Icons.arrow_forward_rounded),
            ],
          ),
          Expanded(
            child: SfRadialGauge(
              enableLoadingAnimation: true,
              axes: <RadialAxis>[
                RadialAxis(
                  minimum: 0,
                  maximum: 1000,
                  showLabels: false,
                  showTicks: false,
                  startAngle: 140,
                  endAngle: 40,
                  radiusFactor: 0.8,
                  axisLineStyle: AxisLineStyle(
                    thickness: 0.2,
                    cornerStyle: CornerStyle.bothCurve,
                    color: Colors.grey.shade800,
                    thicknessUnit: GaugeSizeUnit.factor,
                  ),
                  pointers: const <GaugePointer>[
                    RangePointer(
                      value: 741,
                      cornerStyle: CornerStyle.bothCurve,
                      width: 0.2,
                      sizeUnit: GaugeSizeUnit.factor,
                      gradient: SweepGradient(
                        colors: <Color>[Colors.red, Colors.orange],
                        stops: <double>[0.25, 0.75],
                      ),
                    ),
                    MarkerPointer(
                      value: 741,
                      enableDragging: false,
                      markerHeight: 20,
                      markerWidth: 20,
                      markerType: MarkerType.circle,
                      color: Colors.white,
                    ),
                  ],
                  annotations: const <GaugeAnnotation>[
                    GaugeAnnotation(
                      widget: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text(
                            '741',
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'High',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.orange,
                            ),
                          ),
                        ],
                      ),
                      angle: 90,
                      positionFactor: 0.2,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
