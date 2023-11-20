import 'package:flutter/material.dart';
import 'package:food/core/constant/style_color.dart';

Widget customTextFieldAuth({
  required controller,
   String? text,
  dynamic prefixIcon,
  dynamic suffixIcon,
  dynamic validator,
 TextInputType? type,
  bool?obscureText,
}) =>
    Padding(
      padding: const EdgeInsets.all(16.0),
      child: SizedBox(
        height: 70,
        child: TextFormField(
          validator: (String){},
          controller: controller,
          keyboardType: type,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                16,
              ),
            ),
            hintText: text,
            suffix: IconButton(
              color: kPrimaryColor,
              onPressed: () {},
              icon: Icon(
                suffixIcon,
              ),
            ),
            prefix: Icon(
              prefixIcon,
              color: kPrimaryColor,
            ),
          ),
        ),
      ),
    );

Widget customTextBottom({
  required Function() function,
  required String text,
}) =>
    TextButton(
        onPressed: function,
        child: Text(
          text,
          style: const TextStyle(
            color: kPrimaryColor,
          ),
        ));

Widget defaultButtom({
  required double width,
  required double height,
  required Function() function,
  required Color color,
  required String text,
  required Color background,
  bool isUpperCase = true,
}) =>
    Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextButton(
        onPressed: function,
        child: Text(
          text,
          style: TextStyle(
            color: color,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
