import 'package:charity_app/data/client/http_client.dart';
import 'package:charity_app/data/repository/meme_repository_impl.dart';
import 'package:charity_app/domain/repository/meme_repository.dart';
import 'package:charity_app/domain/use_case/get_meme_templates_use_case.dart';
import 'package:charity_app/presentation/meme_list/notifier/meme_template_list_notifier.dart';
import 'package:charity_app/presentation/meme_list/notifier/state/meme_template_list_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final httpClientProvider = Provider<HttpClient>((ref) => HttpClient());

final memeRepositoryProvider = Provider<MemeRepository>(
    (ref) => MemeRepositoryImpl(ref.watch(httpClientProvider)),
);

final getMemeTemplateUseCaseProvider = Provider<GetMemeTemplatesUseCase>(
    (ref) => GetMemeTemplatesUseCase(ref.watch(memeRepositoryProvider)),
);

final memeTemplateListStateNotifier = NotifierProvider<MemeTemplateListNotifier, MemeTemplateListState> (
    () => MemeTemplateListNotifier(),
);