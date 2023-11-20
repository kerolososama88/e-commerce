import 'package:flutter/material.dart';
import 'package:food/core/constant/custom_bottom_cost_bar.dart';
import 'package:food/core/constant/text_style.dart';

class CustomDetailsCost extends StatelessWidget {
  const CustomDetailsCost(
      {super.key, required this.items, required this.subTotal});

  final int items;
  final int subTotal;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 30),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.black12,
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      const Text(
                        'Items:',
                        style: Style.textStyle16,
                      ),
                      const Spacer(),
                      Text(
                        '$items',
                        style: Style.textStyle16,
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      '----------------------------------------------------------------',
                      style: Style.textStyle14.copyWith(color: Colors.grey),
                    ),
                  ),
                   Row(
                    children: [
                      const Text(
                        'Sub-Total:',
                        style: Style.textStyle16,
                      ),
                      const Spacer(),
                      Text(
                        '\$$subTotal',
                        style: Style.textStyle16,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height * .03,
                  ),
                  const Row(
                    children: [
                      Text(
                        'Delivery',
                        style: Style.textStyle16,
                      ),
                      Spacer(),
                      Text(
                        '\$20',
                        style: Style.textStyle16,
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      '----------------------------------------------------------------',
                      style: Style.textStyle14.copyWith(color: Colors.grey),
                    ),
                  ),
                  Row(
                    children: [
                      const Text(
                        'Total:',
                        style: Style.textStyle20,
                      ),
                      const Spacer(),
                      Text(
                        '\$20',
                        style: Style.textStyle16.copyWith(color: Colors.red),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        // const CustomBottomNavBar(
        //   text: 'Total',
        // ),
      ],
    );
  }
}
