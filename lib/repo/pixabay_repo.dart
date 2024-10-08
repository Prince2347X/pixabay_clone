import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:pixabay_clone/models/image.dart';

class PixabayRepo {
  /// The API key for the Pixabay API. Will be defined by --dart-define
  static const String _apiKey = String.fromEnvironment('PIXABAY_API_KEY');

  /// The current page number for the API. Will be incremented after each call
  static int _currentPage = 1;

  /// Load images from the Pixabay API. Pagination is handled internally.
  static Future<List<PixabayImage>> loadImages() {
    final url = Uri.parse(
        'https://pixabay.com/api/?key=$_apiKey&page=$_currentPage&per_page=20');
    return http.get(url).then(
      (response) {
        if (response.statusCode == 200) {
          final data = json.decode(response.body);
          _currentPage++;
          return data['hits']
              .map<PixabayImage>((json) => PixabayImage.fromJson(json))
              .toList();
        } else {
          throw Exception('Failed to load images');
        }
      },
    );
  }
}
