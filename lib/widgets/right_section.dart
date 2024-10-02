import 'package:cyber_triage_tool/widgets/chatbot_button.dart';
import 'package:cyber_triage_tool/widgets/router_component.dart';
import 'package:cyber_triage_tool/widgets/system_information.dart';
import 'package:cyber_triage_tool/widgets/system_status.dart';
import 'package:flutter/material.dart';

class RightSection extends StatelessWidget{
  const RightSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.maxFinite,
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        // border: Border.all(),
        borderRadius: BorderRadius.circular(20),
      ),
      // padding: const EdgeInsets.all(15),
      child: ListView(
        children: const [
          // SystemInformation(),
          // SizedBox(height: 15),
          SystemStatus(),
          SizedBox(height: 15),
          RouterComponent(text: "IOC Identification", url: "http://localhost:8502/"),
          SizedBox(height: 15),
          RouterComponent(text: "Anomaly Detection", url: "http://localhost:8503/"),
          SizedBox(height: 15),
          RouterComponent(text: "Scoring & Recommendation", url: "http://localhost:8503/"),
          SizedBox(height: 15),
          RouterComponent(text: "Digital Forensics Evidence Manager", url: "http://localhost:8504/"),
          SizedBox(height: 15),
          RouterComponent(text: "Forensic Data Analyzer", url: "http://localhost:8505/"),
          Spacer(),
          ChatBotButton(),
        ],
      ),
    );
  }

}