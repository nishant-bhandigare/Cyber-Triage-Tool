import 'package:cyber_triage_tool/widgets/mini_alert.dart';
import 'package:flutter/material.dart';


class AlertsScreen extends StatelessWidget {
  const AlertsScreen({super.key});

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
            ThreatList(),
          ],
        ),
      ),
    );
  }
}
