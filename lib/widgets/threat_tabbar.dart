import 'package:cyber_triage_tool/theme_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart'; // Import DateFormat for date formatting
import 'package:cyber_triage_tool/models/threat_model.dart'; // Import the DetectedThreat model

class ThreatTabBar extends StatelessWidget {
  final DetectedThreat? selectedThreat; // Accept selected threat

  const ThreatTabBar({super.key, required this.selectedThreat});

  @override
  Widget build(BuildContext context) {
    final themeData = Provider.of<ThemeNotifier>(context).getTheme();

    return Container(
      height: 400, // Adjust height based on your requirements
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: themeData.brightness == Brightness.dark
            ? Colors.white12
            : Colors.teal.withOpacity(0.1),
      ),
      child: DefaultTabController(
        length: 8, // Number of tabs
        child: Column(
          children: [
            Container(
              height: 50,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: const TabBar(
                isScrollable: true, // Allows horizontal scrolling for tabs
                indicatorColor: Colors.blue,
                indicatorWeight: 4.0,
                labelColor: Colors.blue,
                unselectedLabelColor: Colors.grey,
                labelStyle: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
                unselectedLabelStyle: TextStyle(
                  fontSize: 14.0,
                ),
                tabs: [
                  Tab(text: 'Threat Details'),
                  Tab(text: 'File'),
                  Tab(text: 'Process'),
                  Tab(text: 'User'),
                  Tab(text: 'Execution History'),
                  Tab(text: 'Startup Items'),
                  Tab(text: 'Sessions'),
                  Tab(text: 'Analysis Results'),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  // Threat Details
                  _buildThreatDetailsTab(selectedThreat),

                  // File Tab
                  _buildFileTab(selectedThreat),

                  // Process Tab
                  _buildProcessTab(selectedThreat),

                  // User Tab
                  _buildUserTab(selectedThreat),

                  // Execution History Tab
                  _buildExecutionHistoryTab(),

                  // Startup Items Tab
                  _buildStartupItemsTab(),

                  // Sessions Tab
                  _buildSessionsTab(),

                  // Analysis Results Tab
                  _buildAnalysisResultsTab(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildThreatDetailsTab(DetectedThreat? threat) {
    if (threat == null) {
      return const Padding(
        padding: EdgeInsets.all(16.0),
        child: Text('No threat selected.'),
      );
    }
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Threat Name: ${threat.threatType}',
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text('Description: ${threat.description}'),
          const SizedBox(height: 8),
          Text(
            'Severity: ${threat.severity}',
            style: TextStyle(color: getSeverityColor(threat.severity)),
          ),
          const SizedBox(height: 8),
          Text(
            'Detected At: ${DateFormat('yyyy-MM-dd').format(threat.detectedAt)}',
          ),
          const SizedBox(height: 8),
          const Divider(),
          const Text('Recommended Actions:', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 4),
          const Text('1. Remove the threat immediately.'),
          const Text('2. Run a full system scan.'),
          const Text('3. Backup important files.'),
        ],
      ),
    );
  }

  Widget _buildFileTab(DetectedThreat? threat) {
    if (threat == null) {
      return const Padding(
        padding: EdgeInsets.all(16.0),
        child: Text('No file information available.'),
      );
    }
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('File Path: ${threat.filePath}'),
          // Add any other file-related details if available
          const SizedBox(height: 8),
          const Text('File Size: [Include size here]', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          const Text('File Hash: [Include hash here]', style: TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget _buildProcessTab(DetectedThreat? threat) {
    if (threat == null) {
      return const Padding(
        padding: EdgeInsets.all(16.0),
        child: Text('No process information available.'),
      );
    }
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Process Name: [Include process name here]'),
          Text('Process ID: [Include PID here]'),
          Text('Status: [Include status here]'),
          // Add more process-related details if needed
        ],
      ),
    );
  }

  Widget _buildUserTab(DetectedThreat? threat) {
    if (threat == null) {
      return const Padding(
        padding: EdgeInsets.all(16.0),
        child: Text('No user information available.'),
      );
    }
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('User Account: [Include user account here]'),
          Text('Last Login: [Include last login time here]'),
          // Add more user-related details if needed
        ],
      ),
    );
  }

  Widget _buildExecutionHistoryTab() {
    return ListView.builder(
      itemCount: 3, // Sample count, replace with actual data
      itemBuilder: (context, index) {
        return const ListTile(
          title: Text('Execution history details will be displayed here.'),
        );
      },
    );
  }

  Widget _buildStartupItemsTab() {
    return ListView.builder(
      itemCount: 3, // Sample count, replace with actual data
      itemBuilder: (context, index) {
        return const ListTile(
          title: Text('Startup items will be displayed here.'),
        );
      },
    );
  }

  Widget _buildSessionsTab() {
    return ListView.builder(
      itemCount: 3, // Sample count, replace with actual data
      itemBuilder: (context, index) {
        return const ListTile(
          title: Text('Session information will be displayed here.'),
        );
      },
    );
  }

  Widget _buildAnalysisResultsTab() {
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: Text('Analysis results will be displayed here.'),
    );
  }

  // Helper function to get severity color
  Color getSeverityColor(String severity) {
    switch (severity) {
      case 'Low':
        return Colors.green;
      case 'Medium':
        return Colors.yellow;
      case 'High':
        return Colors.orange;
      case 'Critical':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }
}
