part of 'update_profile_cubit.dart';

@immutable
abstract class UpdateProfileState {}

class UpdateProfileInitial extends UpdateProfileState {}

class UpdateProfileLoading extends UpdateProfileState {}

class UpdateProfileSuccess extends UpdateProfileState {
  final UpdateProfileModel updateProfileModel;

  UpdateProfileSuccess(this.updateProfileModel);
}

class UpdateProfileFailure extends UpdateProfileState {
  final String message;

  UpdateProfileFailure(this.message);
}
