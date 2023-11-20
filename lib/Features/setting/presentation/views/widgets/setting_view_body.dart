import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food/Features/setting/presentation/manger/update_profile_cubit/update_profile_cubit.dart';
import 'package:food/Features/setting/presentation/manger/update_profile_cubit/update_profile_state.dart';
import 'package:food/Features/setting/presentation/views/widgets/update_profile_image.dart';
import 'package:food/core/Utils/widgets/custom_loading_Indicator.dart';

import '../../../../../core/constant/custom_text_field_auth.dart';
import '../../../../../core/constant/style_color.dart';

class SettingViewBody extends StatelessWidget {
  const SettingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Center(
      child: SingleChildScrollView(
        child: Form(
          key: UpdateProfileCubit.get(context).formKey,
          child: Column(
            children: [
               const UpdateProfileImage(),
              customTextFieldAuth(
                type: TextInputType.name,
                controller: UpdateProfileCubit.get(context).nameController,
                suffixIcon: CupertinoIcons.person,
              ),
              customTextFieldAuth(
                type: TextInputType.emailAddress,
                controller: UpdateProfileCubit.get(context).emailController,
                suffixIcon: CupertinoIcons.envelope_fill,
              ),
              customTextFieldAuth(
                type: TextInputType.phone,
                controller: UpdateProfileCubit.get(context).phoneController,
                obscureText: true,
                suffixIcon: CupertinoIcons.phone,
              ),
              BlocBuilder<UpdateProfileCubit, UpdateProfileState>(
                builder: (context, state) {
                  return state is UpdateProfileLoading
                      ? const CustomLoadingIndicator()
                      : defaultButtom(
                          function: () {
                            UpdateProfileCubit.get(context).updateProfile();
                          },
                          color: Colors.white,
                          text: 'Update',
                          background: kPrimaryColor,
                          width: width * .7,
                          height: height * .06,
                        );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
