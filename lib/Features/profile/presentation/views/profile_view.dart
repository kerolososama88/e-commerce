import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food/Features/profile/data/repos/profile_repo_impl.dart';
import 'package:food/Features/profile/presentation/manger/features_profile_cubit/profile_cubit.dart';
import 'package:food/Features/profile/presentation/manger/features_profile_cubit/profile_state.dart';
import 'package:food/Features/profile/presentation/views/widgets/profile_view_body.dart';
import 'package:food/core/Utils/function/api_servic.dart';


class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers:  [
          BlocProvider(
            create: (context) => FeaturesProfileCubit(
              FeaturesProfileInitial(),
              ProfileRepoImpl(
                ApiService(
                  Dio(),
                ),
              ),
            )..fetchProfile(),
          ),
        ] ,
      child: const Scaffold(
      body: ProfileViewBody(),
    ),);
  }
}
