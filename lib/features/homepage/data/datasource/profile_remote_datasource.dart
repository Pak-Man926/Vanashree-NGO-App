import 'package:vanashree_ngo_application/features/homepage/data/models/profile_model.dart';

abstract class ProfileRemoteDataSource {
  Future<ProfileModel> getProfile();
  Future<ProfileModel> createProfile(ProfileModel model);
  Future<ProfileModel> updateProfile(ProfileModel model);
  Future<void> deleteProfile();
}

class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  // final Dio dio;

  ProfileRemoteDataSourceImpl(
    // this.dio
  );

  @override
  Future<ProfileModel> getProfile() async {
    // Implement actual API call with Dio/network client in production.
    return await Future.delayed(
      const Duration(seconds: 1),
      () => ProfileModel.defaultProfile,
    );
  }

  @override
  Future<ProfileModel> createProfile(ProfileModel model) async {
    // POST /profile
    return await Future.delayed(const Duration(milliseconds: 800), () => model);
  }

  @override
  Future<ProfileModel> updateProfile(ProfileModel model) async {
    // PUT /profile
    return await Future.delayed(const Duration(milliseconds: 800), () => model);
  }

  @override
  Future<void> deleteProfile() async {
    // DELETE /profile
    return await Future.delayed(const Duration(milliseconds: 500));
  }
}
