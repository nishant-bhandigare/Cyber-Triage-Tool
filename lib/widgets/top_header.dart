import 'package:cyber_triage_tool/theme_notifier.dart';
import 'package:cyber_triage_tool/widgets/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TopHeader extends StatelessWidget {
  const TopHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final themeData = Provider.of<ThemeNotifier>(context).getTheme();

    return Container(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
      child: Row(
        children: [
          Expanded(child: SearchBarElement(themeData: themeData)),
          const SizedBox(width: 24),
          // Email Icon
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.email_outlined),
          ),
          const SizedBox(width: 16),
          // Notification Icon with Red Dot
          Stack(
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.notifications_outlined),
              ),
              Positioned(
                right: 8,
                top: 8,
                child: Container(
                  height: 10,
                  width: 10,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(width: 16),
          // Vertical Divider
          const SizedBox(
            height: 24,
            width: 1,
          ),
          const SizedBox(width: 16),
          // Profile Avatar with Dropdown
          const Row(
            children: [
              CircleAvatar(
                radius: 16,
                backgroundImage: NetworkImage('https://via.placeholder.com/150'),
              ),
              SizedBox(width: 8),
              Text(
                'User',
              ),
              Icon(Icons.arrow_drop_down),
            ],
          ),
        ],
      ),
    );
  }
}
