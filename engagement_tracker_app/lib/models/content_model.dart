class ContentItemModel {
  final String id;
  final String title;
  final String description;
  final String imageUrl;
  final String meta;
  final ContentType type;
  final String category;
  final String author;
  final DateTime publishDate;
  final int? durationInSeconds;

  ContentItemModel({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.meta,
    required this.type,
    required this.category,
    required this.author,
    required this.publishDate,
    this.durationInSeconds,
  });
}

enum ContentType {
  article,
  video,
}

class RewardItemModel {
  final String id;
  final String title;
  final String description;
  final String imageUrl;
  final int pointsRequired;
  final bool isFeatured;

  RewardItemModel({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.pointsRequired,
    this.isFeatured = false,
  });
}

class UserProfileModel {
  final String id;
  final String name;
  final String email;
  final String? profileImageUrl;
  final int pointsBalance;
  final int rewardsRedeemed;
  final int productsScanned;
  final List<String> childrenNames;

  UserProfileModel({
    required this.id,
    required this.name,
    required this.email,
    this.profileImageUrl,
    required this.pointsBalance,
    required this.rewardsRedeemed,
    required this.productsScanned,
    required this.childrenNames,
  });
}