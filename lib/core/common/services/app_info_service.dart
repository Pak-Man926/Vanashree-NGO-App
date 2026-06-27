import 'package:package_info_plus/package_info_plus.dart';
import 'package:vanashree_ngo_application/core/locator.dart';

abstract class AppInfoService {
  Future<String> getVersion();
}

class AppInfoServiceImpl implements AppInfoService {
  @override
  Future<String> getVersion() async {
    final info = await PackageInfo.fromPlatform();
    appLog.debug(info.version.toString());
    return info.version;
  }
}
