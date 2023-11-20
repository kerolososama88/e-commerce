import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food/Features/home/presentation/manger/features_category_cubit/features_category_state.dart';
import 'package:food/Features/home/presentation/views/widget/list_view_popular_item.dart';
import '../../../../../core/Utils/widgets/custom_loading_Indicator.dart';
import '../../manger/features_category_cubit/features_category_cubit.dart';

class ListViewPopular extends StatelessWidget {
  const ListViewPopular({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return BlocBuilder<FeaturesCategoryCubit, FeaturesCategoryState>(
      builder: (context, state) {
        return state is FeaturesCategorySuccess
            ? SizedBox(
                height: height * .4,
                child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return ListViewPopularItem(
                      productModel: state.homeModel.data!.products![index],
                    );
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      width: width * .01,
                    );
                  },
                  itemCount: state.homeModel.data!.products!.length,
                ),
              )
            : const CustomLoadingIndicator();
      },
    );
  }
}
