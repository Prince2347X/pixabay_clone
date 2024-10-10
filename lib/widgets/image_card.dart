import 'package:flutter/material.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:shimmer/shimmer.dart';

import 'package:pixabay_clone/core/extensions.dart';
import 'package:pixabay_clone/models/image.dart';
import 'package:pixabay_clone/screens/image_view.dart';

class ImageCard extends StatelessWidget {
  final PixabayImage image;

  const ImageCard({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ImageViewScreen(image: image),
          ),
        );
      },
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CachedNetworkImage(
              imageUrl: image.webformatURL,
              fit: BoxFit.cover,
              progressIndicatorBuilder: (context, url, downloadProgress) => Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey,
                period: const Duration(milliseconds: 500),
                child: Container(
                  color: Colors.grey[300],
                  height: 120,
                ),
              ),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.favorite, color: Colors.redAccent, size: 18),
                      const SizedBox(width: 4),
                      Text(image.likes.asFormattedValue),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.remove_red_eye, color: Colors.blueAccent, size: 18),
                      const SizedBox(width: 4),
                      Text(image.views.asFormattedValue),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
