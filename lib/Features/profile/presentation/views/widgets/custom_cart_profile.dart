import 'package:flutter/material.dart';
import 'package:food/Features/profile/presentation/views/widgets/custom_profile_image.dart';
import 'package:food/core/constant/style_color.dart';
import 'package:food/core/constant/text_style.dart';


class CustomCartProfile extends StatelessWidget {
  const CustomCartProfile({
    super.key,
    required this.name,
    required this.email,
    required this.phone,
    required this.image,
  });

  final String name;
  final String email;
  final String phone;
  final String image;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            Container(
              width: double.infinity,
              height: height * .4,
              decoration: const BoxDecoration(
                color: kPrimaryColor,
              ),
            ),
            Column(
              children: [
                Align(
                    alignment: AlignmentDirectional.topCenter,
                    child: Text(
                      'PROFILE',
                      style: Style.textStyle18.copyWith(
                        color: Colors.white,
                      ),
                    )),
                SizedBox(
                  height: height * .03,
                ),
                Container(
                  width: width * .6,
                  height: height * .5 / 2,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.black.withAlpha(0),
                          Colors.white12,
                          Colors.white24
                        ]),
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      CustomProfileImage(
                        image: image,
                      ),
                      SizedBox(
                        height: height * .01,
                      ),
                      Text(
                        name,
                        style: Style.textStyle20.copyWith(
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: height * .02,
                      ),
                      Text(
                        email,
                        style: Style.textStyle10.copyWith(
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: height * .02,
                      ),
                      Text(
                        phone,
                        style: Style.textStyle20.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
