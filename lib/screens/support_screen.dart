import 'package:cyber_triage_tool/widgets/InfoBar.dart';
import 'package:cyber_triage_tool/widgets/risk_score.dart';
import 'package:cyber_triage_tool/widgets/support_grid.dart';
import 'package:cyber_triage_tool/widgets/threat_chart.dart';
import 'package:cyber_triage_tool/widgets/threats_list.dart';
import 'package:flutter/material.dart';


class SupportScreen extends StatelessWidget {
  const SupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.maxFinite,
      margin: const EdgeInsets.fromLTRB(20, 20, 0, 20),
      padding: const EdgeInsets.all(20),
      child: const SingleChildScrollView(
        child: Column(
          children: [
            SupportGrid(),
          ],
        ),
      ),
    );
  }
}
