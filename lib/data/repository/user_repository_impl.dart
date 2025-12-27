import 'dart:io'; // Added for File
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart'; // Added for Storage
import 'package:cloud_firestore/cloud_firestore.dart'; // Added for Firestore
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
  // Added File? profileImage parameter
  Future<Result<User>> signUp(String email, String password, File? profileImage) async {
    try {
      final userCredential = await firebaseClient.signUp(email, password);
      final user = userCredential.user!;

      // --- NEW LOGIC FOR PHOTO UPLOAD (LO1 & LO6) ---
      if (profileImage != null) {
        // 1. Upload to Storage
        final storageRef = FirebaseStorage.instance
            .ref()
            .child('user_photos')
            .child('${user.uid}.jpg');
        await storageRef.putFile(profileImage);

        // 2. Get the URL
        final downloadUrl = await storageRef.getDownloadURL();

        // 3. Save to Firestore so the Profile Screen can find it later
        await FirebaseFirestore.instance.collection('users').doc(user.uid).set({
          'email': email,
          'photoUrl': downloadUrl,
        });
      }
      // ----------------------------------------------

      return Result.ok(user);
    } on FirebaseAuthException catch (e) {
      return Result.error(Exception(e.message ?? "Registration failed"));
    } catch (e) {
      // Catch generic errors (like storage/firestore failures)
      return Result.error(Exception("Profile created, but photo failed: $e"));
    }
  }

  @override
  Future<void> signOut() => firebaseClient.signOut();
}