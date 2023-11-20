// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:food/Features/cart/data/repos/carts_repo_impl.dart';
// import 'package:food/Features/cart/presentation/manger/carts_cubit/carts_cubit.dart';
// import 'package:food/Features/cart/presentation/views/widget/carts_view_body.dart';
// import 'package:food/core/Utils/function/api_servic.dart';
//
// import '../manger/carts_cubit/carts_state.dart';
//
// class CartsView extends StatelessWidget {
//   const CartsView({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (BuildContext context) => CartsCubit(
//         CartsInitial(),
//         CartsRepoImpl(
//           ApiService(
//             Dio(),
//           ),
//         ),
//       )..getCarts(),
//       child: const Scaffold(
//         body: CartsViewBody(),
//       ),
//     );
//   }
// }
