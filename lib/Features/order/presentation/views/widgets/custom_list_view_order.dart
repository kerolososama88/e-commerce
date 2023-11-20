import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food/Features/order/presentation/views/widgets/custom_list_view_order_item.dart';
import 'package:food/core/Utils/widgets/custom_show_error.dart';
import '../../../../../core/Utils/widgets/custom_loading_Indicator.dart';
import '../../../../../core/constant/custom_error_widget.dart';
import '../../manger/carts_cubit/carts_cubit.dart';
import '../../manger/carts_cubit/carts_state.dart';

class ListCarts extends StatelessWidget {
  const ListCarts({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartsCubit, CartsState>(
      builder: (context, state) {
        if (state is GetCartsSuccess) {
          if (state.cartsModel.data!.cartItems!.isEmpty) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 1.0),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 98.0),
                child: Center(child: showText(text: 'Please add Product')),
              ),
            );
          } else {
            return ListView.builder(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemCount: state.cartsModel.data!.cartItems!.length,
              itemBuilder: (context, index) {
                return CustomListViewOrderItem(
                  name: state.cartsModel.data?.cartItems?[index].product?.name??'',
                  price: state.cartsModel.data?.cartItems?[index].product?.price??0,
                  description: state.cartsModel.data?.cartItems?[index].product?.description??'',
                  image: state.cartsModel.data?.cartItems?[index].product?.image??'',
                  productId: state.cartsModel.data?.cartItems?[index].product?.id??0,
                );
              },
            );
          }
        } else if (state is GetCartsFailure) {
          return CustomErrorWidget(errorMessage: state.errorMessage);
        } else {
          return const CustomLoadingIndicator();
        }
      },
    );
  }
}
