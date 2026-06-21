import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vanashree_ngo_application/features/homepage/di/homepage_di.dart';
import 'package:vanashree_ngo_application/features/homepage/domain/usecase/create_profile_usecase.dart';
import 'package:vanashree_ngo_application/features/homepage/domain/usecase/delete_profile_usecase.dart';
import 'package:vanashree_ngo_application/features/homepage/domain/usecase/fetch_profile_usecase.dart';
import 'package:vanashree_ngo_application/features/homepage/domain/usecase/update_profile_usecase.dart';

final fetchProfileUseCaseProvider = Provider<FetchProfileUseCase>((ref) {
  return FetchProfileUseCase(ref.watch(profileRepositoryProvider));
});

final createProfileUseCaseProvider = Provider<CreateProfileUseCase>((ref) {
  return CreateProfileUseCase(ref.watch(profileRepositoryProvider));
});

final updateProfileUseCaseProvider = Provider<UpdateProfileUseCase>((ref) {
  return UpdateProfileUseCase(ref.watch(profileRepositoryProvider));
});

final deleteProfileUseCaseProvider = Provider<DeleteProfileUseCase>((ref) {
  return DeleteProfileUseCase(ref.watch(profileRepositoryProvider));
});
