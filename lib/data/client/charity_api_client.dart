import 'dart:convert';
import 'package:http/http.dart' as http;

class CharityApiClient {
  final String baseUrl = "https://partners.every.org/v0.2";
  final String apiKey = "pk_live_09c229e1a74a254e9284d26e40ad952d";

  String searchTerm = "charity";

  void setSearchTerm(String term) {
    searchTerm = term;
  }

  Future<Map<String, dynamic>> getAllCharities() async {
    try {
      final url = Uri.parse('$baseUrl/search/$searchTerm?apiKey=$apiKey&take=50');
      final response = await http.get(url);
      return json.decode(response.body);
    } catch (e) {
        print('PHYSICAL NETWORK ERROR: $e');
        throw Exception('Connection failed. Are you on Web/Chrome?');
    }
  }

}