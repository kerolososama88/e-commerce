import 'package:flutter/material.dart';
import 'package:food/Features/search/presentation/manger/search_cubit/search_cubit.dart';
import 'list_search.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Form(
            key: SearchCubit.get(context).formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 29.0,
                horizontal: 16,
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 16,
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
                      child: TextFormField(
                        controller: SearchCubit.get(context).searchController,
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
                          prefixIcon: const Icon(
                            Icons.search_outlined,
                            size: 30.0,
                            color: Colors.red,
                          ),
                          suffixIcon: const Icon(
                            Icons.category,
                            size: 30.0,
                            color: Colors.black,
                          ),
                        ),
                        onFieldSubmitted: (String text) {
                          SearchCubit.get(context).fetchSearch(text: text);
                        },
                      ),
                    ),
                  ),
                  const ListSearch(),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
