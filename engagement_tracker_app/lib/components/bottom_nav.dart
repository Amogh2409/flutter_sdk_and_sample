// lib/components/bottom_nav.dart
import 'package:flutter/material.dart';

class PampersBottomNav extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const PampersBottomNav({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 10,
            offset: const Offset(0, -2),
          )
        ],
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        child: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: onTap,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Theme.of(context).colorScheme.primary,
          unselectedItemColor: Colors.grey[600],
          selectedLabelStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
          unselectedLabelStyle: const TextStyle(fontSize: 12),
          showUnselectedLabels: true,
          elevation: 10,
          items: [
            _buildNavItem(Icons.home_outlined, Icons.home, 'Home'),
            _buildNavItem(Icons.card_giftcard_outlined, Icons.card_giftcard, 'Rewards'),
            _buildScanNavItem(),
            _buildNavItem(Icons.article_outlined, Icons.article, 'Content'),
            _buildNavItem(Icons.person_outlined, Icons.person, 'Profile'),
          ],
        ),
      ),
    );
  }

  BottomNavigationBarItem _buildNavItem(IconData icon, IconData activeIcon, String label) {
    return BottomNavigationBarItem(
      icon: Icon(icon, size: 24),
      activeIcon: Icon(activeIcon, size: 24),
      label: label,
    );
  }

  BottomNavigationBarItem _buildScanNavItem() {
    return BottomNavigationBarItem(
      icon: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: const Color(0xFF0066CC),
          shape: BoxShape.circle,
        ),
        child: const Icon(Icons.camera_alt, color: Colors.white, size: 24),
      ),
      label: 'Scan',
    );
  }
}