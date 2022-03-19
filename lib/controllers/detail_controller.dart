
import 'package:get/get.dart';
import 'package:movie_test/models/cast.dart';
import 'package:movie_test/models/movie.dart';

import '../network/api.dart';


class DetailController extends GetxController {
  RxList<Cast> castList = <Cast>[].obs;
  RxList<Movie> recommendationMovies = <Movie>[].obs;

  loadCastList(int id) {
    API().getCasts(id).then((value) {
      castList.value = value;
    });
  }

  loadRecommendationMovies(int id) {
    API().getRecommendationMovies(id).then((value) {
      recommendationMovies.value = value;
    });
  }

}