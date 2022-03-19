import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:movie_test/network/api.dart';

class PosterImage extends StatelessWidget {
  final String imageUrl;
  const PosterImage({Key? key, required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      fit: BoxFit.cover,
      imageUrl: API.imageURL400 + (imageUrl),
      placeholder: (context, url) => const SizedBox(
        width: double.infinity,
        child: Image(
          image: AssetImage("assets/img/movie.png"),
        ),
      ),
      errorWidget: (context, url, error) => const SizedBox(
        width: double.infinity,
        child: Image(
          image: AssetImage("assets/img/error.png"),
        ),
      ),
    );
  }
}
