import 'package:flutter/material.dart';

class CustomSearchField extends StatelessWidget {
  const CustomSearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: TextField(
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.black12,
              ),
              borderRadius: BorderRadius.circular(23.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.black,
              ),
              borderRadius: BorderRadius.circular(23.0),
            ),
            hintText: 'What would you like to have?',
            prefixIcon: IconButton(
              onPressed: () {},
              icon: const Opacity(
                opacity: .8,
                child: Icon(
                  Icons.search_outlined,
                  size: 30.0,
                  color: Colors.red,
                ),
              ),
            ),
            suffixIcon: const Opacity(
              opacity: .8,
              child: Icon(
                Icons.category,
                size: 30.0,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
