
import 'package:desingapp/src/model/app_info.dart';
import 'package:desingapp/src/provider/firebase_provider.dart';
import 'package:desingapp/src/repository/app_info_repository.dart';

class AppInfoRepository extends AppInfoRepositoryBase {
  final provider = FirebaseProvider();

  @override
  Future<AppInfo?> getAppInfo() => provider.getVersionApp();

}
