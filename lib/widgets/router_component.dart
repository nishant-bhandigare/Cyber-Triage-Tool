import 'package:cyber_triage_tool/theme_notifier.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class RouterComponent extends StatelessWidget{
  const RouterComponent({super.key, required this.text, required this.url});
  final String text;
  final String url;

  @override
  Widget build(BuildContext context) {
    final themeData = Provider.of<ThemeNotifier>(context).getTheme();
    return Container(
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: themeData.brightness == Brightness.dark
            ? Colors.white12
            : Colors.purple.withOpacity(0.2),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              '$text ...',
              style: const TextStyle(
                fontSize: 14,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          GestureDetector(
            onTap: () async {
              final Uri uri = Uri.parse(url);
              if (!await launchUrl(uri)) {
              throw 'Could not launch $uri';
              }
            },
            // child: const CircleAvatar(
            //   backgroundColor: Colors.blue,
            //   child: Icon(Icons.bolt, color: Colors.white),
            // ),
            child: SizedBox(
              width: 40,
              height: 40,
              child: Lottie.asset("assets/animations/bolt.json"),
            ),
          ),
        ],
      ),
    );
  }

}