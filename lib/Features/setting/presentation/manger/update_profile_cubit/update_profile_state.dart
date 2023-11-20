import 'package:food/Features/auth/data/models/login_model.dart';

abstract class UpdateProfileState {}

class UpdateProfileLoad extends UpdateProfileState {
  final LoginModel loginModel;

  UpdateProfileLoad(this.loginModel);
}

class UpdateProfileInitial extends UpdateProfileState {}

class UpdateProfileLoading extends UpdateProfileState {

}

class UpdateProfileFailure extends UpdateProfileState {
  final String errorMessage;

  UpdateProfileFailure(this.errorMessage);
}

class UpdateProfileSuccess extends UpdateProfileState {
  final LoginModel loginModel;

  UpdateProfileSuccess(this.loginModel);

}

class GetSettingLoading extends UpdateProfileState {

}

class GetProfileImageSuccess extends UpdateProfileState {

}

class GetProfileImageError extends UpdateProfileState {

}

class GetSettingFailure extends UpdateProfileState {
  final String errorMessage;

  GetSettingFailure(this.errorMessage);

}

class GetSettingSuccess extends UpdateProfileState {
  final LoginModel loginModel;

  GetSettingSuccess(this.loginModel);

}
