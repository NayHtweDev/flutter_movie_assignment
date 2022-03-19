// To parse this JSON data, do
//
//     final responseCredits = responseCreditsFromJson(jsonString);

import 'dart:convert';

import 'package:movie_test/models/cast.dart';


class ResponseCredits {
  ResponseCredits({
    required this.id,
    required this.cast
  });

  int id;
  List<Cast> cast;

  factory ResponseCredits.fromRawJson(String str) =>
      ResponseCredits.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ResponseCredits.fromJson(Map<String, dynamic> json) =>
      ResponseCredits(
        id: json["id"],
        cast: List<Cast>.from(json["cast"].map((x) => Cast.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "cast": List<dynamic>.from(cast.map((x) => x.toJson())),
      };
}
