import 'package:charity_app/domain/model/meme_template.dart';
import 'package:charity_app/domain/model/result.dart';

abstract interface class MemeRepository {
  Future<Result<List<MemeTemplate>>> getMemeTemplates();
}