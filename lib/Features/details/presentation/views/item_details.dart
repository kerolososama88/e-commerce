import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food/Features/details/presentation/views/widgets/item_details_body.dart';
import 'package:food/core/Utils/function/api_servic.dart';

import '../../../drawer/presentation/views/widgets/drawer_body.dart';
import '../../../order/data/repos/carts_repo_impl.dart';
import '../../../order/presentation/manger/carts_cubit/carts_cubit.dart';
import '../../../order/presentation/manger/carts_cubit/carts_state.dart';

class ItemDetails extends StatelessWidget {
  const ItemDetails({
    super.key,
    required this.image,
    required this.name,
    required this.description,
    required this.price,
    required this.productId,
  });

  final String image;
  final String name;
  final String description;
  final num price;
  final int productId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartsCubit(
        CartsInitial(),
        CartsRepoImpl(
          ApiService(
            Dio(),
          ),
        ),
      ),
      child: Scaffold(
        drawer: const DrawerBody(),
        body: ItemDetailsBody(
          image: image,
          name: name,
          description: description,
          price: price,
          productId: productId,
        ),
      ),
    );
  }
}
