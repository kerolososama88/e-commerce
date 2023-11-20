import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food/Features/order/presentation/views/widgets/order_list_body.dart';
import 'package:food/core/Utils/function/api_servic.dart';

import '../../../drawer/presentation/views/widgets/drawer_body.dart';
import '../../data/repos/carts_repo_impl.dart';
import '../manger/carts_cubit/carts_cubit.dart';
import '../manger/carts_cubit/carts_state.dart';

class OrderListView extends StatelessWidget {
  const OrderListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => CartsCubit(
        CartsInitial(),
        CartsRepoImpl(
          ApiService(
            Dio(),
          ),
        ),
      )..getCarts(),
      child: const Scaffold(
        drawer: DrawerBody(),
        body: OrderListBody(),
      ),
    );
  }
}
