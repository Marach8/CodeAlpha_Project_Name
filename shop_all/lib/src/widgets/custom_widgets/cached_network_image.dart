import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shop_all/src/widgets/custom_widgets/shimmer.dart';

class CustomCachedNetworkImage extends StatelessWidget {
  final String imageUrl;

  const CustomCachedNetworkImage({
    super.key,
    required this.imageUrl
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      fit: BoxFit.cover, 
      width: double.infinity,
      progressIndicatorBuilder: (_, __, ___) => const CustomShimmerWidget(),
      errorWidget: (_, __, ___) => const Icon(Icons.error),
    );
  }
}