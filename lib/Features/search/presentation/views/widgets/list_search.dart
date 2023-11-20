import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food/Features/search/presentation/manger/search_cubit/search_cubit.dart';
import 'package:food/Features/search/presentation/manger/search_cubit/search_state.dart';
import 'package:food/Features/search/presentation/views/widgets/list_search_item.dart';
import 'package:food/core/Utils/widgets/custom_show_error.dart';

class ListSearch extends StatelessWidget {
  const ListSearch({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        if (state is SearchSuccess) {
          return ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: state.searchModel.data!.data!.length,
            itemBuilder: (context, index) {
              return ListSearchItems(
                name: state.searchModel.data!.data![index].name ?? '',
                image: state.searchModel.data!.data![index].image ?? '',
                description:
                    state.searchModel.data!.data![index].description ?? '',
                price: state.searchModel.data!.data![index].price ?? 0,
              );
            },
          );
        } else if (state is SearchInitial) {
          return showText(text: 'Search now');
        } else {
         return const Padding(
           padding: EdgeInsets.symmetric(horizontal: 16.0),
           child: Center(child: LinearProgressIndicator()),
         );
        }
      },
    );
  }
}
