import 'package:cyber_triage_tool/screens/alert_screen.dart';
import 'package:cyber_triage_tool/screens/network_screen.dart';
import 'package:cyber_triage_tool/screens/support_screen.dart';
import 'package:cyber_triage_tool/screens/threats_screen.dart';
import 'package:cyber_triage_tool/widgets/threats_details_table.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'theme_notifier.dart';
import 'screens/dashboard_screen.dart';
import 'screens/settings_screen.dart';
import 'widgets/side_drawer.dart';
import 'widgets/right_section.dart';
import 'widgets/top_header.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final bool isDark =
      (await SharedPreferences.getInstance()).getBool('isDark') ?? true;

  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeNotifier(isDark: isDark),
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  // Index for the selected page
  int _selectedIndex = 0;

  // List of pages
  final List<Widget> _pages = [
    const DashboardScreen(),
    const NetworkScreen(),
    const ThreatsScreen(),
    const AlertsScreen(),
    const SupportScreen(),
    const SettingsScreen(),
  ];

  // Handle navigation on drawer item tap
  void _onSelectPage(int index) {
    setState(() {
      _selectedIndex = index;
    });
    Navigator.of(context).pop(); // Close the drawer
  }

  @override
  Widget build(BuildContext context) {
    final themeData = Provider.of<ThemeNotifier>(context, listen: true);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: themeData.getTheme(),
      home: Scaffold(
        body: SafeArea(
          child: Row(
            children: [
              SideDrawer(onSelectPage: _onSelectPage),
              // Expanded ensures the content takes the remaining space
              Expanded(
                child: Column(
                  children: [
                    const TopHeader(), // Header
                    Expanded(
                      child: Row(
                        children: [
                          // Main Page Content
                          Expanded(flex: 3, child: _pages[_selectedIndex]),
                          // Right Section
                          const Expanded(flex: 1, child: RightSection()),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
