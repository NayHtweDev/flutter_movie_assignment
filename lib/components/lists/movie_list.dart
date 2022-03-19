import 'package:flutter/material.dart';
import 'package:movie_test/components/items/movie_item.dart';
import 'package:movie_test/models/movie.dart';

class MovieList extends StatefulWidget {
  final List<Movie> movieList;
  final String title;
  final double height;
  final double width;
  const MovieList(
      {Key? key,
        required this.title,
        required this.movieList,
        this.height = 255,
        this.width = 130})
      : super(key: key);

  @override
  State<MovieList> createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 14, bottom: 6, left: 8),
          child: Text(
            widget.title,
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: widget.height,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: widget.movieList.length,
              itemBuilder: ((context, index) {
                Movie movie = widget.movieList[index];
                return MovieItem(
                  tag: widget.title,
                  movie: movie,
                  width: widget.width,
                );
              })),
        )
      ],
    );
  }
}
