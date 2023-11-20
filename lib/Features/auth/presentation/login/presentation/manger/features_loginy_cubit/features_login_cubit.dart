import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food/Features/auth/presentation/login/presentation/manger/features_loginy_cubit/features_login_state.dart';
import 'package:food/Features/home/presentation/views/home_view.dart';
import 'package:food/core/Utils/function/cache_helper.dart';
import 'package:food/core/Utils/widgets/custom_show_toast.dart';
import '../../../../../data/repos/repos/auth_repo.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthRepo authRepo;
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  LoginCubit(super.initialState, this.authRepo);

  static LoginCubit get(context) => BlocProvider.of(context);

  Future<void> fetchLogin({
    required BuildContext context,
  }) async {
    if (formKey.currentState!.validate()) {
      emit(FeaturesLoginLoading());
      var result = await authRepo.fetchLogin(
        email: emailController.text,
        password: passwordController.text,
      );
      result.fold(
        (failure) {
          emit(FeaturesLoginFailure(failure.errorMessage));
          showToast(
            text: failure.errorMessage,
            state: ToastState.ERROR,
          );
        },
        (loginModel) {
          emit(FeaturesLoginSuccess(loginModel));
          showToast(
            text: '${loginModel.message}',
            state: ToastState.SUCCESS,
          );
          CacheHelper.saveData(
            key: 'token',
            value: loginModel.data!.token,
          );
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => const HomeView(),
            ),
          );
        },
      );
    }
  }

  Icon suffix = const Icon(Icons.visibility);
  bool isPassword = true;

  changePasswordVisibility() {
    isPassword = !isPassword;
    emit(LoginChangePasswordVisibilityState());
  }

  Widget suffixWidget() {
    return isPassword
        ? IconButton(
            icon: const Icon(Icons.visibility_off),
            onPressed: () => changePasswordVisibility(),
          )
        : IconButton(
            icon: const Icon(Icons.visibility),
            onPressed: () => changePasswordVisibility(),
          );
  }
}
