import 'package:flutter/material.dart';
import 'package:movie_test/models/movie.dart';


import '../components/items/movie_item.dart';
import '../network/api.dart';

class SearchPage extends StatefulWidget {
  SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<Movie>? movieList;
  bool isSearching = false;
  bool didSearched = false;
  API api = API();

  searchMovie(query) {
    setState(() {
      isSearching = true;
      didSearched = true;
    });
    api.getSearchMovies(query).then((value) {
      setState(() {
        movieList = value;
        isSearching = false;
      });
    });
  }

  Widget _movieSearchList() => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: const Text("Movies")),
      Container(
        padding: const EdgeInsets.all(5.0),
        child: GridView.builder(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 5,
              crossAxisSpacing: 5,
              childAspectRatio: 0.48,
            ),
            itemCount: movieList!.length,
            itemBuilder: (_, index) {
              Movie movie = movieList![index];
              return MovieItem(tag: "search", movie: movie);
            }),
      ),
    ],
  );


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: TextField(
              style: const TextStyle(color: Colors.white),
              textInputAction: TextInputAction.search,
              decoration: const InputDecoration(
                hintStyle: TextStyle(color: Colors.white),
                hintText: "Search",
              ),
              onSubmitted: (value) {
                searchMovie(value);
              },
            )),
        body: SingleChildScrollView(
          child: !didSearched
              ? const SizedBox(
              height: 50, child: Center(child: Text("Search movies")))
              : Column(
            children: [
              movieList == null
                  ? isSearching
                  ? const Center(child: CircularProgressIndicator())
                  : Container()
                  : _movieSearchList(),
            ],
          ),
        ));
  }
}
