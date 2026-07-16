import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vanashree_ngo_application/core/error/failures.dart';
import 'package:vanashree_ngo_application/core/utils/either.dart';
import 'package:vanashree_ngo_application/features/homepage/di/usecase_di.dart';
import 'package:vanashree_ngo_application/features/homepage/domain/entity/profile_entity.dart';
import 'package:vanashree_ngo_application/features/homepage/presentation/state/profile_state.dart';

class ProfileNotifier extends Notifier<ProfileState> {
  @override
  ProfileState build() {
    // Auto-load profile on initialization
    Future.microtask(() => fetch());
    return const ProfileState.loading();
  }

  Future<void> fetch() async {
    state = const ProfileState.loading();
    final fetchUseCase = ref.read(fetchProfileUseCaseProvider);
    final Either<Failure, ProfileEntity> res = await fetchUseCase.call();
    res.fold(
      (f) => state = ProfileState.error(f.message),
      (p) => state = ProfileState.success(p),
    );
  }

  Future<void> create(ProfileEntity entity) async {
    state = const ProfileState.loading();
    final createUseCase = ref.read(createProfileUseCaseProvider);
    final Either<Failure, ProfileEntity> res = await createUseCase.call(entity);
    res.fold(
      (f) => state = ProfileState.error(f.message),
      (p) => state = ProfileState.success(p),
    );
  }

  Future<void> update(ProfileEntity entity) async {
    state = const ProfileState.loading();
    final updateUseCase = ref.read(updateProfileUseCaseProvider);
    final Either<Failure, ProfileEntity> res = await updateUseCase.call(entity);
    res.fold(
      (f) => state = ProfileState.error(f.message),
      (p) => state = ProfileState.success(p),
    );
  }

  Future<void> delete() async {
    state = const ProfileState.loading();
    final deleteUseCase = ref.read(deleteProfileUseCaseProvider);
    final Either<Failure, void> res = await deleteUseCase.call();
    res.fold(
      (f) => state = ProfileState.error(f.message),
      (_) => state = const ProfileState.initial(),
    );
  }
}
