import 'package:vanashree_ngo_application/core/error/failures.dart';
import 'package:vanashree_ngo_application/core/utils/either.dart';
import 'package:vanashree_ngo_application/features/homepage/data/datasource/profile_remote_datasource.dart';
import 'package:vanashree_ngo_application/features/homepage/data/models/profile_model.dart';
import 'package:vanashree_ngo_application/features/homepage/domain/entity/profile_entity.dart';
import 'package:vanashree_ngo_application/features/homepage/domain/repositories/profile_repository.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileRemoteDataSource remote;

  ProfileRepositoryImpl(this.remote);

  // Legacy/simple getter kept for compatibility
  @override
  Future<ProfileEntity> getProfile() async {
    final profileModel = await remote.getProfile();
    return profileModel.toEntity();
  }

  @override
  Future<Either<Failure, ProfileEntity>> fetchProfile() async {
    try {
      final model = await remote.getProfile();
      return Right(model.toEntity());
    } catch (e) {
      return Left(ApiFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, ProfileEntity>> createProfile(
    ProfileEntity profile,
  ) async {
    try {
      final model = ProfileModel.fromEntity(profile);
      final created = await remote.createProfile(model);
      return Right(created.toEntity());
    } catch (e) {
      return Left(ApiFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, ProfileEntity>> updateProfile(
    ProfileEntity profile,
  ) async {
    try {
      final model = ProfileModel.fromEntity(profile);
      final updated = await remote.updateProfile(model);
      return Right(updated.toEntity());
    } catch (e) {
      return Left(ApiFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> deleteProfile() async {
    try {
      await remote.deleteProfile();
      return const Right(null);
    } catch (e) {
      return Left(ApiFailure(message: e.toString()));
    }
  }
}
