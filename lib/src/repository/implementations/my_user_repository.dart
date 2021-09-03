
import 'package:desingapp/src/model/user.dart';
import 'package:desingapp/src/provider/firebase_provider.dart';
import 'package:desingapp/src/repository/my_user_repository.dart';

class MyUserRepository extends MyUserRepositoryBase {
  final provider = FirebaseProvider();

  @override
  Future<MyUser?> getMyUser() => provider.getMyUser();

  @override
  Future<void> saveMyUser(MyUser user) => provider.saveMyUser(user);
}
