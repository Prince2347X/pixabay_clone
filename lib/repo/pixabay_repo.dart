import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:pixabay_clone/models/image.dart';

class PixabayRepo {
  static const String _apiKey = String.fromEnvironment('PIXABAY_API_KEY');
  static int _currentPage = 1;

  static Future<List<PixabayImage>> loadImages() {
    final url = Uri.parse('https://pixabay.com/api/?key=$_apiKey&page=$_currentPage&per_page=20');
    return http.get(url).then(
      (response) {
        if (response.statusCode == 200) {
          final data = json.decode(response.body);
          _currentPage++;
          return data['hits'].map<PixabayImage>((json) => PixabayImage.fromJson(json)).toList();
        } else {
          throw Exception('Failed to load images');
        }
      },
    );
  }
}
