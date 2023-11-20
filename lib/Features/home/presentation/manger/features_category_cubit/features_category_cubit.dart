
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food/Features/home/presentation/manger/features_category_cubit/features_category_state.dart';
import 'package:food/core/Utils/widgets/custom_show_error.dart';

import '../../../data/repos/home_repo.dart';

class FeaturesCategoryCubit extends Cubit<FeaturesCategoryState> {
  final HomeRepo homeRepo;

  static FeaturesCategoryCubit of(context) => BlocProvider.of(context);

  FeaturesCategoryCubit(super.initialState, this.homeRepo);

  Future<void> fetchCategoryItems() async {
    emit(FeaturesCategoryLoading());
    var result = await homeRepo.fetchCategoryItems();
    result.fold((failure) {
      emit(FeaturesCategoryFailure(failure.errorMessage));
      print(failure.errorMessage);
      showText(text: failure.errorMessage);
    }, (homeModel) {
      emit(FeaturesCategorySuccess(homeModel));
    });
  }
}
