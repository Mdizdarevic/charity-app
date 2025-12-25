import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:charity_app/data/client/firebase_auth_client.dart';
import 'package:charity_app/data/client/charity_api_client.dart';
import 'package:charity_app/data/repository/charity_repository_impl.dart';
import 'package:charity_app/data/repository/user_repository_impl.dart';
import 'package:charity_app/domain/repository/charity_repository.dart';
import 'package:charity_app/domain/repository/user_repository.dart';
import 'package:charity_app/domain/usecase/get_all_charities_use_case.dart';
import 'package:charity_app/domain/usecase/user_sign_in_use_case.dart';
import 'package:charity_app/presentation/auth/notifier/authentication_notifier.dart';
import 'package:charity_app/presentation/auth/notifier/state/authentication_state.dart';
import 'package:charity_app/presentation/charities/notifier/charity_list_notifier.dart';
import 'package:charity_app/presentation/charities/notifier/state/charity_list_state.dart';

// *************** CLIENT *************** //
final firebaseAuthClientProvider = Provider<FirebaseAuthClient>((_) => FirebaseAuthClient());

// *************** REPOSITORY *************** //
final userRepositoryProvider = Provider<UserRepository>(
      (ref) => UserRepositoryImpl(ref.watch(firebaseAuthClientProvider)),
);

final charityApiClientProvider = Provider<CharityApiClient>((ref) {
  return CharityApiClient();
});

final charityRepositoryProvider = Provider<CharityRepository>((ref) {
  final apiClient = ref.watch(charityApiClientProvider);
  return CharityRepositoryImpl(apiClient);
});

// *************** USE CASE *************** //
final userSignInUseCaseProvider = Provider<UserSignInUseCase>(
      (ref) => UserSignInUseCase(ref.watch(userRepositoryProvider)),
);

final getAllCharitiesUseCaseProvider = Provider<GetAllCharitiesUseCase>(
      (ref) => GetAllCharitiesUseCase(ref.watch(charityRepositoryProvider)),
);

// *************** NOTIFIER *************** //
final authenticationNotifierProvider = NotifierProvider<AuthenticationNotifier, AuthenticationState>(
      () => AuthenticationNotifier(),
);

final charityListNotifierProvider = NotifierProvider<CharityListNotifier, CharityListState>(
      () => CharityListNotifier(),
);