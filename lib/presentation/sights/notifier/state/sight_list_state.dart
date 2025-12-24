import 'package:charity_app/domain/model/sight.dart';

sealed class SightListState {
  const SightListState();
}

class SightListLoading extends SightListState {
  const SightListLoading();
}

class SightListEmpty extends SightListState {
  const SightListEmpty();
}

class SightListFilled extends SightListState {
  final List<Sight> sights;

  SightListFilled(this.sights);
}

class SightListError extends SightListState {
  final String message;

  SightListError(this.message);
}