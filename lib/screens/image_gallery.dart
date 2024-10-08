import 'package:flutter/material.dart';

import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'package:pixabay_clone/core/utils.dart';
import 'package:pixabay_clone/models/image.dart';
import 'package:pixabay_clone/repo/pixabay_repo.dart';
import 'package:pixabay_clone/widgets/image_card.dart';

class ImageGallery extends StatefulWidget {
  const ImageGallery({super.key});

  @override
  ImageGalleryState createState() => ImageGalleryState();
}

class ImageGalleryState extends State<ImageGallery> {
  final List<PixabayImage> _images = [];
  bool _isLoading = false;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _loadImages();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (_scrollController.offset >=
            _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange) {
      _loadImages();
    }
  }

  Future<void> _loadImages() async {
    if (_isLoading) return;

    setState(() {
      _isLoading = true;
    });

    final loadedImages = await PixabayRepo.loadImages();
    setState(() {
      _images.addAll(loadedImages);
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Gallery'),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return MasonryGridView.count(
            crossAxisCount:
                Utilities.calculateCrossAxisCount(constraints.maxWidth),
            controller: _scrollController,
            itemCount: _images.length + 1,
            itemBuilder: (context, index) {
              if (index < _images.length) {
                final image = _images[index];
                return ImageCard(image: image);
              } else {
                return _isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : const SizedBox.shrink();
              }
            },
          );
        },
      ),
    );
  }
}
