import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:vanashree_ngo_application/core/extensions/build_context_extensions.dart';

class CircularProfileImage extends StatelessWidget {
  final String imageUrl;
  final double size;
  final IconData errorIcon;

  const CircularProfileImage({
    super.key,
    required this.imageUrl,
    this.size = 80,
    required this.errorIcon
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = context.theme;
    return CachedNetworkImage(
      imageUrl: imageUrl,
      memCacheWidth: size.toInt() * 2,
      memCacheHeight: size.toInt() * 2,
      imageBuilder: (context, imageProvider) {
        return Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: imageProvider,
              fit: BoxFit.cover,
            ),
          ),
        );
      },
      placeholder: (context, url) {
        return Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          child: Container(
            width: size,
            height: size,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
          ),
        );
      },
      errorWidget: (context, url, error) {
        return Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: theme.primaryColor,
          ),
          child: Icon(
            errorIcon,
            color: Colors.white,
            size: size * 0.5,
          ),
        );
      },
    );
  }
}