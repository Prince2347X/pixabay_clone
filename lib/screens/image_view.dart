import 'package:flutter/material.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:shimmer/shimmer.dart';

import 'package:pixabay_clone/core/extensions.dart';
import 'package:pixabay_clone/models/image.dart';

class ImageViewScreen extends StatelessWidget {
  const ImageViewScreen({super.key, required this.image});

  final PixabayImage image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Full screen image view'),
        actions: [
          const Icon(Icons.favorite, color: Colors.redAccent, size: 18),
          const SizedBox(width: 4),
          Text(image.likes.asFormattedValue),
          const SizedBox(width: 12),
          const Icon(Icons.remove_red_eye, color: Colors.blueAccent, size: 18),
          const SizedBox(width: 4),
          Text(image.views.asFormattedValue),
          const SizedBox(width: 24)
        ],
      ),
      body: CachedNetworkImage(
        height: double.infinity,
        width: double.infinity,
        imageUrl: image.webformatURL,
        fit: BoxFit.contain,
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
    );
  }
}
