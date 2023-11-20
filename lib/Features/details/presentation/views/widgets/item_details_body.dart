import 'package:clippy_flutter/arc.dart';
import 'package:flutter/material.dart';
import 'package:food/Features/details/presentation/views/widgets/custom_details.dart';
import 'package:food/Features/details/presentation/views/widgets/custom_stack.dart';
import 'package:food/Features/details/presentation/views/widgets/custom_total_bar.dart';

class ItemDetailsBody extends StatelessWidget {
  const ItemDetailsBody(
      {super.key,
      required this.image,
      required this.name,
      required this.description,
      required this.price,
      required this.productId});

  final String image;
  final String name;
  final String description;
  final num price;
  final int productId;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomStack(image: image),
        Arc(
          edge: Edge.TOP,
          arcType: ArcType.CONVEY,
          height: 30,
          child: Container(
            width: double.infinity,
            color: Colors.white,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 37.0, horizontal: 16),
              child: CustomDetails(
                name: name,
                description: description,
                price: price,
              ),
            ),
          ),
        ),
        const Spacer(),
        CustomTotalBar(
          price: price,
          productId: productId,
        ),
      ],
    );
  }
}
