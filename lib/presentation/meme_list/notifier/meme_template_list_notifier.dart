import 'package:charity_app/core/di.dart';
import 'package:charity_app/domain/model/meme_template.dart';
import 'package:charity_app/domain/model/result.dart';
import 'package:charity_app/domain/use_case/get_meme_templates_use_case.dart';
import 'package:charity_app/presentation/meme_list/notifier/state/meme_template_list_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MemeTemplateListNotifier extends Notifier<MemeTemplateListState>{

  late final GetMemeTemplatesUseCase getMemeTemplatesUseCase;

  MemeTemplateListNotifier();

  @override
  MemeTemplateListState build() {
    getMemeTemplatesUseCase = ref.watch(getMemeTemplateUseCaseProvider);
    getTemplateList();
    return LoadingState();
  }

  void getTemplateList() async {

    state = LoadingState();

    final result = await getMemeTemplatesUseCase();

    switch (result) {
      case Ok<List<MemeTemplate>>():
        state = result.value.isEmpty ? EmptyState() : SuccessState(result.value);
      case Error<List<MemeTemplate>>():
        state = ErrorState(result.error);
    }
  }
}
