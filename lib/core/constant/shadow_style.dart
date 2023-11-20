import 'package:flutter/material.dart';

class ShadowStyle extends StatelessWidget {
  const ShadowStyle({super.key, required this.color});
final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color:color.withOpacity(.5),
            spreadRadius: 2,
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
    );
  }
}
