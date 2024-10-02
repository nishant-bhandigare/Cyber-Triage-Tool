import 'package:cyber_triage_tool/theme_notifier.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class MarkThreatBar extends StatefulWidget {
  const MarkThreatBar({super.key});

  @override
  _MarkThreatBarState createState() => _MarkThreatBarState();
}

class _MarkThreatBarState extends State<MarkThreatBar> {
  String? _selectedItemStatus;

  @override
  Widget build(BuildContext context) {
    final themeData = Provider.of<ThemeNotifier>(context).getTheme();
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: themeData.brightness == Brightness.dark
            ? Colors.white12
            : Colors.teal.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          const Row(
            children: [
              Text('Mark item as a'),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildRadioOption(
                'Bad Item',
                'bad',
                FontAwesomeIcons.circleExclamation,
                Colors.red,
              ),
              _buildRadioOption(
                'Suspicious Item',
                'suspicious',
                FontAwesomeIcons.triangleExclamation,
                Colors.amber,
              ),
              _buildRadioOption(
                'Good Item',
                'good',
                FontAwesomeIcons.circleCheck,
                Colors.green,
              ),
              _buildRadioOption(
                'Unknown',
                'unknown',
                FontAwesomeIcons.circleQuestion,
                Colors.blueGrey,
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _selectedItemStatus = null;
                  });
                },
                child: const Text('Undo'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildRadioOption(String label, String value, IconData icon, Color iconColor) {
    return Row(
      children: [
        Radio<String>(
          value: value,
          groupValue: _selectedItemStatus,
          onChanged: (newValue) {
            setState(() {
              _selectedItemStatus = newValue;
            });
          },
        ),
        Icon(icon, color: iconColor),
        const SizedBox(width: 4),
        Text(label),
      ],
    );
  }
}
