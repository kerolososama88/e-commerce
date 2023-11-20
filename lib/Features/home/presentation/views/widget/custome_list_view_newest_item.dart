import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food/Features/details/presentation/views/item_details.dart';
import 'package:food/Features/favourits/presentation/manger/favourit_cubit/favourit_cubit.dart';
import 'package:food/Features/favourits/presentation/manger/favourit_cubit/favourit_state.dart';
import 'package:food/core/constant/style_color.dart';
import 'package:food/core/constant/text_style.dart';

import '../../../../order/presentation/manger/carts_cubit/carts_cubit.dart';
import '../../../data/models/home_model.dart';

class CustomListViewNewestItem extends StatelessWidget {
  const CustomListViewNewestItem({
    super.key,
    required this.productModel,
  });

  final Products productModel;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => ItemDetails(
            image: productModel.image ?? '',
            name: productModel.name ?? '',
            description: productModel.description ?? '',
            price: productModel.price ?? 0,
            productId: productModel.id!,
          ),
        ));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
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
                      height: height * .02,
                    ),
                    const Icon(
                      Icons.star_border_outlined,
                      size: 22,
                      color: Colors.red,
                    ),
                    SizedBox(
                      height: height * .01,
                    ),
                    Text(
                      '\$${productModel.price}',
                      style: Style.textStyle20.copyWith(
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  BlocBuilder<FavoritesCubit, FavoritesState>(
                    buildWhen: (previous, current) =>
                        current is AddFavoritesSuccess,
                    builder: (context, state) {
                      return IconButton(
                        onPressed: () {
                          FavoritesCubit.get(context)
                              .addFavorites(productModel);
                        },
                        icon: productModel.inFavorites!
                            ? const Icon(
                                Icons.favorite,
                                color: kPrimaryColor,
                              )
                            : const Icon(
                                Icons.favorite_border,
                                color: kPrimaryColor,
                              ),
                      );
                    },
                  ),
                  SizedBox(
                    height: height * .06,
                  ),
                  IconButton(
                    onPressed: () {
                      CartsCubit.get(context).addCarts(productModel.id!);
                    },
                    icon: const Icon(
                      Icons.shopping_cart_outlined,
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
