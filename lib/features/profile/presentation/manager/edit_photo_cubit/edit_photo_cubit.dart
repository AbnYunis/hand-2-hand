import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hand2hand/features/profile/data/models/UpdateProfileModel.dart';
import 'package:hand2hand/features/profile/data/repositories/edit_pofile_repo.dart';

part 'edit_photo_state.dart';

class EditPhotoCubit extends Cubit<EditPhotoState> {
  EditPhotoCubit(this.editProfileRepo) : super(EditPhotoInitial());
  final EditProfileRepo editProfileRepo;

  Future<void> editPhoto(File? image) async {
    emit(EditPhotoLoading());
    final res = await editProfileRepo.editPhoto(image);
    res.fold((failure) {
      emit(EditPhotoFailure(failure.errorMessage));
    }, (editProfile) {
      emit(EditPhotoSuccess(editProfile));
    });
  }
}
