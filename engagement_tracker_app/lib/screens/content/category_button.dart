import 'package:flutter/material.dart';

class CategoryButton extends StatelessWidget {
  final String label;
  final bool active;

  const CategoryButton({
    super.key,
    required this.label,
    this.active = false, required Null Function() onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: ChoiceChip(
        label: Text(label),
        selected: active,
        onSelected: (_) {},
        labelStyle: TextStyle(
          color: active ? Colors.white : Colors.black,
          fontWeight: FontWeight.w500,
        ),
        selectedColor: const Color(0xFF0066CC),
        backgroundColor: Colors.grey[200],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
      ),
    );
  }
}