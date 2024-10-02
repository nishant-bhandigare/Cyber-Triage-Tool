import 'package:cyber_triage_tool/theme_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ThemeSwitch extends StatelessWidget{
  const ThemeSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    final themeData = Provider.of<ThemeNotifier>(context);
    return Container(
      height: 40,
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
      decoration: BoxDecoration(
        border: Border.all(width: 1.4, color: Theme.of(context).hintColor),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "Theme",
            // style: TextStyle(fontSize: 20),
          ),
          Switch(
            value: themeData.getTheme() == themeData.darkTheme,
            onChanged: (value) {
              themeData.toggleThemeMode();
            },
          ),
        ],
      ),
    );
  }

}