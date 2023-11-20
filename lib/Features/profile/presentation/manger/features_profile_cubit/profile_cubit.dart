import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../profile/data/repos/profile_repo.dart';
import 'profile_state.dart';


class FeaturesProfileCubit extends Cubit<ProfileState> {
  final ProfileRepo profileRepo;


  FeaturesProfileCubit(super.initialState, this.profileRepo);

  Future<void> fetchProfile() async {
    emit(FeaturesProfileLoading());
    var result = await profileRepo.fetchProfile();
    result.fold((failure) {
      emit(FeaturesProfileFailure(failure.errorMessage));
    }, (loginModel) {
      emit(FeaturesProfileSuccess(loginModel));
    });
  }
}
