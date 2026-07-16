import 'package:vanashree_ngo_application/core/error/failures.dart';
import 'package:vanashree_ngo_application/core/utils/either.dart';
import 'package:vanashree_ngo_application/features/homepage/domain/entity/profile_entity.dart';

abstract class ProfileRepository {
  // Legacy simple getter (kept for compatibility with existing code)
  Future<ProfileEntity> getProfile();

  // Production-grade operations using Either<Failure, T>
  Future<Either<Failure, ProfileEntity>> fetchProfile();
  Future<Either<Failure, ProfileEntity>> createProfile(ProfileEntity profile);
  Future<Either<Failure, ProfileEntity>> updateProfile(ProfileEntity profile);
  Future<Either<Failure, void>> deleteProfile();
}
