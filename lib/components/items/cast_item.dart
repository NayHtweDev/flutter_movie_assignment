import 'package:flutter/material.dart';
import '../../network/api.dart';
import '../images/profile_image.dart';

class CastItem extends StatelessWidget {
  final String name, profilePath;
  final int id;
  const CastItem({
    Key? key,
    required this.name,
    required this.profilePath,
    required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: SizedBox(
        width: 100,
        height: 100,
        child: Column(
          children: [
            SizedBox(
                width: 70,
                height: 70,
                child: ProfileImage(imageUrl: (API.imageURL400 + profilePath))),
            const SizedBox(
              height: 5,
            ),
            Text(
              name,
              textAlign: TextAlign.center,
              maxLines: 2,
              style: const TextStyle(fontSize: 12),
            )
          ],
        ),
      ),
    );
  }
}
