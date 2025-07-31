import 'package:flutter/material.dart';

class SettingItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isLogout;
  final VoidCallback? onTap;

  const SettingItem({
    super.key,
    required this.icon,
    required this.label,
    this.isLogout = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Icon(
            icon,
            color: isLogout ? Colors.red : const Color(0xFF0066CC),
          ),
          title: Text(
            label,
            style: TextStyle(
              color: isLogout ? Colors.red : Colors.black,
              fontWeight: FontWeight.w500,
            ),
          ),
          trailing: isLogout
              ? null
              : const Icon(Icons.chevron_right, color: Colors.grey),
          onTap: onTap,
        ),
        const Divider(height: 1, indent: 16),
      ],
    );
  }
}