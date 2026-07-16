import 'package:equatable/equatable.dart';
import 'package:vanashree_ngo_application/features/homepage/domain/entity/profile_entity.dart';

enum ProfileStatus { initial, loading, success, error }

class ProfileState extends Equatable {
  final ProfileStatus status;
  final ProfileEntity? profile;
  final String? message;

  const ProfileState._({
    this.status = ProfileStatus.initial,
    this.profile,
    this.message,
  });

  const ProfileState.initial() : this._();

  const ProfileState.loading() : this._(status: ProfileStatus.loading);

  const ProfileState.success(ProfileEntity profile)
    : this._(status: ProfileStatus.success, profile: profile);

  const ProfileState.error(String message)
    : this._(status: ProfileStatus.error, message: message);

  @override
  List<Object?> get props => [status, profile, message];
}
