import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomListViewCategoryItem extends StatelessWidget {
  const CustomListViewCategoryItem({super.key, required this.image});
  final String image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
        ),
        child: CachedNetworkImage(
          fit: BoxFit.fill,
          imageUrl:image,
          errorWidget: (context, url, error) => const Icon(
            Icons.error,
          ),
        ),
      ),
    );
  }
}
