
import 'package:food/Features/auth/data/models/login_model.dart';

abstract class FeaturesRegisterState {}

class FeaturesRegisterInitial extends FeaturesRegisterState{}

class FeaturesRegisterLoading extends FeaturesRegisterState{}


class FeaturesRegisterFailure extends FeaturesRegisterState{
  final String errorMessage;

  FeaturesRegisterFailure(this.errorMessage);

}

class FeaturesRegisterSuccess extends FeaturesRegisterState{
  final LoginModel loginModel;

  FeaturesRegisterSuccess(this.loginModel);


}

class RegisterChangePasswordVisibilityState extends FeaturesRegisterState{}