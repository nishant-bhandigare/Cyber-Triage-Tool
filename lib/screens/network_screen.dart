import 'package:cyber_triage_tool/widgets/entrypoint_breakdown.dart';
import 'package:cyber_triage_tool/widgets/network_asset_overview.dart';
import 'package:cyber_triage_tool/widgets/ongoing_trials.dart';
import 'package:cyber_triage_tool/widgets/total_issues.dart';
import 'package:flutter/material.dart';

class NetworkScreen extends StatelessWidget{
  const NetworkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.maxFinite,
      margin: const EdgeInsets.fromLTRB(20, 20, 0, 20),
      // padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        // border: Border.all(),
        borderRadius: BorderRadius.circular(20),
      ),
      child: const SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(child: EntryPointBreakdown()),
                SizedBox(width: 20),
                Expanded(child: AssetOverview()),
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(child: OngoingTrials()),
                SizedBox(width: 20),
                Expanded(child: IssuesBreakdown()),
              ],
            ),
          ],
        ),
      ),
    );
  }

}