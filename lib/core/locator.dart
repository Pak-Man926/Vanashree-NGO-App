import 'package:get_it/get_it.dart';
import 'package:vanashree_ngo_application/core/common/services/app_info_service.dart';

import 'common/services/secure_storage_service.dart';
import 'utils/logger.dart';

final GetIt getIt = GetIt.instance;

void setupLocator() {
  getIt
    ..registerSingleton<AppLogger>(AppLogger())
    ..registerSingleton<ISecureStorageService>(SecureStorageService())
    ..registerSingleton<AppInfoService>(AppInfoServiceImpl());
  // getIt.registerSingleton<NetworkConnectivity>(NetworkConnectivity());
}

AppLogger get appLog => getIt<AppLogger>();
ISecureStorageService get secureStorage => getIt<ISecureStorageService>();
AppInfoService get appInfo => getIt<AppInfoService>();
// NetworkConnectivity get networkConnection => getIt<NetworkConnectivity>();
