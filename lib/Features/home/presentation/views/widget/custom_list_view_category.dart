import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food/Features/home/presentation/views/widget/custom_list_view_catrgory_item.dart';

import '../../../../../core/Utils/widgets/custom_loading_Indicator.dart';
import '../../manger/features_category_cubit/features_category_cubit.dart';
import '../../manger/features_category_cubit/features_category_state.dart';

class CustomListViewCategory extends StatelessWidget {
  const CustomListViewCategory({super.key});

  @override
  Widget build(BuildContext context) {
    final height= MediaQuery.of(context).size.height;
    return BlocBuilder<FeaturesCategoryCubit, FeaturesCategoryState>(
      builder: (context, state) {
          return state is FeaturesCategorySuccess? SizedBox(
            height: height * .1,
            child: ListView.builder(
              physics:  const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return CustomListViewCategoryItem(
                  image:
                  state.homeModel.data?.banners?[index].image ?? '',
                );
              },
              itemCount: state.homeModel.data!.banners!.length,
            ),
          ):
            const CustomLoadingIndicator();
      },
    );
  }
}
