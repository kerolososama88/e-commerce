import 'package:flutter/material.dart';
import '../../../../../core/constant/text_style.dart';
import 'custom_delivery_time.dart';

class CustomDetails extends StatelessWidget {
  const CustomDetails({
    super.key,
    required this.name,
    required this.description,
    required this.price,
  });

  final String name;
  final String description;
  final num price;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        Row(
          children: [
            const Icon(
              Icons.star,
              color: Colors.amber,
            ),
            const Spacer(),
            Text(
              '\$$price',
              style: Style.textStyle20,
            ),
          ],
        ),
        SizedBox(
          height: height * .03,
        ),
        Text(
          name,
          style: Style.textStyle20,
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
        ),
        SizedBox(
          height: height * .03,
        ),
        Text(
          description,
          overflow: TextOverflow.ellipsis,
          maxLines: 3,
          style: Style.textStyle14,
        ),
        const CustomDeliveryTime(),
      ],
    );
  }
}
