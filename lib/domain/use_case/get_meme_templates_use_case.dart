import 'package:charity_app/domain/model/meme_template.dart';
import 'package:charity_app/domain/model/result.dart';
import 'package:charity_app/domain/repository/meme_repository.dart';


class GetMemeTemplatesUseCase {
  final MemeRepository memeRepository;

  GetMemeTemplatesUseCase(this.memeRepository);

  Future<Result<List<MemeTemplate>>> call() => memeRepository.getMemeTemplates();
}