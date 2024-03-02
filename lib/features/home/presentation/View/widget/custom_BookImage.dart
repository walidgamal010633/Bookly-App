import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class custom_BookImage extends StatelessWidget {
  const custom_BookImage({super.key, required this.urlimage});
  final String urlimage;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: AspectRatio(
        aspectRatio: 2.6 / 4,
        child: CachedNetworkImage(
          errorWidget: (context, url, error) => const Icon(Icons.error),
          imageUrl: urlimage,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
