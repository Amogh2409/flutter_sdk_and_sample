// lib/screens/content/content_screen.dart
import 'package:flutter/material.dart';
import 'content_item.dart';
import 'category_button.dart';
import '../../components/app_bar.dart';

class ContentScreen extends StatefulWidget {
  const ContentScreen({super.key});

  @override
  State<ContentScreen> createState() => _ContentScreenState();
}

class _ContentScreenState extends State<ContentScreen> {
  String _selectedCategory = 'All';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PampersAppBar(title: 'Helpful Content'),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildCategoryRow(),
            const SizedBox(height: 24),
            _buildContentSection('Parenting Guides'),
            const SizedBox(height: 24),
            _buildContentSection('Health Tips'),
            const SizedBox(height: 24),
            _buildContentSection('Development Videos'),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryRow() {
    final categories = ['All', 'Articles', 'Videos', 'Parenting', 'Health', 'Development'];

    return SizedBox(
      height: 40,
      child: ListView(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        children: categories.map((category) {
          return Padding(
            padding: const EdgeInsets.only(right: 8),
            child: CategoryButton(
              label: category,
              active: _selectedCategory == category,
              onTap: () {
                setState(() {
                  _selectedCategory = category;
                });
              },
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildContentSection(String title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        Column(
          children: List.generate(3, (index) => Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: ContentItem(
              title: 'Baby Development Milestones: Month ${index + 3}',
              description: 'Track your baby\'s growth and development with our comprehensive guide',
              meta: '${index + 5} min read • Dr. Emily Johnson',
              imageUrl: 'assets/content/development_$index.jpg',
              onTap: () {},
            ),
          )),
        ),
      ],
    );
  }
}