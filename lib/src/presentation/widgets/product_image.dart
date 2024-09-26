import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ProductImage extends StatelessWidget {
  const ProductImage({
    required this.height,
    super.key,
    required this.url,
    required this.tag,
    required this.width,
  });

  final double height;
  final double width;
  final int tag;
  final String url;

  @override
  Widget build(BuildContext context) => Hero(
        tag: tag,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30.0),
          child: ColoredBox(
            color: Colors.white,
            child: CachedNetworkImage(
              errorWidget: (context, url, error) => const Icon(Icons.error),
              height: height,
              imageUrl: url,
              placeholder: (context, url) => const CircularProgressIndicator(),
              width: width,
            ),
          ),
        ),
      );
}
