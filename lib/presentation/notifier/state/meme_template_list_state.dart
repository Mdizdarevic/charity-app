import 'package:charity_app/domain/model/meme_template.dart';

sealed class MemeTemplateListState {}

class LoadingState extends MemeTemplateListState {}

class EmptyState extends MemeTemplateListState {}

class SuccessState extends MemeTemplateListState {
  final List<MemeTemplate> result;

  SuccessState(this.result);
}

class ErrorState extends MemeTemplateListState {
  final Exception error;

  ErrorState(this.error);
}