import 'package:flutter/material.dart';
import 'package:food/core/constant/text_style.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({super.key, required this.errorMessage});
  final String errorMessage;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        errorMessage,
        style: Style.textStyle18.copyWith(
          color: Colors.white,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
