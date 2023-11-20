import 'package:flutter/material.dart';

class CustomProfileImage extends StatelessWidget {
  const CustomProfileImage({super.key, required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
          radius: 35,
          backgroundImage: NetworkImage(
            image,
          ),
        ),
        Positioned(
          bottom: -12,
           left: 35,
          child: IconButton(
            onPressed: () {},
            icon:const Icon(
              Icons.add_a_photo,
            ),
          ),
        ),
      ],
    );
  }
}
