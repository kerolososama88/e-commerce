import 'package:flutter/material.dart';
import 'package:food/core/constant/text_style.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({super.key, required this.text,});
  final String text;
  @override
  Widget build(BuildContext context) {
    final height= MediaQuery.of(context).size.height;
    final width= MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: [
          const Text(
            'Total:',
            style: Style.textStyle20,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * .03,
          ),
          Text(
            '\$20',
            style: Style.textStyle16.copyWith(
              color: Colors.red,
            ),
          ),
          SizedBox(
            width: width * .3,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: width * .3,
              height: height * .05,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Center(
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    text,
                    style: Style.textStyle16.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
