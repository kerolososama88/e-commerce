import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../../../core/constant/text_style.dart';

class ListSearchItems extends StatelessWidget {
  const ListSearchItems({
    super.key,
    required this.image,
    required this.name,
    required this.description,
    required this.price,
  });

  final String image;
  final String name;
  final String description;
  final num price;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 16,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black12,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CachedNetworkImage(
                width: width * .7 / 2,
                height: height * .2,
                imageUrl: image,
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(
              width: width * .02,
            ),
            SizedBox(
              width: width * .4,
              height: height * .2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: Style.textStyle20,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  SizedBox(
                    height: height * .02,
                  ),
                  Text(
                    description ,
                    style: Style.textStyle14,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(
                    height: height * .01,
                  ),
                  Text(
                    '\$$price',
                    style: Style.textStyle20.copyWith(
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
