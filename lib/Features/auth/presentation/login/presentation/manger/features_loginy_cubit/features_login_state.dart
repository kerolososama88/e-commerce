
import 'package:food/Features/auth/data/models/login_model.dart';

abstract class LoginState {}

class FeaturesLoginInitial extends LoginState{}

class FeaturesLoginLoading extends LoginState{}


class FeaturesLoginFailure extends LoginState{
  final String errorMessage;

  FeaturesLoginFailure(this.errorMessage);



}

class FeaturesLoginSuccess extends LoginState{
  final LoginModel loginModel;

  FeaturesLoginSuccess(this.loginModel);



}

class LoginChangePasswordVisibilityState extends LoginState{}