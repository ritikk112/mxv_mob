import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mxv_mob/views/movies_det.dart';

// Fetch movie data from API
Future<List<Movie>> fetchMovies() async {
  final response =
      await http.get(Uri.parse('http://localhost:3001/api/movie/recommend'));

  if (response.statusCode == 200) {
    final List<dynamic> jsonList = json.decode(response.body);
    return jsonList.map((json) => Movie.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load movies');
  }
}
