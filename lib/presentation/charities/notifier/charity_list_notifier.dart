import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:charity_app/di.dart';
import 'package:charity_app/domain/model/result.dart';
import 'package:charity_app/domain/model/charity.dart';
import 'package:charity_app/domain/usecase/get_all_charities_use_case.dart';
import 'package:charity_app/presentation/charities/notifier/state/charity_list_state.dart';

class CharityListNotifier extends Notifier<CharityListState> {
  late final GetAllCharitiesUseCase _getAllCharitiesUseCase;

  @override
  CharityListState build() {
    _getAllCharitiesUseCase = ref.watch(getAllCharitiesUseCaseProvider);
    getAllCharities();
    return const CharityListLoading();
  }

  void getAllCharities() async {
    state = const CharityListLoading();

    final result = await _getAllCharitiesUseCase();

    switch (result) {
      case Ok<List<Charity>>():
        state = result.value.isEmpty ? const CharityListEmpty() : CharityListFilled(result.value);
      case Error<List<Charity>>():
        state = CharityListError(result.error.toString());
    }
  }
}