import 'package:vanashree_ngo_application/features/homepage/domain/entity/profile_entity.dart';

class ProfileModel {
  final String name;
  final String profileImageUrl;
  final String village;
  final String memberSince;
  final int treesPlanted;
  final int treesActive;
  final int careUpdateLogged;
  final int badgesEarned;
  final int daysStreak;

  static ProfileModel get defaultProfile => ProfileModel(
    name: "Rohan Shrestha",
    profileImageUrl: "https://i.pravatar.cc/300",
    village: "Kathmandu",
    memberSince: "January 2024",
    treesPlanted: 125,
    treesActive: 118,
    careUpdateLogged: 342,
    badgesEarned: 12,
    daysStreak: 45,
  );

  ProfileModel({
    required this.name,
    required this.profileImageUrl,
    required this.village,
    required this.memberSince,
    required this.treesPlanted,
    required this.treesActive,
    required this.careUpdateLogged,
    required this.badgesEarned,
    required this.daysStreak,
  });

  factory ProfileModel.fromEntity(ProfileEntity entity) {
    return ProfileModel(
      name: entity.name,
      profileImageUrl: entity.profileImageUrl,
      village: entity.village,
      memberSince: entity.memberSince,
      treesPlanted: entity.treesPlanted,
      treesActive: entity.treesActive,
      careUpdateLogged: entity.careUpdateLogged,
      badgesEarned: entity.badgesEarned,
      daysStreak: entity.daysStreak,
    );
  }

  ProfileEntity toEntity() {
    return ProfileEntity(
      name: name,
      profileImageUrl: profileImageUrl,
      village: village,
      memberSince: memberSince,
      treesPlanted: treesPlanted,
      treesActive: treesActive,
      careUpdateLogged: careUpdateLogged,
      badgesEarned: badgesEarned,
      daysStreak: daysStreak,
    );
  }

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      name: json['name'],
      profileImageUrl: json['profile_image_url'],
      village: json['village'],
      memberSince: json['member_since'],
      treesPlanted: json['trees_planted'],
      treesActive: json['trees_active'],
      careUpdateLogged: json['care_update_logged'],
      badgesEarned: json['badges_earned'],
      daysStreak: json['days_streak'],
    );
  }
}
