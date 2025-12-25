import 'package:charity_app/domain/model/charity.dart';

sealed class CharityListState {
  const CharityListState();
}

class CharityListLoading extends CharityListState {
  const CharityListLoading();
}

class CharityListEmpty extends CharityListState {
  const CharityListEmpty();
}

class CharityListFilled extends CharityListState {
  final List<Charity> charities;

  CharityListFilled(this.charities);
}

class CharityListError extends CharityListState {
  final String message;

  CharityListError(this.message);
}