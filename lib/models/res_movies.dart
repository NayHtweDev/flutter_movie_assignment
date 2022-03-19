import 'dart:convert';

import 'movie.dart';



class ResponseMovies {
  ResponseMovies({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  int page;
  List<Movie> results;
  int totalPages;
  int totalResults;

  factory ResponseMovies.fromRawJson(String str) =>
      ResponseMovies.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ResponseMovies.fromJson(Map<String, dynamic> json) => ResponseMovies(
        page: json["page"],
        results:
            List<Movie>.from(json["results"].map((x) => Movie.fromJson(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
      );

  Map<String, dynamic> toJson() => {
        "page": page,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
        "total_pages": totalPages,
        "total_results": totalResults,
      };
}
