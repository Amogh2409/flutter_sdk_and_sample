import 'package:flutter/material.dart';
import '../screens/home/home_screen.dart';
import '../screens/rewards/rewards_screen.dart';
import '../screens/scan/scan_screen.dart';
import '../screens/content/content_screen.dart';
import '../screens/article/article_screen.dart';
import '../screens/video/video_screen.dart';
import '../screens/profile/profile_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case '/rewards':
        return MaterialPageRoute(builder: (_) => const RewardsScreen());
      case '/scan':
        return MaterialPageRoute(builder: (_) => const ScanScreen());
      case '/content':
        return MaterialPageRoute(builder: (_) => const ContentScreen());
      case '/article':
        return MaterialPageRoute(builder: (_) => const ArticleScreen());
      case '/video':
        return MaterialPageRoute(builder: (_) => const VideoScreen());
      case '/profile':
        return MaterialPageRoute(builder: (_) => const ProfileScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}