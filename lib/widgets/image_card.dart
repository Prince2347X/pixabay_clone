import 'package:flutter/material.dart';

import 'package:pixabay_clone/core/extensions.dart';
import 'package:pixabay_clone/models/image.dart';

class ImageCard extends StatelessWidget {
  final PixabayImage image;

  const ImageCard({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(image.webformatURL, fit: BoxFit.cover),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Likes: ${image.likes.asFormattedValue}'),
                Text('Views: ${image.views.asFormattedValue}'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
