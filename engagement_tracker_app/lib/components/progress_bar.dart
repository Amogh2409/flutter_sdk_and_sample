import 'package:flutter/material.dart';

class CustomProgressBar extends StatelessWidget {
  final double value;

  const CustomProgressBar({
    super.key,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(4)),
      child: LinearProgressIndicator(
        value: value,
        minHeight: 8,
        backgroundColor: Colors.white,
        color: const Color(0xFF0066CC),
      ),
    );
  }
}