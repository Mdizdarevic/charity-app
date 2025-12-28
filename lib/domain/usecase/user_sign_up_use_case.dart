import 'dart:io'; // Add this for File
import 'package:firebase_auth/firebase_auth.dart';
import 'package:charity_app/domain/model/result.dart';
import 'package:charity_app/domain/repository/user_repository.dart';

class UserSignUpUseCase {
  final UserRepository repository;

  UserSignUpUseCase(this.repository);

  Future<Result<User>> call(String email, String password, File? profileImage) async {
    return await repository.signUp(email, password, profileImage);
  }
}