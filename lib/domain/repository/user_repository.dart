import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:charity_app/domain/model/result.dart';

abstract interface class UserRepository {
  Future<Result<User>> signIn(String email, String password);
  Future<Result<User>> signUp(String email, String password, File? profileImage);
  Future<void> signOut();
}