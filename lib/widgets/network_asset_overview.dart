import 'package:cyber_triage_tool/theme_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AssetOverview extends StatelessWidget {
  const AssetOverview({super.key});

  @override
  Widget build(BuildContext context) {
    final themeData = Provider.of<ThemeNotifier>(context).getTheme();
    return Container(
      height: 550,
      padding: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: themeData.brightness == Brightness.dark
            ? Colors.white12
            : Colors.purple.withOpacity(0.1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: themeData.brightness == Brightness.dark
                      ? Colors.white12
                      : Colors.purple.withOpacity(0.2),
                ),
                child: const Center(
                  child: Text("last week"),
                ),
              ),
              const SizedBox(width: 10),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: themeData.brightness == Brightness.dark
                      ? Colors.white12
                      : Colors.purple.withOpacity(0.2),
                ),
                child: const Center(
                  child: Text("last week"),
                ),
              ),
              const SizedBox(width: 10),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: themeData.brightness == Brightness.dark
                      ? Colors.white12
                      : Colors.purple.withOpacity(0.2),
                ),
                child: const Center(
                  child: Text("last week"),
                ),
              ),
            ],
          ),
          const Spacer(),
          const Text("Main Assets"),
          const SizedBox(height: 15),
          LayoutBuilder(
            builder: (context, constraints) {
              return GridView.count(
                crossAxisCount: constraints.maxWidth > 600 ? 4 : 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                shrinkWrap: true,
                children: const [
                  StatCard(
                    title: 'discovered assets',
                    value: '329',
                    subtitle: 'domains:',
                    subtitleValue: '48',
                  ),
                  StatCard(
                    title: 'unable to verify',
                    value: '245',
                    subtitle: 'IP addresses:',
                    subtitleValue: '34',
                  ),
                  StatCard(
                    title: 'scheduled assets',
                    value: '131',
                    subtitle: 'subdomains',
                    subtitleValue: '5',
                  ),
                  StatCard(
                    title: 'issues found',
                    value: '73',
                    subtitle: 'IP ranges:',
                    subtitleValue: '40',
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}

class StatCard extends StatelessWidget {
  final String title;
  final String value;
  final String subtitle;
  final String subtitleValue;

  const StatCard({
    super.key,
    required this.title,
    required this.value,
    required this.subtitle,
    required this.subtitleValue,
  });

  @override
  Widget build(BuildContext context) {
    final themeData = Provider.of<ThemeNotifier>(context).getTheme();
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: themeData.brightness == Brightness.dark
            ? Colors.white12
            : Colors.purple.withOpacity(0.2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                value,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                title,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                subtitle,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Colors.grey[600],
                ),
              ),
              Text(
                subtitleValue,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
        ],
      ),
    );
  }
}