import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:movie_test/models/cast.dart';
import 'package:movie_test/models/movie.dart';
import '../components/images/cover_image.dart';
import '../components/images/poster_image.dart';
import '../components/items/cast_item.dart';
import '../components/lists/movie_list.dart';
import '../network/api.dart';

class DetailPage extends StatefulWidget {
  final Movie movie;
  final String tag;
  const DetailPage({Key? key, required this.tag, required this.movie})
      : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {

  List<Cast>? castList;
  List<Movie>? recommendationMovies;

  loadCastList() {
    API().getCasts(widget.movie.id).then((value) {
      setState(() {
        castList = value;
      });
    });
  }

  loadRecommendationMovies() {
    API().getRecommendationMovies(widget.movie.id).then((value) {
      setState(() {
        recommendationMovies = value;
      });
    });
  }

  @override
  void initState() {
    loadCastList();
    loadRecommendationMovies();
    super.initState();
  }

  Widget _coverImage() => SizedBox(
      width: double.infinity,
      height: 260,
      child: CoverImage(imageUrl: API.imageURL400 + widget.movie.backdropPath));

  Widget _castList() => castList == null
      ? const CircularProgressIndicator()
      : SizedBox(
    width: MediaQuery.of(context).size.width,
    height: 120,
    child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: castList!.length,
        itemBuilder: ((context, index) {
          Cast cast = castList![index];
          return CastItem(
            name: cast.name,
            id: cast.id,
            profilePath: cast.profilePath ?? "",
          );
        })),
  );

  Widget _title(String title) => Padding(
    padding: const EdgeInsets.only(bottom: 10),
    child: Text(
      title,
      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
    ),
  );

  Widget _movieHeader() => Row(
    crossAxisAlignment: CrossAxisAlignment.end,
    children: [
      SizedBox(
        width: 130,
        child: Card(
          elevation: 5,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Hero(
              tag: "${widget.tag}${widget.movie.id}",
              child: PosterImage(
                  imageUrl: API.imageURL400 + widget.movie.posterPath)),
        ),
      ),
    ],
  );

  Widget _movieInformation() => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      _movieHeader(),
      const SizedBox(
        height: 20,
      ),
      _title("Overview"),
      Text(widget.movie.overview),
    ],
  );


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text(widget.movie.title),
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Stack(
            children: [
              _coverImage(),
              Container(
                margin: const EdgeInsets.only(top: 180),
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _movieInformation(),
                      const SizedBox(height: 10),
                      _title("Cast"),
                      _castList(),
                      recommendationMovies == null
                          ? const CircularProgressIndicator()
                          : MovieList(
                          title: "Recommendation",
                          movieList: recommendationMovies!),
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
