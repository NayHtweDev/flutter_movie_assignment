import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ProfileImage extends StatelessWidget {
  final String imageUrl;
  final double errorIconSize;
  const ProfileImage(
      {Key? key, required this.imageUrl, this.errorIconSize = 50})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
        imageBuilder: (context, imageProvider) => Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
              ),
            ),
        imageUrl: imageUrl,
        placeholder: (context, url) => const SizedBox(
            width: double.infinity,
            child: CircleAvatar(
              backgroundImage:
                  AssetImage("assets/img/profile.png"),
            )),
        errorWidget: (context, url, error) => Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.person,
                size: errorIconSize,
              ),
            ));
  }
}
