import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:movie_test/network/api.dart';



class BlurBackground extends StatelessWidget {
  final String backgroundPath;
  const BlurBackground({Key? key, required this.backgroundPath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: NetworkImage(API.imageURL400 + backgroundPath),
            fit: BoxFit.cover),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
        child: Container(
          decoration: BoxDecoration(color: Colors.black.withOpacity(0.5)),
        ),
      ),
    );
  }
}
