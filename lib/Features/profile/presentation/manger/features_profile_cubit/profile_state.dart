import 'package:food/Features/auth/data/models/login_model.dart';

abstract class ProfileState {}

class FeaturesProfileInitial extends ProfileState {}

class FeaturesProfileLoading extends ProfileState {}

class FeaturesProfileFailure extends ProfileState {
  final String errorMessage;

  FeaturesProfileFailure(this.errorMessage);
}

class FeaturesProfileSuccess extends ProfileState {
  final LoginModel loginModel;

  FeaturesProfileSuccess(this.loginModel);
}

