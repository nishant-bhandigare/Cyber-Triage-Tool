import 'package:cyber_triage_tool/data/threat_data.dart';
import 'package:cyber_triage_tool/theme_notifier.dart';
import 'package:cyber_triage_tool/widgets/dropdown_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';

class ThreatSummaryChart extends StatefulWidget {
  const ThreatSummaryChart({super.key});

  @override
  State<ThreatSummaryChart> createState() => _ThreatSummaryChartState();
}

class _ThreatSummaryChartState extends State<ThreatSummaryChart> {
  String selectedTimeFrame = 'Yearly'; // Default to Yearly
  late List<ThreatData> threatData;

  @override
  void initState() {
    super.initState();
    threatData = getThreatData('Yearly'); // Load initial data
  }

  void updateChart(String timeFrame) {
    setState(() {
      selectedTimeFrame = timeFrame;
      threatData = getThreatData(timeFrame);
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeData = Provider.of<ThemeNotifier>(context).getTheme();
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: themeData.brightness == Brightness.dark
            ? Colors.white12
            : Colors.teal.withOpacity(0.1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Threat Summary',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              DropDownButton(
                onChanged: updateChart, // Update chart when time frame changes
              ),
            ],
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 300,
            child: SfCartesianChart(
              plotAreaBorderWidth: 0,
              primaryXAxis: CategoryAxis(
                title: AxisTitle(text: selectedTimeFrame),
                majorGridLines: const MajorGridLines(width: 0),
                labelStyle: TextStyle(color: Colors.grey[600]),
              ),
              primaryYAxis: NumericAxis(
                minimum: 0,
                interval: 5,
                majorGridLines: MajorGridLines(width: 0.5, color: Colors.grey[300]),
                labelStyle: TextStyle(color: Colors.grey[600]),
                axisLine: const AxisLine(width: 0),
              ),
              series: <CartesianSeries>[
                SplineSeries<ThreatData, String>(
                  dataSource: threatData,
                  xValueMapper: (ThreatData data, _) => data.time,
                  yValueMapper: (ThreatData data, _) => data.threatCount,
                  color: Colors.purple,
                  markerSettings: const MarkerSettings(isVisible: true),
                ),
              ],
              tooltipBehavior: TooltipBehavior(enable: true),
            ),
          ),
        ],
      ),
    );
  }

  // Method to return data based on the selected time frame
  List<ThreatData> getThreatData(String timeFrame) {

    // Group threats by time frame
    Map<String, int> groupedData = {};
    if (timeFrame == 'Yearly') {
      for (var threat in threatList) {
        String year = DateFormat('yyyy').format(threat.detectedAt);
        groupedData[year] = (groupedData[year] ?? 0) + 1;
      }
    } else if (timeFrame == 'Monthly') {
      for (var threat in threatList) {
        String month = DateFormat('MMM').format(threat.detectedAt);
        groupedData[month] = (groupedData[month] ?? 0) + 1;
      }
    } else if (timeFrame == 'Weekly') {
      for (var threat in threatList) {
        String week = DateFormat('EEE').format(threat.detectedAt); // Day of the week
        groupedData[week] = (groupedData[week] ?? 0) + 1;
      }
    } else if (timeFrame == 'Daily') {
      for (var threat in threatList) {
        String day = DateFormat('d MMM').format(threat.detectedAt); // Date (day and month)
        groupedData[day] = (groupedData[day] ?? 0) + 1;
      }
    }

    // Convert to a list of ThreatData objects
    return groupedData.entries
        .map((entry) => ThreatData(entry.key, entry.value.toDouble()))
        .toList();
  }
}

class ThreatData {
  final String time;
  final double threatCount;

  ThreatData(this.time, this.threatCount);
}
//
// class Dropdown extends StatefulWidget {
//   final Function(String) onChanged;
//
//   const Dropdown({super.key, required this.onChanged});
//
//   @override
//   State<Dropdown> createState() => _DropdownState();
// }
//
// class _DropdownState extends State<Dropdown> {
//   String dropdownValue = 'Yearly';
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         border: Border.all(color: Colors.black12),
//         borderRadius: BorderRadius.circular(20),
//       ),
//       child: DropdownButton<String>(
//         value: dropdownValue,
//         icon: const Icon(Icons.arrow_drop_down),
//         elevation: 16,
//         padding: const EdgeInsets.symmetric(horizontal: 12),
//         borderRadius: BorderRadius.circular(20),
//         underline: Container(
//           height: 0,
//         ),
//         onChanged: (String? newValue) {
//           setState(() {
//             dropdownValue = newValue!;
//           });
//           widget.onChanged(dropdownValue); // Call the passed-in callback
//         },
//         items: <String>['Yearly', 'Monthly', 'Weekly', 'Daily'].map<DropdownMenuItem<String>>((String value) {
//           return DropdownMenuItem<String>(
//             value: value,
//             child: Text(value),
//           );
//         }).toList(),
//       ),
//     );
//   }
// }
