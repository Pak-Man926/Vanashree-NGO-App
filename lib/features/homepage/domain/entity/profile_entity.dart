import 'package:equatable/equatable.dart';

class ProfileEntity extends Equatable {
  final String name;
  final String profileImageUrl;
  final String village;
  final String memberSince;
  final int treesPlanted;
  final int treesActive;
  final int careUpdateLogged;
  final int badgesEarned;
  final int daysStreak;

  const ProfileEntity({
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

  @override
  List<Object?> get props => [
    name,
    profileImageUrl,
    village,
    memberSince,
    treesPlanted,
    treesActive,
    careUpdateLogged,
    badgesEarned,
    daysStreak,
  ];
}
