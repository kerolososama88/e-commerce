import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food/Features/favourits/presentation/manger/favourit_cubit/favourit_cubit.dart';
import 'package:food/core/Utils/widgets/custom_show_error.dart';

import '../../../../../core/Utils/widgets/custom_loading_Indicator.dart';
import '../../../../../core/constant/custom_error_widget.dart';
import '../../manger/favourit_cubit/favourit_state.dart';
import 'list_favorite_item.dart';

class ListFavorite extends StatelessWidget {
  const ListFavorite({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoritesCubit, FavoritesState>(
      builder: (context, state) {
        if (state is GetFavoritesSuccess) {
          if (FavoritesCubit.get(context).listOfFavorites.isEmpty) {
            return Center(child: showText(text: 'please add Favorite Item'));
          } else {
            return ListView.builder(
              itemBuilder: (context, index) => ListFavoriteItem(
                productModel:
                    FavoritesCubit.get(context).listOfFavorites[index].product!,
              ),
              itemCount: FavoritesCubit.get(context).listOfFavorites.length,
            );
          }
        } else if (state is GetFavoritesFailure) {
          return CustomErrorWidget(errorMessage: state.errorMessage);
        } else {
          return const CustomLoadingIndicator();
        }
      },
    );
  }
}
