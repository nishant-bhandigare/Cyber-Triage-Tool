import 'package:cyber_triage_tool/widgets/entrypoint_breakdown.dart';
import 'package:cyber_triage_tool/widgets/mark_threat_bar.dart';
import 'package:cyber_triage_tool/widgets/network_asset_overview.dart';
import 'package:cyber_triage_tool/widgets/ongoing_trials.dart';
import 'package:cyber_triage_tool/widgets/threat_tabbar.dart';
import 'package:cyber_triage_tool/widgets/threats_details_table.dart';
import 'package:cyber_triage_tool/widgets/total_issues.dart';
import 'package:flutter/material.dart';
import 'package:cyber_triage_tool/models/threat_model.dart'; // Ensure this import is correct

class ThreatsScreen extends StatefulWidget {
  const ThreatsScreen({super.key});

  @override
  _ThreatsScreenState createState() => _ThreatsScreenState();
}

class _ThreatsScreenState extends State<ThreatsScreen> {
  DetectedThreat? selectedThreat; // Store the selected threat

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity, // Changed to double.infinity for consistency
      margin: const EdgeInsets.fromLTRB(20, 20, 0, 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            ThreatDetailsTable(
              onThreatSelected: (threat) {
                setState(() {
                  selectedThreat = threat; // Update the selected threat
                });
              },
            ),
            const SizedBox(height: 15),
            const MarkThreatBar(),
            const SizedBox(height: 15),
            ThreatTabBar(selectedThreat: selectedThreat), // Pass the selected threat
          ],
        ),
      ),
    );
  }
}
