import 'package:equatable/equatable.dart';

class AuthUser extends Equatable {
  final String uid;
  final String email;

  AuthUser({required this.uid,required this.email});

  @override
  List<Object> get props => [uid,email];
}

abstract class AuthRepositoryBase {
  Stream<AuthUser?> get onAuthStateChanged;
  Future<AuthUser?> signInWithGoogle();
  Future<void> signOut();
}
