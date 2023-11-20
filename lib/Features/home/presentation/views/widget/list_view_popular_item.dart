import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:food/Features/favourits/presentation/manger/favourit_cubit/favourit_cubit.dart';
import 'package:food/core/constant/style_color.dart';
import 'package:food/core/constant/text_style.dart';

import '../../../data/models/home_model.dart';

class ListViewPopularItem extends StatelessWidget {
  const ListViewPopularItem({
    super.key,
    required this.productModel,
  });

  final Products productModel;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        width: width * .5,
        decoration: BoxDecoration(
          color: Colors.black12,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.all(9.0),
          child: Column(
            children: [
              CachedNetworkImage(
                height: height * .2,
                fit: BoxFit.fill,
                imageUrl: productModel.image??'',
                errorWidget: (context, url, error) => const Icon(
                  Icons.error_outline,
                  color: kPrimaryColor,
                ),
              ),
              SizedBox(
                height: height * .01,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  productModel.name??'',
                  style: Style.textStyle18,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Taste Burger side',
                  style: Style.textStyle14,
                ),
              ),
              SizedBox(
                height: height * .001,
              ),
              Row(
                children: [
                  Text(
                    '\$${productModel.price}',
                    style: Style.textStyle14.copyWith(
                      color: Colors.red,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {
                      FavoritesCubit.get(context).addFavorites(productModel);
                    },
                    icon: const Icon(
                      Icons.favorite_border,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
