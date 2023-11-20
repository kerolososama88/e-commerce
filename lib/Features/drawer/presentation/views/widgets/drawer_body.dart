import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food/Features/favourits/presentation/views/favorite_view.dart';
import 'package:food/Features/profile/presentation/views/profile_view.dart';
import 'package:food/Features/setting/presentation/views/setting_view.dart';
import 'package:food/core/Utils/function/api_servic.dart';
import 'package:food/core/Utils/function/log_out.dart';
import 'package:food/core/constant/text_style.dart';

import '../../../../../core/Utils/widgets/custom_loading_Indicator.dart';
import '../../../../profile/data/repos/profile_repo_impl.dart';
import '../../../../profile/presentation/manger/features_profile_cubit/profile_cubit.dart';
import '../../../../profile/presentation/manger/features_profile_cubit/profile_state.dart';

class DrawerBody extends StatelessWidget {
  const DrawerBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FeaturesProfileCubit(
        FeaturesProfileInitial(),
        ProfileRepoImpl(
          ApiService(
            Dio(),
          ),
        ),
      )..fetchProfile(),
      child: BlocBuilder<FeaturesProfileCubit, ProfileState>(
        builder: (context, state) {
          return state is FeaturesProfileSuccess
              ? Drawer(
                  child: ListView(
                    children: [
                      DrawerHeader(
                        padding: EdgeInsets.zero,
                        child: UserAccountsDrawerHeader(
                          decoration: const BoxDecoration(
                            color: Colors.red,
                          ),
                          accountName: Text(
                            state.loginModel.data!.name ?? '',
                            style: Style.textStyle20,
                          ),
                          accountEmail: Text(
                            state.loginModel.data!.email ?? '',
                            style: Style.textStyle16.copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          currentAccountPicture: CircleAvatar(
                            backgroundImage: NetworkImage(
                                state.loginModel.data!.image ?? ''),
                          ),
                        ),
                      ),
                      ListTile(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        leading: const Icon(
                          CupertinoIcons.home,
                          color: Colors.red,
                        ),
                        title: const Text(
                          'Home',
                          style: Style.textStyle16,
                        ),
                      ),
                      ListTile(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const ProfileView(),
                            ),
                          );
                        },
                        leading: const Icon(
                          CupertinoIcons.person,
                          color: Colors.red,
                        ),
                        title: const Text(
                          'Profile',
                          style: Style.textStyle16,
                        ),
                      ),
                      // ListTile(
                      //   onTap: () {
                      //     Navigator.of(context).push(
                      //       MaterialPageRoute(
                      //         builder: (context) => const CartsView(),
                      //       ),
                      //     );
                      //   },
                      //   leading: const Icon(
                      //     CupertinoIcons.cart,
                      //     color: Colors.red,
                      //   ),
                      //   title: const Text(
                      //     'Carts',
                      //     style: Style.textStyle16,
                      //   ),
                      // ),
                      ListTile(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const FavoriteView(),
                            ),
                          );
                        },
                        leading: const Icon(
                          CupertinoIcons.heart,
                          color: Colors.red,
                        ),
                        title: const Text(
                          'Favorites',
                          style: Style.textStyle16,
                        ),
                      ),
                      ListTile(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const SettingView(),
                            ),
                          );
                        },
                        leading: const Icon(
                          CupertinoIcons.settings,
                          color: Colors.red,
                        ),
                        title: const Text(
                          'Setting',
                          style: Style.textStyle16,
                        ),
                      ),
                      ListTile(
                        onTap: () {
                          singOut(context);
                        },
                        leading: const Icon(
                          Icons.exit_to_app,
                          color: Colors.red,
                        ),
                        title: const Text(
                          'Log Out',
                          style: Style.textStyle16,
                        ),
                      ),
                    ],
                  ),
                )
              : const CustomLoadingIndicator();
        },
      ),
    );
  }
}
