import 'package:food/Features/search/data/models/search_model.dart';

abstract class SearchState {}

class SearchInitial extends SearchState {

}

class SearchLoading extends SearchState {}

class SearchFailure extends SearchState {
  final String errorMessage;

  SearchFailure(this.errorMessage);
}

class SearchSuccess extends SearchState {
  final SearchModel searchModel;

  SearchSuccess(this.searchModel);
}
