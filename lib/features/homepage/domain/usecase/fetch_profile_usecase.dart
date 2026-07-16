import 'package:vanashree_ngo_application/core/error/failures.dart';
import 'package:vanashree_ngo_application/core/usecases/app_usecases.dart';
import 'package:vanashree_ngo_application/core/utils/either.dart';
import 'package:vanashree_ngo_application/features/homepage/domain/entity/profile_entity.dart';
import 'package:vanashree_ngo_application/features/homepage/domain/repositories/profile_repository.dart';

class FetchProfileUseCase implements UseCaseWithourParam<ProfileEntity> {
  final ProfileRepository repository;

  const FetchProfileUseCase(this.repository);

  @override
  Future<Either<Failure, ProfileEntity>> call() {
    return repository.fetchProfile();
  }
}
