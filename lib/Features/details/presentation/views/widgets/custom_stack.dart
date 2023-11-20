import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../home/presentation/views/widget/custom_app_bar.dart';

class CustomStack extends StatelessWidget {
  const CustomStack({super.key, required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        Center(
          child: CachedNetworkImage(
            width: width * .8,
            height: height * .5,
            imageUrl: image,
            fit: BoxFit.fill,
          ),
        ),
        const CustomAppBar(),
      ],
    );
  }
}
