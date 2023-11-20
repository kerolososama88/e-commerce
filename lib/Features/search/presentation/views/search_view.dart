import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food/Features/search/data/repos/search_repo_impl.dart';
import 'package:food/Features/search/presentation/manger/search_cubit/search_cubit.dart';
import 'package:food/Features/search/presentation/views/widgets/search_view_body.dart';

import '../../../../core/Utils/function/api_servic.dart';
import '../manger/search_cubit/search_state.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => SearchCubit(
        SearchInitial(),
        SearchRepoImpl(
          ApiService(
            Dio(),
          ),
        ),
      ),
      child:  const Scaffold(
        body: SearchViewBody(),
      ),
    );
  }
}
