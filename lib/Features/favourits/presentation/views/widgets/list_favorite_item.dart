import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:food/Features/favourits/presentation/manger/favourit_cubit/favourit_cubit.dart';
import 'package:food/Features/home/data/models/home_model.dart';

import '../../../../../core/constant/text_style.dart';
import '../../../data/models/favorite_model.dart';

class ListFavoriteItem extends StatelessWidget {
  const ListFavoriteItem({
    super.key,
    required this.productModel,
  });

  final Product productModel;

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
                imageUrl: productModel.image ?? '',
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
                    productModel.name ?? '',
                    style: Style.textStyle20,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  SizedBox(
                    height: height * .02,
                  ),
                  Text(
                    productModel.description ?? '',
                    style: Style.textStyle14,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(
                    height: height * .01,
                  ),
                  Row(
                    children: [
                      Text(
                        '\$${productModel.price}',
                        style: Style.textStyle20.copyWith(
                          color: Colors.red,
                        ),
                      ),
                      const Spacer(),
                      IconButton(
                        alignment: AlignmentDirectional.bottomEnd,
                        onPressed: () {
                          FavoritesCubit.get(context).addFavorites(
                            Products(
                              id: productModel.id,
                              name: productModel.name,
                              image: productModel.image,
                              description: productModel.description,
                              discount: productModel.discount,
                              oldPrice: productModel.oldPrice,
                              price: productModel.price,
                              inFavorites: true,
                              inCart: false,
                              images: [],
                            ),
                          );
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
          ],
        ),
      ),
    );
  }
}
