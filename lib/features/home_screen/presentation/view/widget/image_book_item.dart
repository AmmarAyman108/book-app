import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageBookItem extends StatelessWidget {
  const ImageBookItem({
    super.key,
    required this.imageUrl,
  });
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: AspectRatio(
        aspectRatio: 2.6 / 4,
        child: CachedNetworkImage(
            placeholder: (context, url) => const Center(
                    child: CircularProgressIndicator(
                  color: Color.fromARGB(255, 168, 7, 216),
                )),
            fit: BoxFit.fill,
            errorWidget: (context, url, error) => const Icon(Icons.error),
            imageUrl: imageUrl),
      ),
    );
  }
}
