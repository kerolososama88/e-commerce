import 'package:flutter/material.dart';
import 'package:food/Features/home/presentation/views/widget/custom_list_view_category.dart';
import '../../../../../core/constant/text_style.dart';
import 'custom_app_bar.dart';
import 'custom_list_view_newest.dart';
import 'custom_search_field.dart';
import 'list_view_popular.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              const CustomAppBar(),
              const CustomSearchField(),
              const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 16,
                ),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Category',
                    style: Style.textStyle20,
                  ),
                ),
              ),
              const CustomListViewCategory(),
              const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 16,
                ),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Popular',
                    style: Style.textStyle20,
                  ),
                ),
              ),
              const ListViewPopular(),
              SizedBox(
                height: height * 0.01,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 16.0,
                ),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Newest',
                    style: Style.textStyle20,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SliverToBoxAdapter(
          child: CustomListViewNewest(),
        ),
      ],
    );
  }
}
