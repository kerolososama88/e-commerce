import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food/Features/auth/presentation/login/presentation/manger/features_loginy_cubit/features_login_cubit.dart';
import 'package:food/Features/auth/presentation/login/presentation/manger/features_loginy_cubit/features_login_state.dart';

import '../../../../../../../core/Utils/widgets/custom_loading_Indicator.dart';
import '../../../../../../../core/constant/custom_text_field_auth.dart';
import '../../../../../../../core/constant/style_color.dart';
import 'dont_have_account.dart';
import 'image_logo_auth.dart';

// ignore: must_be_immutable
class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Form(
        key: LoginCubit.get(context).formKey,
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const ImageLogoAuth(),
            customTextFieldAuth(
              type: TextInputType.emailAddress,
              controller: LoginCubit.get(context).emailController,
              text: 'Please Enter Email',
              suffixIcon: CupertinoIcons.envelope_fill,
              validator: (String value) {
                if (value.isEmpty) {
                  return 'email must not be empty';
                }
              },
            ),
            customTextFieldAuth(
              type: TextInputType.number,
              controller: LoginCubit.get(context).passwordController,
              obscureText: LoginCubit.get(context).isPassword ? true : false,
              text: 'Please Enter Password',
              // suffixIcon: FeaturesLoginCubit.get(context).suffixWidget(),
              prefixIcon: CupertinoIcons.lock,
              validator: (String value) {
                if (value.isEmpty) {
                  return 'email must not be empty';
                }
              },
            ),
            BlocBuilder<LoginCubit, LoginState>(
              builder: (context, state) {
                return state is FeaturesLoginLoading
                    ? const CustomLoadingIndicator()
                    : defaultButtom(
                        function: () {
                          LoginCubit.get(context).fetchLogin(
                            context: context,
                          );
                        },
                        color: Colors.white,
                        text: 'Login',
                        background: kPrimaryColor,
                        width: width * .7,
                        height: height * .06,
                      );
              },
            ),
            DontHaveAccount(),
          ],
        ),
      ),
    );
  }
}
