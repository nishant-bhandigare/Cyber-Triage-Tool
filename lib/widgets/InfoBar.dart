import 'package:cyber_triage_tool/theme_notifier.dart';
import 'package:cyber_triage_tool/widgets/dropdown_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import 'InfoCard.dart';

class InfoBar extends StatelessWidget{
  const InfoBar({super.key});

  @override
  Widget build(BuildContext context) {
    final themeData = Provider.of<ThemeNotifier>(context).getTheme();
    return Container(
      width: double.maxFinite,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: themeData.brightness == Brightness.dark
            ? Colors.white12
            : Colors.purple.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: const Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Current Risk", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
              FaIcon(FontAwesomeIcons.arrowUpRightFromSquare, size: 15,),
            ],
          ),
          SizedBox(height: 10),
          Row(
            children: [
              InfoCard(percentage: 132, title: "Total Threats", icon: FontAwesomeIcons.bug,),
              SizedBox(width: 15),
              InfoCard(percentage: 16, title: "Video File Risks", icon: FontAwesomeIcons.film,),
              SizedBox(width: 15),
              InfoCard(percentage: 43, title: "Image File Risks", icon: FontAwesomeIcons.image,),
              SizedBox(width: 15),
              InfoCard(percentage: 7, title: "Docs FIle Risks", icon: FontAwesomeIcons.fileInvoice,),
              SizedBox(width: 15),
              InfoCard(percentage: 66, title: "Folder File Risks", icon: FontAwesomeIcons.folderOpen,),
            ],
          ),
        ],
      ),
    );
  }
}