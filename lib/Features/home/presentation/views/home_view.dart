import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food/Features/favourits/presentation/manger/favourit_cubit/favourit_cubit.dart';
import 'package:food/Features/home/data/repos/home_repo_impl.dart';
import 'package:food/Features/drawer/presentation/views/widgets/drawer_body.dart';
import 'package:food/Features/home/presentation/views/widget/home_view_body.dart';
import 'package:food/Features/order/presentation/views/order_list_view.dart';
import 'package:food/core/Utils/function/api_servic.dart';

import '../../../favourits/data/repos/favorite_repo_impl.dart';
import '../../../favourits/presentation/manger/favourit_cubit/favourit_state.dart';
import '../../../order/data/repos/carts_repo_impl.dart';
import '../../../order/presentation/manger/carts_cubit/carts_cubit.dart';
import '../../../order/presentation/manger/carts_cubit/carts_state.dart';
import '../manger/features_category_cubit/features_category_cubit.dart';
import '../manger/features_category_cubit/features_category_state.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FeaturesCategoryCubit(
            FeaturesCategoryInitial(),
            HomeRepoImpl(
              ApiService(
                Dio(),
              ),
            ),
          )..fetchCategoryItems(),
        ),
        BlocProvider(
          create: (context) => FavoritesCubit(
            FavoritesInitial(),
            FavoriteRepoImpl(
              ApiService(
                Dio(),
              ),
            ),
          ),
        ),
        BlocProvider(
          create: (context) => CartsCubit(
            CartsInitial(),
            CartsRepoImpl(
              ApiService(
                Dio(),
              ),
            ),
          ),
        ),
      ],
      child: Scaffold(
        drawer:  const DrawerBody(),
        floatingActionButton: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(.5),
                spreadRadius: 2,
                blurRadius: 10,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: FloatingActionButton(
            onPressed: () {
              // GoRouter.of(context).push(AppRouter.kOrderListView);
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const OrderListView(),)
              );
            },
            backgroundColor: Colors.white,
            child: const Icon(
              CupertinoIcons.cart,
              size: 28,
              color: Colors.red,
            ),
          ),
        ),
        body: const HomeViewBody(),
      ),
    );
  }
}
