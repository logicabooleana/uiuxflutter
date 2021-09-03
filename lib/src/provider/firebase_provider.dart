
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:desingapp/src/model/user.dart';
import 'package:desingapp/src/model/app_info.dart';

class FirebaseProvider {
  User get currentUser {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) throw Exception('Not authenticated exception');
    return user;
  }

  FirebaseFirestore get firestore => FirebaseFirestore.instance;

  FirebaseStorage get storage => FirebaseStorage.instance;

  Future<MyUser?> getMyUser() async {
    final snapshot = await firestore.doc('user/${currentUser.uid}').get();
    if (snapshot.exists) return MyUser.fromFirebaseMap(snapshot.data()!);
    return null;
  }
  Future<AppInfo?> getVersionApp() async {
    final snapshot = await firestore.doc('APP/info').get();
    if (snapshot.exists) return AppInfo.fromFirebaseMap(snapshot.data()!);
    return null;
  }

  Future<void> saveMyUser(MyUser user) async {
    final ref = firestore.doc('user/${currentUser.uid}');
    await ref.set(user.toFirebaseMap(), SetOptions(merge: true));
  }
}
