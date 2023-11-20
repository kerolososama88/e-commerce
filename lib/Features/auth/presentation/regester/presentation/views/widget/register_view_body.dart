import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food/Features/auth/presentation/regester/presentation/manger/features_register_cubit/features_register_cubit.dart';
import 'package:food/Features/auth/presentation/regester/presentation/manger/features_register_cubit/features_register_state.dart';
import 'package:food/core/constant/custom_text_field_auth.dart';
import 'package:food/core/constant/style_color.dart';
import 'package:food/core/constant/text_style.dart';

import '../../../../../../../core/Utils/widgets/custom_loading_Indicator.dart';

// ignore: must_be_immutable
class RegisterViewBody extends StatelessWidget {
  const RegisterViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Center(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Form(
            key: FeaturesRegisterCubit.get(context).formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    'REGISTER',
                    style: Style.textStyle20,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    'Register now to browse our hot offers',
                  ),
                ),
                customTextFieldAuth(
                  type: TextInputType.name,
                  controller:
                      FeaturesRegisterCubit.get(context).namedConteroller,
                  text: 'User Name',
                  suffixIcon: CupertinoIcons.person,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your name address';
                    }
                  },
                ),
                customTextFieldAuth(
                  type: TextInputType.emailAddress,
                  controller:
                      FeaturesRegisterCubit.get(context).emailConteroller,
                  text: 'Email Address',
                  suffixIcon: CupertinoIcons.envelope_fill,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your emil address';
                    }
                  },
                ),
                customTextFieldAuth(
                  type: TextInputType.number,
                  controller:
                      FeaturesRegisterCubit.get(context).passwordConteroller,
                  text: 'Password',
                  suffixIcon: CupertinoIcons.eye,
                  prefixIcon: CupertinoIcons.lock,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Password is too short';
                    }
                  },
                ),
                customTextFieldAuth(
                  type: TextInputType.phone,
                  controller:
                      FeaturesRegisterCubit.get(context).phonedConteroller,
                  text: 'Phone',
                  suffixIcon: CupertinoIcons.phone,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your phone number';
                    }
                  },
                ),
                BlocBuilder<FeaturesRegisterCubit, FeaturesRegisterState>(
                  builder: (context, state) {
                    return state is FeaturesRegisterLoading
                        ? const CustomLoadingIndicator()
                        : Center(
                            child: defaultButtom(
                              width: width * .7,
                              height: height * .06,
                              function: () {
                                FeaturesRegisterCubit.get(context)
                                    .fetchRegister(
                                  context: context,
                                );
                              },
                              color: Colors.white,
                              text: 'Register',
                              background: kPrimaryColor,
                            ),
                          );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
