import 'dart:convert';
import 'package:fluttertest/data/models/movie_model.dart';
import 'package:fluttertest/data/models/movie_details_model.dart';
import 'package:http/http.dart' as http;
const String _baseUrl = "https://api.themoviedb.org/3";
const String imageBaseUrl = "https://image.tmdb.org/t/p/w500";

class ApiService {

  String apiKey = "9434fd8794234450bf708edf1174f5fb";

  Future<List<MovieModel>> fetchNowPlaying({int page = 1}) async {
    final url =
        "$_baseUrl/movie/now_playing?api_key=$apiKey&language=en-US&page=$page";
    return _fetchMovies(url);
  }

  Future<List<MovieModel>> fetchTrending() async {
    final url = "$_baseUrl/trending/movie/day?api_key=$apiKey";
    return _fetchMovies(url);
  }

  Future<List<MovieModel>> fetchUpcoming({int page = 1}) async {
    final url =
        "$_baseUrl/movie/upcoming?api_key=$apiKey&language=en-US&page=$page";
    return _fetchMovies(url);
  }

  /// FIXED: return MovieDetailModel instead of MovieModel
  Future<MovieDetailModel> fetchMovieDetails(int movieId) async {
    final url = "$_baseUrl/movie/$movieId?api_key=$apiKey&language=en-US";
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return MovieDetailModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception(
          "Failed to fetch movie details. Code: ${response.statusCode}");
    }
  }

  Future<List<MovieModel>> _fetchMovies(String url) async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return (data["results"] as List)
          .map((movie) => MovieModel.fromJson(movie))
          .toList();
    } else {
      throw Exception("Failed to fetch movies. Code: ${response.statusCode}");
    }
  }
}
