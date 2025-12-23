import 'dart:convert';

import 'package:charity_app/domain/model/meme_template.dart';
import 'package:http/http.dart' as http;

class HttpClient {
  Future<List<MemeTemplate>> getMemeTemplates() async {
    final response = await http.get(Uri.parse('https://api.imgflip.com/get_memes'));

    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;
      final listOfMemes = jsonResponse['data']['memes'] as List<dynamic>;

      return listOfMemes.map((jsonMeme) => MemeTemplate.fromJson(jsonMeme)).toList();
    }
    throw Exception("There was an error wth GET request");
  }
}
