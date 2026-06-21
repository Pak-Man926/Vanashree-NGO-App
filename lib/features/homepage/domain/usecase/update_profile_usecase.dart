import 'package:vanashree_ngo_application/core/error/failures.dart';
import 'package:vanashree_ngo_application/core/usecases/app_usecases.dart';
import 'package:vanashree_ngo_application/core/utils/either.dart';
import 'package:vanashree_ngo_application/features/homepage/domain/entity/profile_entity.dart';
import 'package:vanashree_ngo_application/features/homepage/domain/repositories/profile_repository.dart';

class UpdateProfileUseCase
    implements UseCaseWithParams<ProfileEntity, ProfileEntity> {
  final ProfileRepository repository;

  const UpdateProfileUseCase(this.repository);

  @override
  Future<Either<Failure, ProfileEntity>> call(ProfileEntity params) {
    return repository.updateProfile(params);
  }
}
