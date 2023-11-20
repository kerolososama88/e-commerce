import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food/Features/profile/presentation/manger/features_profile_cubit/profile_state.dart';
import 'package:food/Features/profile/presentation/views/widgets/custom_cart_profile.dart';

import '../../../../../core/Utils/widgets/custom_loading_Indicator.dart';
import '../../manger/features_profile_cubit/profile_cubit.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturesProfileCubit, ProfileState>(
      builder: (context, state) {
          return state is FeaturesProfileSuccess? Column(
            children: [
              CustomCartProfile(
                name: state.loginModel.data!.name ?? '',
                email: state.loginModel.data!.email ?? '',
                phone: state.loginModel.data!.phone ?? '',
                image: state.loginModel.data!.image ?? '',
              ),
            ],
          ):const CustomLoadingIndicator();
      },
    );
  }
}
