import 'package:vanashree_ngo_application/core/error/failures.dart';
import 'package:vanashree_ngo_application/core/usecases/app_usecases.dart';
import 'package:vanashree_ngo_application/core/utils/either.dart';
import 'package:vanashree_ngo_application/features/homepage/domain/repositories/profile_repository.dart';

class DeleteProfileUseCase implements UseCaseWithourParam<void> {
  final ProfileRepository repository;

  const DeleteProfileUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call() {
    return repository.deleteProfile();
  }
}
