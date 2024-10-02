import 'package:cyber_triage_tool/data/threat_data.dart';
import 'package:cyber_triage_tool/theme_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cyber_triage_tool/models/threat_model.dart'; // Import your Threat model here

class ThreatListItem extends StatelessWidget {
  final String threatName;
  final String description;

  const ThreatListItem({
    super.key,
    required this.threatName,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    final themeData = Provider.of<ThemeNotifier>(context).getTheme();
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 0, 0, 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: themeData.brightness == Brightness.dark
            ? Colors.white12
            : Colors.teal.withOpacity(0.1),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(4),
              decoration: const BoxDecoration(
                color: Colors.orange,
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.warning, color: Colors.white, size: 16),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    threatName,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    description,
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // Add your "Get help" functionality here
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
              ),
              child: const Text('Monitor'),
            ),
          ],
        ),
      ),
    );
  }
}

class ThreatList extends StatelessWidget {
  const ThreatList({super.key});

  @override
  Widget build(BuildContext context) {
    // Filter threats by severity
    List<DetectedThreat> highSeverityThreats = threatList
        .where((threat) => threat.severity == 'High')
        .toList();

    return Column(
      children: highSeverityThreats.map((threat) {
        return ThreatListItem(
          threatName: threat.threatType, // Assuming 'threatType' is a field in DetectedThreat
          description: threat.description, // Assuming 'description' is a field in DetectedThreat
        );
      }).toList(),
    );
  }
}
