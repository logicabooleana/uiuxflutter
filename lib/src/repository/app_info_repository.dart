import 'package:desingapp/src/model/app_info.dart';

abstract class AppInfoRepositoryBase {
  Future<AppInfo?> getAppInfo();
}
