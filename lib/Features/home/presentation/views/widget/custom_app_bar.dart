import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food/Features/search/presentation/views/search_view.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 39,
        horizontal: 16,
      ),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3),
                  ),
                ]),
            child: IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: const Icon(
                Icons.menu,
                size: 25,
              ),
            ),
          ),
          const Spacer(),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3),
                  ),
                ]),
            child: IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const SearchView(),
                ));
              },
              icon: const Icon(
                CupertinoIcons.search,
                size: 25,
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * .02,
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3),
                  ),
                ]),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.notifications,
                size: 30,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
