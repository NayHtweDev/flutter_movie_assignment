import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_test/components/lists/movie_list.dart';
import 'package:movie_test/models/movie.dart';
import 'package:movie_test/pages/search_page.dart';

import '../controllers/home_controller.dart';
import '../network/api.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final HomeController c = Get.put(HomeController());

  @override
  void initState() {
    super.initState();
    c.loadPopular();
    c.loadNowPlaying();
  }

  Widget _popularList() => c.popularMovies.isEmpty
      ? const CircularProgressIndicator()
      : MovieList(
    title: "Popular",
    movieList: c.popularMovies,
  );

  Widget _nowPlayingList() => c.nowPlayingMovies.isEmpty
      ? const CircularProgressIndicator()
      : MovieList(
    title: "Now Playing",
    movieList: c.nowPlayingMovies,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Movies (GetX)"),
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
      body: Obx(() {
        return Column(children: [
            _popularList(),
            _nowPlayingList()
          ]);
      })
    );
  }
}
