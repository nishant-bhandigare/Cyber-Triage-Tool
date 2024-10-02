import 'package:cyber_triage_tool/widgets/theme_switch.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';

class SideDrawer extends StatelessWidget {
  final Function(int) onSelectPage;

  const SideDrawer({super.key, required this.onSelectPage});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 200,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const DrawerHeader(
            child: Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.blue,
                  child: Icon(
                    Icons.bubble_chart,
                    size: 30,
                  ),
                ),
                SizedBox(width: 10),
                Text(
                  'Triage',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            // child: SizedBox(
            //   height: 100,
            //   width: 100,
            //   child: Lottie.asset("assets/animations/Animation - 1727820781766.json"),
            // ),
          ),
          ListTile(
            leading: const FaIcon(FontAwesomeIcons.igloo),
            title: const Text('Dashboard'),
            onTap: () => onSelectPage(0),
          ),
          ListTile(
            leading: const FaIcon(FontAwesomeIcons.circleNodes),
            title: const Text('Network'),
            onTap: () => onSelectPage(1),
          ),
          ListTile(
            leading: const FaIcon(FontAwesomeIcons.skullCrossbones),
            title: const Text('Threats'),
            onTap: () => onSelectPage(2),
          ),
          ListTile(
            leading: const FaIcon(FontAwesomeIcons.triangleExclamation),
            title: const Text('Alerts'),
            onTap: () => onSelectPage(3),
          ),
          ListTile(
            leading: const FaIcon(FontAwesomeIcons.headset),
            title: const Text('Support'),
            onTap: () => onSelectPage(4),
          ),

          ListTile(
            leading: const FaIcon(FontAwesomeIcons.screwdriverWrench),
            title: const Text('Settings'),
            onTap: () => onSelectPage(5),
          ),
          const Spacer(),
          const ThemeSwitch(),
          Container(
            // height: 200,
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Expanded(
                  child: Text('Get pro now and enjoy all the features'),
                ),
                IconButton.filledTonal(
                  onPressed: () => {},
                  icon: const Icon(Icons.arrow_forward),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
