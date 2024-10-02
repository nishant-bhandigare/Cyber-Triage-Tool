import 'package:cyber_triage_tool/theme_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../data/threat_data.dart';

class ThreatsBySeverityWidget extends StatelessWidget {
  const ThreatsBySeverityWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final themeData = Provider.of<ThemeNotifier>(context).getTheme();
    final threatCounts = getThreatCountsBySeverity();


    return Container(
      width: 300,
      height: 250,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: themeData.brightness == Brightness.dark
            ? Colors.white12
            : Colors.teal.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Threats By Severity',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Severity Legends
                const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    LegendItem(color: Colors.green, text: 'Low'),
                    LegendItem(color: Colors.yellow, text: 'Medium'),
                    LegendItem(color: Colors.orange, text: 'High'),
                    LegendItem(color: Colors.red, text: 'Critical'),
                  ],
                ),
                // Donut Chart
                Expanded(
                  child: SfCircularChart(
                    annotations: <CircularChartAnnotation>[
                      CircularChartAnnotation(
                        widget: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              '${threatCounts.values.reduce((a, b) => a + b)}', // Total threats
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Text(
                              'Total',
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                    series: <CircularSeries>[
                      DoughnutSeries<ChartData, String>(
                        dataSource: getChartData(threatCounts),
                        xValueMapper: (ChartData data, _) => data.label,
                        yValueMapper: (ChartData data, _) => data.value,
                        pointColorMapper: (ChartData data, _) => data.color,
                        innerRadius: '70%',
                        radius: '90%',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Calculate the number of threats by severity
  Map<String, int> getThreatCountsBySeverity() {
    Map<String, int> counts = {
      'Low': 0,
      'Medium': 0,
      'High': 0,
      'Critical': 0,
    };

    for (var threat in threatList) {
      counts[threat.severity] = counts[threat.severity]! + 1;
    }

    return counts;
  }

  // Convert the threat counts into chart data
  List<ChartData> getChartData(Map<String, int> threatCounts) {
    return [
      ChartData('Low', threatCounts['Low']!.toDouble(), Colors.green),
      ChartData('Medium', threatCounts['Medium']!.toDouble(), Colors.yellow),
      ChartData('High', threatCounts['High']!.toDouble(), Colors.orange),
      ChartData('Critical', threatCounts['Critical']!.toDouble(), Colors.red),
    ];
  }
}

class ChartData {
  final String label;
  final double value;
  final Color color;

  ChartData(this.label, this.value, this.color);
}

class LegendItem extends StatelessWidget {
  final Color color;
  final String text;

  const LegendItem({super.key, required this.color, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Row(
        children: [
          Container(
            width: 12,
            height: 12,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 10),
          Text(
            text,
            style: const TextStyle(
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
