import 'package:cyber_triage_tool/theme_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SystemStatus extends StatelessWidget{
  const SystemStatus({super.key});

  @override
  Widget build(BuildContext context) {
    final themeData = Provider.of<ThemeNotifier>(context).getTheme();
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: themeData.brightness == Brightness.dark
            ? Colors.white12
            : Colors.teal.withOpacity(0.2),
        borderRadius: BorderRadius.circular(20),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("System Status", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
          SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Targeted Analysis"),
              Text("Complete"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Full Scan"),
              Text("Complete"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Malware Scanning"),
              Text("Complete"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Report"),
              Text("Generate"),
            ],
          ),
        ],
      ),
    );
  }

}