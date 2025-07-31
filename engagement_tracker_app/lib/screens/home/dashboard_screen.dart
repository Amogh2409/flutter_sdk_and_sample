// lib/screens/home/dashboard_screen.dart
import 'package:flutter/material.dart';
import 'welcome_card.dart';
import 'content_card.dart';
// import '../../components/progress_bar.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverAppBar(
          title: Text('Pampers Club', style: Theme.of(context).textTheme.displayMedium),
          floating: true,
          snap: true,
        ),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          sliver: SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const WelcomeCard(),
                const SizedBox(height: 24),
                _buildPointsCard(context),
                const SizedBox(height: 24),
                Text(
                  'Quick Actions',
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                const SizedBox(height: 16),
                _buildQuickActions(),
                const SizedBox(height: 24),
                Text(
                  'Recommended For You',
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                const SizedBox(height: 16),
                _buildContentRow(),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPointsCard(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      color: Theme.of(context).colorScheme.primary.withOpacity(0.05),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.card_giftcard, color: Colors.white, size: 30),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Your Rewards Balance',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '1,250 Points',
                    style: Theme.of(context).textTheme.displayMedium?.copyWith(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                  ),
                  const SizedBox(height: 8),
                  TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    child: Text(
                      'VIEW REWARDS CATALOG',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuickActions() {
    return GridView.count(
      crossAxisCount: 4,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      childAspectRatio: 0.9,
      mainAxisSpacing: 16,
      crossAxisSpacing: 8,
      children: [
        _buildActionButton(Icons.camera_alt, 'Scan Product'),
        _buildActionButton(Icons.local_offer, 'Redeem'),
        _buildActionButton(Icons.history, 'History'),
        _buildActionButton(Icons.help, 'Support'),
      ],
    );
  }

  Widget _buildActionButton(IconData icon, String label) {
    return Material(
      borderRadius: BorderRadius.circular(16),
      color: Colors.white,
      elevation: 2,
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () {},
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: const Color(0xFF0066CC), size: 28),
            const SizedBox(height: 8),
            Text(
              label,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContentRow() {
    return SizedBox(
      height: 200,
      child: ListView(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        children: const [
          ContentCard(
            title: 'Baby Sleep Guide',
            meta: '5 min read',
            isVideo: false,
          ),
          SizedBox(width: 16),
          ContentCard(
            title: 'Diaper Rash Solutions',
            meta: '4 min read',
            isVideo: false,
          ),
          SizedBox(width: 16),
          ContentCard(
            title: 'Baby Massage Techniques',
            meta: '3:45',
            isVideo: true,
          ),
          SizedBox(width: 16),
          ContentCard(
            title: 'Nutrition Tips',
            meta: '6 min read',
            isVideo: false,
          ),
        ],
      ),
    );
  }
}