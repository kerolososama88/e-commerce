import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food/Features/setting/data/repos/setting_repo_impl.dart';
import 'package:food/Features/setting/presentation/manger/update_profile_cubit/update_profile_cubit.dart';
import 'package:food/Features/setting/presentation/manger/update_profile_cubit/update_profile_state.dart';
import 'package:food/Features/setting/presentation/views/widgets/setting_view_body.dart';
import 'package:food/core/Utils/function/api_servic.dart';

class SettingView extends StatelessWidget {
  const SettingView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => UpdateProfileCubit(
            UpdateProfileInitial(),
            SettingRepoImpl(
              ApiService(
                Dio(),
              ),
            ),
          )..getProfileData(),
        ),
      ],
      child: const Scaffold(
        body: SettingViewBody(),
      ),
    );
  }
}
