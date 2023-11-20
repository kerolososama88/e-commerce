import 'package:flutter/material.dart';

import '../../../../../core/constant/text_style.dart';
import '../../../../order/presentation/manger/carts_cubit/carts_cubit.dart';

class CustomTotalBar extends StatelessWidget {
  const CustomTotalBar(
      {super.key, required this.price, required this.productId});

  final num price;
  final int productId;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 3.0),
        child: Row(
          children: [
            const Text(
              'Total:',
              style: Style.textStyle20,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * .02,
            ),
            Text(
              '\$$price',
              style: Style.textStyle16.copyWith(
                color: Colors.red,
              ),
            ),
            SizedBox(
              width: width * .3,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: width * .3,
                height: height * .05,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: TextButton(
                  onPressed: () {
                    CartsCubit.get(context).addCarts(productId);
                  },
                  child: Text(
                    'Add To Cart',
                    style: Style.textStyle16.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
