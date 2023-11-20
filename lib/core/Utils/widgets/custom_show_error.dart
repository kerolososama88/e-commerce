import 'package:flutter/cupertino.dart';
import 'package:food/core/constant/style_color.dart';
import 'package:food/core/constant/text_style.dart';

Widget showText({
  required String text,
})=>Text(
  text,
  style: Style.textStyle18.copyWith(
    color: kPrimaryColor,
  ),
);