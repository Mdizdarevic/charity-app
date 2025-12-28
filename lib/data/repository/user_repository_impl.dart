import 'dart:io'; // Added for File
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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
  Future<Result<User>> signUp(String email, String password, File? profileImage) async {
    try {
      final userCredential = await firebaseClient.signUp(email, password);
      final user = userCredential.user!;

      if (profileImage != null) {
        final storageRef = FirebaseStorage.instance
            .ref()
            .child('user_photos')
            .child('${user.uid}.jpg');
        await storageRef.putFile(profileImage);

        final downloadUrl = await storageRef.getDownloadURL();

        await FirebaseFirestore.instance.collection('users').doc(user.uid).set({
          'email': email,
          'photoUrl': downloadUrl,
        });
      }

      return Result.ok(user);
    } on FirebaseAuthException catch (e) {
      return Result.error(Exception(e.message ?? "Registration failed"));
    } catch (e) {
      return Result.error(Exception("Profile created, but photo failed: $e"));
    }
  }

  @override
  Future<void> signOut() => firebaseClient.signOut();
}