import 'package:cyber_triage_tool/theme_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class InfoCard extends StatelessWidget{
  const InfoCard({super.key, required this.percentage, required this.title, required this.icon});
  final IconData icon;
  final int percentage;
  final String title;

  @override
  Widget build(BuildContext context) {
    final themeData = Provider.of<ThemeNotifier>(context).getTheme();
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: themeData.brightness == Brightness.dark
              ? Colors.white12
              : Colors.purple.withOpacity(0.2),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  radius: 20,
                  child: Icon(icon, size: 15,),
                ),
                IconButton(onPressed: (){}, icon: const Icon(Icons.arrow_forward_rounded, size: 20,)),
              ],
            ),
            const SizedBox(height: 15),
            Text("$percentage %", style: const TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
            Text(title, style: const TextStyle(fontSize: 10),),
          ],
        ),
      ),
    );
  }

}