import 'package:cyber_triage_tool/theme_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SupportGrid extends StatelessWidget {
  const SupportGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Need help? We've got your back",
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        ),
        const Text(
          "Perhaps you can find the answers in our collections",
          style: TextStyle(fontSize: 12),
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 500,
          child: GridView.count(
            crossAxisCount: 4,
            childAspectRatio: 1,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            children: const [
              GridItem(
                icon: Icons.play_arrow,
                title: 'Getting Started',
                subtitle: 'Start off on the right foot! Not the left one!',
                color: Colors.blue,
              ),
              GridItem(
                icon: Icons.settings,
                title: 'Account Settings',
                subtitle: 'You\'re a special snowflake and so is your account',
                color: Colors.indigo,
              ),
              GridItem(
                icon: Icons.attach_money,
                title: 'Billing',
                subtitle: 'That feel when you look at your bank account',
                color: Colors.green,
              ),
              GridItem(
                icon: Icons.dashboard,
                title: 'Interface',
                subtitle: 'What does this button do #???',
                color: Colors.purple,
              ),
              GridItem(
                icon: Icons.security,
                title: 'Trust & Safety',
                subtitle: 'Keep things safe & sound for you and your buddies',
                color: Colors.red,
              ),
              GridItem(
                icon: Icons.question_answer,
                title: 'F.A.Q',
                subtitle: 'All you can eat self-serve problem solving',
                color: Colors.deepPurple,
              ),
              GridItem(
                icon: Icons.people,
                title: 'Community',
                subtitle: 'Bringing people together from all over the world',
                color: Colors.orange,
              ),
              GridItem(
                icon: Icons.computer,
                title: 'Server Setup',
                subtitle: 'Almost as exciting as interior decorating',
                color: Colors.pink,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class GridItem extends StatelessWidget {
  const GridItem(
      {super.key,
      required this.icon,
      required this.title,
      required this.subtitle,
      required this.color});

  final IconData icon;
  final String title;
  final String subtitle;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final themeData = Provider.of<ThemeNotifier>(context).getTheme();
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: themeData.brightness == Brightness.dark
            ? Colors.white12
            : Colors.teal.withOpacity(0.1),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 40, color: color),
          const SizedBox(height: 8),
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            subtitle,
            style: TextStyle(fontSize: 12, color: Colors.grey[600]),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
