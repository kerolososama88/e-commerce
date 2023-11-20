import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:food/Features/order/presentation/manger/carts_cubit/carts_cubit.dart';
import 'package:food/core/constant/style_color.dart';
import 'package:food/core/constant/text_style.dart';

class CustomListViewOrderItem extends StatelessWidget {
  const CustomListViewOrderItem({
    super.key,
    required this.name,
    required this.price,
    required this.description,
    required this.image,
    required this.productId,
  });

  final String name;
  final num price;
  final String description;
  final String image;
  final int productId;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Stack(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: CachedNetworkImage(
                    width: width * .2,
                    height: height * .1,
                    imageUrl: image,
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        name,
                        style: Style.textStyle20,
                        maxLines: 1,
                      ),
                      SizedBox(
                        height: height * .01,
                      ),
                      Text(
                        description,
                        style: Style.textStyle14,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(
                        height: height * .01,
                      ),
                      Text(
                        '$price',
                        style: Style.textStyle20.copyWith(
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: width * .1,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: kPrimaryColor,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 18,
                          ),
                        ),
                        Text(
                          '2',
                          style: Style.textStyle18.copyWith(
                            color: Colors.white,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
                height: 35,
                child: IconButton(
                  onPressed: () {
                    CartsCubit.get(context).addCarts(productId);
                  },
                  icon: const Icon(
                    Icons.remove_circle_outline,
                    color: kPrimaryColor,
                  ),
                ),
            ),
          ],
        ),
      ),
    );
  }
}
