import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:charity_app/di.dart';
import 'package:charity_app/domain/model/result.dart';

sealed class AuthState {
  const AuthState();
}

class AuthInitial extends AuthState {
  const AuthInitial();
}

class AuthLoading extends AuthState {
  const AuthLoading();
}

class AuthSuccess extends AuthState {
  const AuthSuccess();
}

class AuthError extends AuthState {
  final String message;
  const AuthError(this.message);
}

class AuthNotifier extends Notifier<AuthState> {
  @override
  AuthState build() {
    return const AuthInitial();
  }

  Future<void> signIn(String email, String password) async {
    state = const AuthLoading();

    final result = await ref.read(userSignInUseCaseProvider).call(email, password);

    switch (result) {
      case Ok(value: _):
        state = const AuthSuccess();
      case Error(error: final e):
        String friendlyMessage = "Wrong email password combination.";
        state = AuthError(friendlyMessage);
    }
  }

  Future<void> signUp(String email, String password, File? image) async {
    state = const AuthLoading();

    final result = await ref.read(userSignUpUseCaseProvider).call(email, password, image);

    switch (result) {
      case Ok(value: _):
        state = const AuthSuccess();
      case Error(error: final e):
        state = AuthError(e.toString());
    }
  }
}

final authNotifierProvider = NotifierProvider.autoDispose<AuthNotifier, AuthState>(
  AuthNotifier.new,
);