import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:charity_app/di.dart';
import 'package:charity_app/domain/model/result.dart';
import 'package:charity_app/domain/model/sight.dart';
import 'package:charity_app/domain/usecase/get_all_sights_use_case.dart';
import 'package:charity_app/presentation/sights/notifier/state/sight_list_state.dart';

class SightListNotifier extends Notifier<SightListState> {
  late final GetAllSightsUseCase _getAllSightsUseCase;

  @override
  SightListState build() {
    _getAllSightsUseCase = ref.watch(getAllSightsUseCaseProvider);
    getAllSights();
    return const SightListLoading();
  }

  void getAllSights() async {
    state = const SightListLoading();

    final result = await _getAllSightsUseCase();

    switch (result) {
      case Ok<List<Sight>>():
        state = result.value.isEmpty ? const SightListEmpty() : SightListFilled(result.value);
      case Error<List<Sight>>():
        state = SightListError(result.error.toString());
    }
  }
}