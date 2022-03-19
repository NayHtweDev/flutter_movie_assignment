import 'package:http/http.dart' as http;
import 'package:movie_test/models/movie.dart';

import '../models/cast.dart';
import '../models/res_casts.dart';
import '../models/res_movies.dart';


class API {
  static const String imageURL200 = "https://image.tmdb.org/t/p/w200";
  static const String imageURL400 = "https://image.tmdb.org/t/p/w400";

  final String _baseURL = "https://api.themoviedb.org/3";
  final String _apiKey = "a92f28e11a27e8e5938a2020be68ba9c"; // Saya API Key

  Future<http.Response> _doGet(String path, {String param = ""}) async {
    return http.get(Uri.parse("$_baseURL$path?api_key=$_apiKey&$param"));
  }

  Future<List<Movie>> _getMovieList(String path, {String param = ""}) async {
    final response = await _doGet(path, param: param);
    if (response.statusCode == 200) {
      var res = ResponseMovies.fromRawJson(response.body);
      return res.results;
    }
    throw Exception("Faild to load movies");
  }

  Future<List<Movie>> getPopularMovies() {
    return _getMovieList("/movie/popular");
  }

  Future<List<Movie>> getNowPayingMovies() {
    return _getMovieList("/movie/now_playing");
  }

  Future<List<Movie>> getSearchMovies(String query) {
    return _getMovieList("/search/movie", param: "query=$query");
  }


  Future<List<Cast>> getCasts(int id) async {
    final response = await _doGet("/movie/$id/credits");
    if (response.statusCode == 200) {
      var res = ResponseCredits.fromRawJson(response.body);
      return res.cast;
    }
    throw Exception("Faild to load cast");
  }

  Future<List<Movie>> getRecommendationMovies(int id) {
    return _getMovieList("/movie/$id/recommendations");
  }

}
