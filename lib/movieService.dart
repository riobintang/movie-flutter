import 'package:http/http.dart' as http;
import 'dart:convert';
import 'services/BaseNetwork.dart';

class MovieService {


  static Future<List<dynamic>> getTopMovies() async {
    final url = Uri.parse('$BASE_URL/movie/top_rated?api_key=$API_KEY');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final results = jsonData['results'];
      return results;
    } else {
      throw Exception('Failed to load top movies');
    }
  }

  static Future<List<dynamic>> getAllMovies() async {
    final url = Uri.parse('$BASE_URL/discover/movie?api_key=$API_KEY');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final results = jsonData['results'];
      return results;
    } else {
      throw Exception('Failed to load recent movies');
    }
  }

  static Future<List<dynamic>> searchMovies(String query) async {
    final url =
        Uri.parse('$BASE_URL/search/movie?api_key=$API_KEY&query=$query');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final results = jsonData['results'];
      return results;
    } else {
      throw Exception('Failed to search movies');
    }
  }
}