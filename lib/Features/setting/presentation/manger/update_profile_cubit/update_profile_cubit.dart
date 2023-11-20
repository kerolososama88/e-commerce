import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food/Features/setting/data/repos/setting_repo.dart';
import 'package:food/Features/setting/presentation/manger/update_profile_cubit/update_profile_state.dart';
import 'package:food/core/Utils/widgets/custom_show_toast.dart';
import 'package:image_picker/image_picker.dart';

class UpdateProfileCubit extends Cubit<UpdateProfileState> {
  final SettingRepo settingRepo;
  var emailController = TextEditingController();
  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  UpdateProfileCubit(super.initialState, this.settingRepo);

  static UpdateProfileCubit get(context) => BlocProvider.of(context);

  Future<void> getProfileData() async {
    emit(GetSettingLoading());
    var result = await settingRepo.getProfileData();
    result.fold((failure) {
      emit(GetSettingFailure(failure.errorMessage));
    }, (loginModel) {
      nameController.text = loginModel.data!.name!;
      phoneController.text = loginModel.data!.phone!;
      emailController.text = loginModel.data!.email!;
      emit(GetSettingSuccess(loginModel));
    });
  }

  Future<void> updateProfile() async {
    if (formKey.currentState!.validate()) {
      emit(UpdateProfileLoading());
      var result = await settingRepo.updateProfile(
        name: nameController.text,
        phone: phoneController.text,
        email: emailController.text,
        image: '${updateProfileImage}',
      );
      result.fold((failure) {
        emit(UpdateProfileFailure(failure.errorMessage));
      }, (loginModel) {
        showToast(
          text: '${loginModel.message}',
          state: ToastState.SUCCESS,
        );
        emit(UpdateProfileSuccess(loginModel));
      });
    }
  }
  // File? profileImage;

  // Future<void> getProfileImage() async {
  //   // دا كدا علشان افتح الكاميرا
  //   final pickedFile = await picker.pickImage(
  //     source: ImageSource.gallery,
  //   );
  //   if (pickedFile != null) {
  //     profileImage = File(pickedFile.path);
  //     emit(GetProfileImageSuccess());
  //   } else {
  //     emit(GetProfileImageError());
  //   }
  // }

  File? profileImage;
  var picker = ImagePicker();
  Uint8List? bytes;
  String? image64;
  List<String> images = [];

  Future<void> updateProfileImage() async {
    final pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
    );
    if(pickedFile!=null)
      {
        profileImage=File(pickedFile.path);
        bytes=File(profileImage!.path).readAsBytesSync();
        image64=base64Encode(bytes!);
        images.add(image64!);
      }else{
      if(kDebugMode){
        print('null');
      }
    }
  }
}
