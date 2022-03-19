
import 'package:get/get.dart';
import 'package:movie_test/models/movie.dart';

import '../network/api.dart';


class HomeController extends GetxController {
  RxList<Movie> popularMovies = <Movie>[].obs;
  RxList<Movie> nowPlayingMovies = <Movie>[].obs;

  loadPopular() {
    API().getPopularMovies().then((value) {
      popularMovies.value = value;
    });
  }

  loadNowPlaying() {
    API().getNowPayingMovies().then((value) {
      nowPlayingMovies.value = value;
    });
  }

}