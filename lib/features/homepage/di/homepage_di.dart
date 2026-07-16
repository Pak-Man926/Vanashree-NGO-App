import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vanashree_ngo_application/features/homepage/data/datasource/profile_remote_datasource.dart';
import 'package:vanashree_ngo_application/features/homepage/data/repository/profile_repository_impl.dart';
import 'package:vanashree_ngo_application/features/homepage/domain/repositories/profile_repository.dart';

final profileRemoteDataSourceProvider = Provider<ProfileRemoteDataSource>((
  ref,
) {
  return ProfileRemoteDataSourceImpl();
});

final profileRepositoryProvider = Provider<ProfileRepository>((ref) {
  final remote = ref.watch(profileRemoteDataSourceProvider);
  return ProfileRepositoryImpl(remote);
});
