import '../models/content_model.dart';

class DataService {
  // Singleton pattern
  static final DataService _instance = DataService._internal();
  factory DataService() => _instance;
  DataService._internal();

  // Mock data for rewards
  List<RewardItemModel> getRewards() {
    return [
      RewardItemModel(
        id: '1',
        title: 'Amazon Gift Card',
        description: '\$10 Amazon e-gift card',
        imageUrl: 'assets/rewards/amazon.jpg',
        pointsRequired: 1000,
        isFeatured: true,
      ),
      RewardItemModel(
        id: '2',
        title: 'Target Gift Card',
        description: '\$10 Target e-gift card',
        imageUrl: 'assets/rewards/target.jpg',
        pointsRequired: 1200,
      ),
      RewardItemModel(
        id: '3',
        title: 'Baby Clothes Set',
        description: 'Organic cotton onesie set',
        imageUrl: 'assets/rewards/clothes.jpg',
        pointsRequired: 1500,
      ),
      RewardItemModel(
        id: '4',
        title: 'Diaper Bag',
        description: 'Premium waterproof diaper bag',
        imageUrl: 'assets/rewards/diaper_bag.jpg',
        pointsRequired: 2000,
        isFeatured: true,
      ),
    ];
  }

  // Mock data for content
  List<ContentItemModel> getContent() {
    return [
      ContentItemModel(
        id: '1',
        title: 'Baby Sleep Training Methods',
        description: 'Learn effective techniques to help your baby sleep through the night',
        imageUrl: 'assets/content/sleep.jpg',
        meta: '8 min read',
        type: ContentType.article,
        category: 'Parenting',
        author: 'Dr. Emily Johnson',
        publishDate: DateTime(2023, 5, 15),
      ),
      ContentItemModel(
        id: '2',
        title: 'Diaper Rash Prevention',
        description: 'Simple steps to protect your baby\'s delicate skin',
        imageUrl: 'assets/content/diaper_rash.jpg',
        meta: '5 min read',
        type: ContentType.article,
        category: 'Health',
        author: 'Dr. Michael Chen',
        publishDate: DateTime(2023, 6, 2),
      ),
      ContentItemModel(
        id: '3',
        title: 'Baby Massage Techniques',
        description: 'Step-by-step guide to relaxing your baby',
        imageUrl: 'assets/content/massage.jpg',
        meta: 'Video • 4:22',
        type: ContentType.video,
        category: 'Development',
        author: 'Nurse Sarah Williams',
        publishDate: DateTime(2023, 4, 18),
        durationInSeconds: 262,
      ),
    ];
  }

  // Mock user profile data
  UserProfileModel getUserProfile() {
    return UserProfileModel(
      id: 'user123',
      name: 'Sarah Johnson',
      email: 'sarah.johnson@example.com',
      profileImageUrl: 'assets/profile.jpg',
      pointsBalance: 1250,
      rewardsRedeemed: 12,
      productsScanned: 48,
      childrenNames: ['Emma', 'Noah'],
    );
  }
}