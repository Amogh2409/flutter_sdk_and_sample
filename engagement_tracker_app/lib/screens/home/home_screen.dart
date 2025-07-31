import 'package:flutter/material.dart';
import 'dashboard_screen.dart';
import '../rewards/rewards_screen.dart';
import '../scan/scan_screen.dart';
import '../content/content_screen.dart';
import '../profile/profile_screen.dart';
import '../../components/bottom_nav.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const DashboardScreen(),
    const RewardsScreen(),
    const ScanScreen(),
    const ContentScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: PampersBottomNav(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
      ),
    );
  }
}