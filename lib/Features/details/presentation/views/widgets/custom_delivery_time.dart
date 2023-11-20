import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../core/constant/style_color.dart';
import '../../../../../core/constant/text_style.dart';

class CustomDeliveryTime extends StatelessWidget {
  const CustomDeliveryTime({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Text(
          'Delivery Time',
          style: Style.textStyle14
              .copyWith(fontWeight: FontWeight.bold),
        ),
        const Spacer(),
        const Icon(
          CupertinoIcons.clock,
          color: kPrimaryColor,
        ),
        SizedBox(
          width: width * .01,
        ),
        Text(
          '30 Minutes',
          style: Style.textStyle16
              .copyWith(fontWeight: FontWeight.w400),
        ),
      ],
    );
  }
}
