import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food/Features/auth/presentation/regester/presentation/manger/features_register_cubit/features_register_state.dart';
import 'package:food/Features/home/presentation/views/home_view.dart';
import 'package:food/core/Utils/function/cache_helper.dart';
import 'package:food/core/Utils/widgets/custom_show_toast.dart';
import '../../../../../data/repos/repos/auth_repo.dart';

class FeaturesRegisterCubit extends Cubit<FeaturesRegisterState> {
  final AuthRepo authRepo;
  var namedConteroller = TextEditingController();
  var phonedConteroller = TextEditingController();
  var emailConteroller = TextEditingController();
  var passwordConteroller = TextEditingController();
  var formKey = GlobalKey<FormState>();

  FeaturesRegisterCubit(super.initialState, this.authRepo);

  static FeaturesRegisterCubit get(context) => BlocProvider.of(context);

  Future<void> fetchRegister({
    required BuildContext context,
  }) async {
    if (formKey.currentState!.validate()) {
      emit(FeaturesRegisterLoading());

      var result = await authRepo.fetchRegister(
        email: emailConteroller.text,
        password: passwordConteroller.text,
        phone: phonedConteroller.text,
        name: namedConteroller.text,
      );
      print(namedConteroller);
      print(phonedConteroller);
      print(passwordConteroller);
      result. fold((failure) {
        emit(FeaturesRegisterFailure(failure.errorMessage));
        showToast(
          text: failure.errorMessage,
          state: ToastState.ERROR,
        );
      }, (loginModel) {
        showToast(
          text: '${loginModel.message}',
          state: ToastState.SUCCESS,
        );
        emit(FeaturesRegisterSuccess(loginModel));
        CacheHelper.saveData(
          key: 'token',
          value: loginModel.data!.token,
        );
        print(loginModel.data!.email);
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const HomeView(),
          ),
        );
      });
    }
  }

  Icon suffix = const Icon(Icons.visibility);
  bool isPassword = true;

  changePasswordVisibility() {
    isPassword = !isPassword;
    emit(RegisterChangePasswordVisibilityState());
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
