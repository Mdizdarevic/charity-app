import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:charity_app/di.dart';
import 'package:charity_app/domain/model/result.dart';
import 'package:charity_app/domain/usecase/user_sign_in_use_case.dart';
import 'package:charity_app/presentation/auth/notifier/state/authentication_state.dart';

class AuthenticationNotifier extends Notifier<AuthenticationState>{
  late UserSignInUseCase _signInUseCase;

  @override
  build() {
    _signInUseCase = ref.watch(userSignInUseCaseProvider);
    return EmptyState();
  }

  void signIn(final String email, final String password) async {
    state = LoadingState();
    print("LOADING STATE !!!");

    await Future.delayed(const Duration(seconds: 2));

    final result = await _signInUseCase(email, password);

    switch (result) {
      case Ok<User>():
        state = AuthenticatedState(result.value);
        print("SUCCESS STATE !!!");
      case Error():
        print("ERROR: ${result.error.toString()}");
        state = ErrorState(result.error.toString());
    }
  }
}