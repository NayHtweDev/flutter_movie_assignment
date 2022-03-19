import 'package:flutter/material.dart';
import 'package:movie_test/components/lists/movie_list.dart';
import 'package:movie_test/models/movie.dart';
import 'package:movie_test/pages/search_page.dart';

import '../network/api.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Movie>? popularMovies, nowPlayingMovies;
  final API api = API();

  void loadPopularMovies() {
    api.getPopularMovies().then((value) {
      setState(() {
        popularMovies = value;
      });
    });
  }

  void loadNowPlayingMovies() {
    api.getNowPayingMovies().then((value) {
      setState(() {
        nowPlayingMovies = value;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    loadPopularMovies();
    loadNowPlayingMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Movies (Not GetX)"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SearchPage()),
              );
            },
            icon: const Icon(Icons.search),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          popularMovies == null
              ? const CircularProgressIndicator()
              : MovieList(
            title: "Popular",
            movieList: popularMovies!,
          ),
          nowPlayingMovies == null
              ? const CircularProgressIndicator()
              : MovieList(
            title: "Now Playing",
            movieList: nowPlayingMovies!,
          ),
        ]),
      ),
    );
  }
}
