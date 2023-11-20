import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food/Features/home/presentation/views/widget/custome_list_view_newest_item.dart';

import '../../../../../core/Utils/widgets/custom_loading_Indicator.dart';
import '../../manger/features_category_cubit/features_category_cubit.dart';
import '../../manger/features_category_cubit/features_category_state.dart';

class CustomListViewNewest extends StatelessWidget {
  const CustomListViewNewest({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return BlocBuilder<FeaturesCategoryCubit, FeaturesCategoryState>(
      // buildWhen: (previous, current) => previous != current && current is EditingUserInfo,
      builder: (context, state) {
        return state is FeaturesCategorySuccess
            ? ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return CustomListViewNewestItem(
                    productModel: state.homeModel.data!.products![index],
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(
                    height: height * .02,
                  );
                },
                itemCount: state.homeModel.data!.products!.length,
              )
            : const CustomLoadingIndicator();
      },
    );
  }
}
