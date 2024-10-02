import 'package:cyber_triage_tool/theme_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class EntryPointBreakdown extends StatelessWidget {
  const EntryPointBreakdown({super.key});

  @override
  Widget build(BuildContext context) {
    final themeData = Provider.of<ThemeNotifier>(context).getTheme();
    return Container(
      height: 550,
      padding: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: themeData.brightness == Brightness.dark
            ? Colors.white12
            : Colors.purple.withOpacity(0.1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Title for the section
          const Text(
            "entry point breakdown",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),

          // Horizontal Bar Chart for domains, subdomains, etc.
          _buildHorizontalBarChart(),

          // Column Chart for breakdown by day
          _buildColumnChart(),
        ],
      ),
    );
  }

  // Horizontal bar chart section for domains, subdomains, etc.
  Widget _buildHorizontalBarChart() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildBarChart("domains:", [0, 124], Colors.purple),
        _buildBarChart("subdomains:", [83, 157], Colors.orange),
        _buildBarChart("IP addresses:", [40, 0], Colors.teal),
        _buildBarChart("Containers:", [152, 238], Colors.green),
      ],
    );
  }

  // Helper function to generate each row of the horizontal bar chart
  Widget _buildBarChart(String label, List<int> values, Color color) {
    return Row(
      children: [
        SizedBox(
          width: 150,
          child: Text(
            label,
            style: const TextStyle(fontSize: 16),
          ),
        ),
        Expanded(
          child: SizedBox(
            height: 40,
            child: SfCartesianChart(
              primaryXAxis: const CategoryAxis(
                isVisible: true,
              ),
              primaryYAxis: const NumericAxis(
                isVisible: false,
                maximum: 250,
              ),
              series: <CartesianSeries>[
                BarSeries<int, String>(
                  dataSource: values,
                  xValueMapper: (int value, _) => '',
                  yValueMapper: (int value, _) => value,
                  pointColorMapper: (int value, int index) =>
                  index == 0 ? color.withOpacity(0.6) : color,
                  width: 0.3,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  // Column chart section for daily breakdown
  Widget _buildColumnChart() {
    final List<_ChartData> data = [
      _ChartData('mon', [60, 100]),
      _ChartData('tue', [83, 0]),
      _ChartData('wed', [0, 180]),
      _ChartData('thur', [60, 40]),
      _ChartData('fri', [80, 0]),
      _ChartData('sat', [60, 50]),
      _ChartData('sun', [83, 20]),
    ];

    return SizedBox(
      height: 250,
      child: SfCartesianChart(
        primaryXAxis: const CategoryAxis(),
        primaryYAxis: const NumericAxis(maximum: 200),
        series: <CartesianSeries>[
          ColumnSeries<_ChartData, String>(
            dataSource: data,
            xValueMapper: (_ChartData data, _) => data.day,
            yValueMapper: (_ChartData data, _) => data.values[0],
            color: Colors.teal,
            width: 0.3,
          ),
          ColumnSeries<_ChartData, String>(
            dataSource: data,
            xValueMapper: (_ChartData data, _) => data.day,
            yValueMapper: (_ChartData data, _) => data.values[1],
            color: Colors.purple,
            width: 0.3,
          ),
        ],
      ),
    );
  }
}

class _ChartData {
  final String day;
  final List<int> values;

  _ChartData(this.day, this.values);
}
