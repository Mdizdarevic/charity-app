import 'dart:io';

import 'package:charity_app/data/client/http_client.dart';
import 'package:charity_app/domain/model/meme_template.dart';
import 'package:charity_app/domain/model/result.dart';
import 'package:charity_app/domain/repository/meme_repository.dart';

class MemeRepositoryImpl implements MemeRepository {
  final HttpClient httpClient;

  MemeRepositoryImpl(this.httpClient);


  @override
  Future<Result<List<MemeTemplate>>> getMemeTemplates() async {
    try {
      final result = await httpClient.getMemeTemplates();
      return Result.ok(result);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }
}