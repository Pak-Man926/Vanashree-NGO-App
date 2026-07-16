import 'package:vanashree_ngo_application/features/homepage/domain/entity/profile_entity.dart';
import 'package:vanashree_ngo_application/features/homepage/domain/repositories/profile_repository.dart';

class GetProfileUseCase {
  final ProfileRepository repository;

  GetProfileUseCase(this.repository);

  Future<ProfileEntity> call() {
    return repository.getProfile();
  }

}

