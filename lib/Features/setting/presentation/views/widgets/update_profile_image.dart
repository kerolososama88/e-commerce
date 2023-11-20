import 'dart:io';

import 'package:flutter/material.dart';
import 'package:food/Features/setting/presentation/manger/update_profile_cubit/update_profile_cubit.dart';
import 'package:food/core/constant/style_color.dart';

class UpdateProfileImage extends StatelessWidget {
  const UpdateProfileImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
          radius: 35,
          backgroundImage: (UpdateProfileCubit.get(context).profileImage ==
                  null)
              ? const NetworkImage(
                  '',
                )
              : FileImage(
                      File(UpdateProfileCubit.get(context).profileImage!.path))
                  as ImageProvider,
        ),
        Positioned(
          bottom: -12,
          left: 35,
          child: IconButton(
            onPressed: () {
              UpdateProfileCubit.get(context).updateProfileImage();
            },
            icon: const Icon(
              Icons.add_a_photo,
              color: kPrimaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
