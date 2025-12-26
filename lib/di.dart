import 'package:firebase_auth/firebase_auth.dart'; // FIXES 'User' error
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:charity_app/data/client/firebase_auth_client.dart';
import 'package:charity_app/data/client/charity_api_client.dart';
import 'package:charity_app/data/repository/charity_repository_impl.dart';
import 'package:charity_app/data/repository/user_repository_impl.dart';
import 'package:charity_app/domain/repository/charity_repository.dart';
import 'package:charity_app/domain/repository/user_repository.dart';
import 'package:charity_app/domain/usecase/get_all_charities_use_case.dart';
import 'package:charity_app/domain/usecase/user_sign_in_use_case.dart';
import 'package:charity_app/domain/usecase/user_sign_up_use_case.dart';
// Note: Ensure these paths match your actual notifier filenames
import 'package:charity_app/presentation/auth/notifier/auth_notifier.dart';

// *************** CLIENT *************** //
final firebaseAuthClientProvider = Provider<FirebaseAuthClient>((_) => FirebaseAuthClient());
final charityApiClientProvider = Provider<CharityApiClient>((_) => CharityApiClient());

// *************** REPOSITORY *************** //
final userRepositoryProvider = Provider<UserRepository>(
      (ref) => UserRepositoryImpl(ref.watch(firebaseAuthClientProvider)),
);

final charityRepositoryProvider = Provider<CharityRepository>((ref) {
  final apiClient = ref.watch(charityApiClientProvider);
  return CharityRepositoryImpl(apiClient);
});

// *************** USE CASE *************** //
final userSignInUseCaseProvider = Provider<UserSignInUseCase>(
      (ref) => UserSignInUseCase(ref.watch(userRepositoryProvider)),
);

final userSignUpUseCaseProvider = Provider<UserSignUpUseCase>(
      (ref) => UserSignUpUseCase(ref.watch(userRepositoryProvider)),
);

final getAllCharitiesUseCaseProvider = Provider<GetAllCharitiesUseCase>(
      (ref) => GetAllCharitiesUseCase(ref.watch(charityRepositoryProvider)),
);

// *************** AUTH STATE *************** //
// This allows ProfileScreen to listen to the login status
final authStateProvider = StreamProvider<User?>((ref) {
  return ref.watch(firebaseAuthClientProvider).authStateChanges;
});