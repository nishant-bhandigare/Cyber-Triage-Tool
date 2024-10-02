import 'package:cyber_triage_tool/data/threat_data.dart';
import 'package:cyber_triage_tool/theme_notifier.dart';
import 'package:cyber_triage_tool/models/threat_model.dart'; // Import the DetectedThreat model
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart'; // For date formatting

class ThreatDetailsTable extends StatefulWidget {
  final ValueChanged<DetectedThreat?> onThreatSelected; // Callback to notify selected threat

  const ThreatDetailsTable({super.key, required this.onThreatSelected});

  @override
  _ThreatDetailsTableState createState() => _ThreatDetailsTableState();
}

class _ThreatDetailsTableState extends State<ThreatDetailsTable> {
  String selectedTimeline = 'Daily'; // Default selection

  @override
  Widget build(BuildContext context) {
    final themeData = Provider.of<ThemeNotifier>(context).getTheme();
    final filteredThreats = _filterThreatsByTimeline(threatList, selectedTimeline);

    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: themeData.brightness == Brightness.dark
            ? Colors.white12
            : Colors.purple.withOpacity(0.1),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Threat Details',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              DropdownButton<String>(
                value: selectedTimeline,
                items: const [
                  DropdownMenuItem(value: 'Daily', child: Text('Daily')),
                  DropdownMenuItem(value: 'Weekly', child: Text('Weekly')),
                  DropdownMenuItem(value: 'Monthly', child: Text('Monthly')),
                  DropdownMenuItem(value: 'Yearly', child: Text('Yearly')),
                ],
                onChanged: (value) {
                  setState(() {
                    selectedTimeline = value!;
                  });
                },
              ),
            ],
          ),
          const SizedBox(height: 16),
          Table(
            columnWidths: const {
              0: FlexColumnWidth(1.5), // Date
              1: FlexColumnWidth(2),   // Threat Type
              2: FlexColumnWidth(3),   // Description
              3: FlexColumnWidth(1.5), // Severity
              4: FlexColumnWidth(1.5), // Source
              5: FlexColumnWidth(2),   // File Path
            },
            border: TableBorder.all(
              borderRadius: BorderRadius.circular(20),
            ),
            children: [
              _buildTableHeader(),
              ...filteredThreats.map((threat) => _buildTableRow(threat)),
            ],
          ),
        ],
      ),
    );
  }

  TableRow _buildTableHeader() {
    return const TableRow(
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20)),
      ),
      children: [
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Text('Date', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Text('Threat Type', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Text('Description', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Text('Severity', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Text('Source', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Text('File Path', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
        ),
      ],
    );
  }

  TableRow _buildTableRow(DetectedThreat threat) {
    return TableRow(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(DateFormat('yyyy-MM-dd').format(threat.detectedAt)), // Displaying only date
        ),
        GestureDetector(
          onTap: () {
            widget.onThreatSelected(threat); // Notify selected threat
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(threat.threatType),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(threat.description),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(threat.severity),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(threat.source),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(threat.filePath),
        ),
      ],
    );
  }

  List<DetectedThreat> _filterThreatsByTimeline(List<DetectedThreat> threats, String timeline) {
    final now = DateTime.now();

    switch (timeline) {
      case 'Yearly':
        return threats.where((threat) => threat.detectedAt.year == now.year).toList();
      case 'Monthly':
        return threats.where((threat) => threat.detectedAt.year == now.year && threat.detectedAt.month == now.month).toList();
      case 'Weekly':
        final startOfWeek = now.subtract(Duration(days: now.weekday - 1)); // Monday as start of the week
        return threats.where((threat) => threat.detectedAt.isAfter(startOfWeek)).toList();
      case 'Daily':
        return threats.where((threat) =>
        threat.detectedAt.year == now.year &&
            threat.detectedAt.month == now.month &&
            threat.detectedAt.day == now.day).toList();
      default:
        return threats;
    }
  }
}
