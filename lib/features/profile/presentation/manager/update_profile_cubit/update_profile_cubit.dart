import 'package:bloc/bloc.dart';
import 'package:hand2hand/features/profile/data/models/UpdateProfileModel.dart';
import 'package:hand2hand/features/profile/data/repositories/edit_pofile_repo.dart';
import 'package:meta/meta.dart';

part 'update_profile_state.dart';

class UpdateProfileCubit extends Cubit<UpdateProfileState> {
  UpdateProfileCubit(this.editProfileRepo) : super(UpdateProfileInitial());
  final EditProfileRepo editProfileRepo;

  Future<void> updateProfile(String name, String phone) async {
    emit(UpdateProfileLoading());
    final res = await editProfileRepo.updateProfile(name, phone);

    res.fold((failure) {
      emit(UpdateProfileFailure(failure.errorMessage));
    }, (success) {
      emit(UpdateProfileSuccess(success));
    });
  }
}
