import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food/Features/search/data/repos/search_repo.dart';
import 'package:food/Features/search/presentation/manger/search_cubit/search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(
    super.initialState,
    this.searchRepo,
  );
  var formKey=GlobalKey<FormState>();
  var searchController= TextEditingController();

  static SearchCubit get(context) => BlocProvider.of(context);

  final SearchRepo searchRepo;

  Future<void> fetchSearch({required text}) async {
    if (formKey.currentState!.validate()) {
      emit(SearchLoading());
      var result = await searchRepo.fetchSearch(
          text:searchController.text,
      );
      result.fold((failure) {
        emit(SearchFailure(failure.errorMessage));
      }, (searchModel) {
        emit(SearchSuccess(searchModel));
      });
    }
  }
}
