// lib/screens/rewards/rewards_screen.dart
import 'package:engagement_tracker_app/screens/rewards/rewards_card.dart';
import 'package:flutter/material.dart';
// import 'reward_card.dart';
import 'points_summary.dart';
import '../../components/app_bar.dart';

class RewardsScreen extends StatelessWidget {
  const RewardsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PampersAppBar(title: 'Rewards'),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const PointsSummary(),
            const SizedBox(height: 24),
            _buildRewardsSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildRewardsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Redeem Your Points',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        GridView.count(
          crossAxisCount: 2,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          childAspectRatio: 0.8,
          children: [
            RewardCard(
              title: 'Amazon Gift Card',
              points: '1000 pts',
              imageUrl: 'assets/rewards/amazon.jpg',
              isFeatured: true,
            ),
            RewardCard(
              title: 'Target Gift Card',
              points: '1200 pts',
              imageUrl: 'assets/rewards/target.jpg',
            ),
            RewardCard(
              title: 'Baby Clothes Set',
              points: '1500 pts',
              imageUrl: 'assets/rewards/clothes.jpg',
            ),
            RewardCard(
              title: 'Diaper Bag',
              points: '2000 pts',
              imageUrl: 'assets/rewards/diaper_bag.jpg',
              isFeatured: true,
            ),
          ],
        ),
      ],
    );
  }
}