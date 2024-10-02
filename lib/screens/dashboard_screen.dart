import 'package:cyber_triage_tool/widgets/InfoBar.dart';
import 'package:cyber_triage_tool/widgets/risk_score.dart';
import 'package:cyber_triage_tool/widgets/threat_chart.dart';
import 'package:cyber_triage_tool/widgets/threats_list.dart';
import 'package:flutter/material.dart';


class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.maxFinite,
      margin: const EdgeInsets.fromLTRB(20, 20, 0, 20),
      decoration: BoxDecoration(
        // border: Border.all(),
        borderRadius: BorderRadius.circular(20),
      ),
      // padding: const EdgeInsets.all(20),
      child: const SingleChildScrollView(
        child: Column(
          children: [
            InfoBar(),
            SizedBox(height: 15),
            Row(
              children: [
                RiskScoreWidget(),
                SizedBox(width: 15),
                Expanded(child: ThreatsBySeverityWidget()),
              ],
            ),
            SizedBox(height: 15),
            ThreatSummaryChart(),
          ],
        ),
      ),
    );
  }
}
