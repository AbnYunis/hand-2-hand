part of 'edit_photo_cubit.dart';


abstract class EditPhotoState {}

class EditPhotoInitial extends EditPhotoState {}

class EditPhotoLoading extends EditPhotoState {}

class EditPhotoSuccess extends EditPhotoState {
  final UpdateProfileModel updateProfileModel;

  EditPhotoSuccess(this.updateProfileModel);
}

class EditPhotoFailure extends EditPhotoState {
  final String message;

  EditPhotoFailure(this.message);
}
