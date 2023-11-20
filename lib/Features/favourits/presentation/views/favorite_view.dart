import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food/Features/favourits/data/repos/favorite_repo_impl.dart';
import 'package:food/Features/favourits/presentation/manger/favourit_cubit/favourit_cubit.dart';
import 'package:food/Features/favourits/presentation/views/widgets/favotite_view_body.dart';
import 'package:food/core/Utils/function/api_servic.dart';

import '../manger/favourit_cubit/favourit_state.dart';

class FavoriteView extends StatelessWidget {
  const FavoriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FavoritesCubit(
        FavoritesInitial(),
        FavoriteRepoImpl(
          ApiService(
            Dio(),
          ),
        ),
      )..getFavorites(),
      child: const Scaffold(
        body: FavoriteViewBody(),
      ),
    );
  }
}
