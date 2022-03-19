import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CoverImage extends StatelessWidget {
  final String imageUrl;
  const CoverImage({Key? key, required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      fit: BoxFit.cover,
      imageUrl: imageUrl,
      imageBuilder: (context, imageProvider) => Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.3), BlendMode.multiply),
                  image: imageProvider,
                  fit: BoxFit.cover))),
      placeholder: (context, url) =>
          const Center(child: CircularProgressIndicator()),
      errorWidget: (context, url, error) => const Icon(
        Icons.error_outline,
        size: 50,
      ),
    );
  }
}
