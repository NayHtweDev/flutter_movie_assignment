import 'package:flutter/material.dart';
import 'package:movie_test/pages/detail_page.dart';

import '../../models/movie.dart';
import '../../network/api.dart';
import '../images/poster_image.dart';


class MovieItem extends StatelessWidget {
  final Movie movie;
  final String tag;
  final double width;
  const MovieItem(
      {Key? key, required this.tag, required this.movie, this.width = 130})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailPage(tag: tag, movie: movie),
          ),
        );
      },
      child: SizedBox(
        width: width,
        child: Card(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Column(
            children: [
              SizedBox(
                child: Hero(
                    tag: "$tag${movie.id}",
                    child: PosterImage(
                        imageUrl: API.imageURL400 + movie.posterPath)),
              ),
              const SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 3),
                child: Text(
                  movie.title,
                  textAlign: TextAlign.center,
                  maxLines: 3,
                  style: const TextStyle(fontWeight: FontWeight.w500),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
