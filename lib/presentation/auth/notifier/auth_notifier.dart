import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:charity_app/di.dart';
import 'package:charity_app/domain/model/result.dart'; // Ensure this path is correct!

/// 1. States defined as simple classes to avoid "Undefined" errors
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

/// 2. The Notifier using the modern 2025 Notifier pattern
class AuthNotifier extends Notifier<AuthState> {
  @override
  AuthState build() {
    return const AuthInitial();
  }

  Future<void> signIn(String email, String password) async {
    state = const AuthLoading();

    final result = await ref.read(userSignInUseCaseProvider).call(email, password);

    // Use pattern matching to handle Ok and Error
    // Use pattern matching to handle Ok and Error
    switch (result) {
      case Ok(value: _):
        state = const AuthSuccess();
      case Error(error: final e):
      // 1. Create a variable for your custom message
        String friendlyMessage = "Wrong email password combination.";

        // 3. Update the state with your new message
        state = AuthError(friendlyMessage);
    }
  }

  Future<void> signUp(String email, String password) async {
    state = const AuthLoading();

    final result = await ref.read(userSignUpUseCaseProvider).call(email, password);

    // Use pattern matching here as well
    switch (result) {
      case Ok(value: _):
        state = const AuthSuccess();
      case Error(error: final e):
        state = AuthError(e.toString());
    }
  }
}

/// 3. The Provider that the UI will talk to
final authNotifierProvider = NotifierProvider.autoDispose<AuthNotifier, AuthState>(
  AuthNotifier.new,
);