import 'package:firebase_auth/firebase_auth.dart';
import 'package:charity_app/data/client/firebase_auth_client.dart';
import 'package:charity_app/domain/model/result.dart';
import 'package:charity_app/domain/repository/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final FirebaseAuthClient firebaseClient;

  UserRepositoryImpl(this.firebaseClient);

  @override
  Future<Result<User>> signIn(String email, String password) async {
    try {
      final userCredential = await firebaseClient.signIn(email, password);
      return Result.ok(userCredential.user!);
    } on FirebaseAuthException catch (e) {
      return Result.error(Exception(e.message ?? "Sign in failed"));
    }
  }

  @override
  Future<Result<User>> signUp(String email, String password) async {
    try {
      final userCredential = await firebaseClient.signUp(email, password);
      return Result.ok(userCredential.user!);
    } on FirebaseAuthException catch (e) {
      return Result.error(Exception(e.message ?? "Registration failed"));
    }
  }

  @override
  Future<void> signOut() => firebaseClient.signOut();
}