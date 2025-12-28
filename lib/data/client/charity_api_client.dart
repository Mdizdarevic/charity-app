import 'dart:convert';
import 'package:http/http.dart' as http;

class CharityApiClient {
  final String baseUrl = "https://partners.every.org/v0.2";
  final String apiKey = "pk_live_09c229e1a74a254e9284d26e40ad952d";

  String searchTerm = "charity";

  Future<Map<String, dynamic>> getAllCharities() async {
    try {
      final url = Uri.parse('$baseUrl/search/$searchTerm?apiKey=$apiKey&take=50');

      // LO7: Added .timeout to prevent the app from hanging on slow networks
      final response = await http.get(url).timeout(
        const Duration(seconds: 10),
      );

      // LO7: Checking status code to handle API errors
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception('Server Error: ${response.statusCode}');
      }
    } on http.ClientException {

      // LO7: Specific catch for network/connectivity issues
      throw Exception('No Internet connection.');
    } catch (e) {
        throw Exception('Connection failed. Check your network or API key.');
    }
  }

}