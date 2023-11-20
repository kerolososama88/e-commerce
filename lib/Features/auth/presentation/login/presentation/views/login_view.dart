import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food/Features/auth/presentation/login/presentation/views/widgets/login_view_body.dart';

import '../../../../../../core/Utils/function/api_servic.dart';
import '../../../../data/repos/repos/auth_repo_impl.dart';
import '../manger/features_loginy_cubit/features_login_cubit.dart';
import '../manger/features_loginy_cubit/features_login_state.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => LoginCubit(
          FeaturesLoginInitial(),
          AuthRepoImpl(ApiService(Dio())),
        ),
        child: const LoginViewBody(),
      ),
    );
  }
}
