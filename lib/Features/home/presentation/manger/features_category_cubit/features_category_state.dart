
import 'package:food/Features/home/data/models/home_model.dart';

abstract class FeaturesCategoryState {}

class FeaturesCategoryInitial extends FeaturesCategoryState{}

class FeaturesCategoryLoading extends FeaturesCategoryState{}

class FeaturesCategoryFailure extends FeaturesCategoryState{
  final String errorMessage;

  FeaturesCategoryFailure(this.errorMessage);

}

class FeaturesCategorySuccess extends FeaturesCategoryState{
  final HomeModel homeModel;

  FeaturesCategorySuccess(this.homeModel);

}
