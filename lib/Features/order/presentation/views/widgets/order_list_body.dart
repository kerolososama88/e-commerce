import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food/Features/home/presentation/views/widget/custom_details_cost.dart';
import 'package:food/Features/home/presentation/views/widget/custom_app_bar.dart';
import 'package:food/Features/order/presentation/manger/carts_cubit/carts_cubit.dart';
import 'package:food/Features/order/presentation/manger/carts_cubit/carts_state.dart';
import 'package:food/core/Utils/widgets/custom_loading_Indicator.dart';
import 'package:food/core/constant/text_style.dart';

import 'custom_list_view_order.dart';

class OrderListBody extends StatelessWidget {
  const OrderListBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartsCubit, CartsState>(
      builder: (context, state) {
        if (state is GetCartsSuccess) {
          return CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    const CustomAppBar(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Align(
                        alignment: AlignmentDirectional.topStart,
                        child: Text(
                          'Order List',
                          style: Style.textStyle20.copyWith(
                            fontSize: 22,
                          ),
                        ),
                      ),
                    ),
                    const ListCarts(),
                    if (state.cartsModel.data!.cartItems!.isNotEmpty)
                      CustomDetailsCost(
                        items: state.cartsModel.data!.cartItems!.length,
                        subTotal: state.cartsModel.data!.subTotal ?? 0, 
                        // total: state.cartsModel.data.cartItems.fold(initialValue, (previousValue, element) => null),
                      ),
                  ],
                ),
              ),
            ],
          );
        } else if (state is GetCartsFailure) {
          return Text(state.errorMessage);
        } else {
          return const Center(child: CustomLoadingIndicator());
        }
      },
    );
  }
}
