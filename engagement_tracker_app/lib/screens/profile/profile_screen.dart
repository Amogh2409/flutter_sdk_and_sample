import 'package:engagement_tracker_app/models/content_model.dart';
import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
import '../../services/data_service.dart';
import 'setting_item.dart';
import '../../components/app_bar.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = DataService().getUserProfile();

    return Scaffold(
      appBar: PampersAppBar(title: 'My Profile'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildProfileHeader(user),
            const SizedBox(height: 24),
            _buildSettingsSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileHeader(UserProfileModel user) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage(user.profileImageUrl ?? 'assets/profile_placeholder.jpg'),
            ),
            const SizedBox(height: 16),
            Text(
              user.name,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              user.email,
              style: const TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildStatItem(user.pointsBalance.toString(), 'Points'),
                _buildStatItem(user.rewardsRedeemed.toString(), 'Rewards'),
                _buildStatItem(user.productsScanned.toString(), 'Scans'),
              ],
            ),
            if (user.childrenNames.isNotEmpty) ...[
              const SizedBox(height: 16),
              Wrap(
                spacing: 8,
                children: user.childrenNames.map((child) => Chip(
                  label: Text(child),
                  avatar: const Icon(Icons.child_care, size: 18),
                )).toList(),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildStatItem(String value, String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Text(
            value,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: const TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }

  Widget _buildSettingsSection() {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      color: Colors.white,
      child: Column(
        children: const [
          SettingItem(icon: Icons.person, label: 'Account Settings'),
          SettingItem(icon: Icons.child_care, label: 'My Children'),
          SettingItem(icon: Icons.card_giftcard, label: 'Rewards History'),
          SettingItem(icon: Icons.history, label: 'Scan History'),
          SettingItem(icon: Icons.notifications, label: 'Notifications'),
          SettingItem(icon: Icons.help, label: 'Help & Support'),
          SettingItem(icon: Icons.security, label: 'Privacy & Security'),
          SettingItem(
            icon: Icons.logout,
            label: 'Log Out',
            isLogout: true,
          ),
        ],
      ),
    );
  }
}