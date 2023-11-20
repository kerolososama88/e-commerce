import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food/Features/auth/data/repos/repos/auth_repo_impl.dart';
import 'package:food/Features/auth/presentation/regester/presentation/views/widget/register_view_body.dart';

import '../../../../../../core/Utils/function/api_servic.dart';
import '../manger/features_register_cubit/features_register_cubit.dart';
import '../manger/features_register_cubit/features_register_state.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FeaturesRegisterCubit(
        FeaturesRegisterInitial(),
        AuthRepoImpl(
          ApiService(
            Dio(),
          ),
        ),
      ),
      child: const Scaffold(
        body: RegisterViewBody(),
      ),
    );
  }
}
