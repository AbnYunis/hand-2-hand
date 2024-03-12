part of 'make_donation_cubit.dart';

@immutable
abstract class MakeDonationState {}

class MakeDonationInitial extends MakeDonationState {}

class MakeDonationLoading extends MakeDonationState {}

class MakeDonationSuccess extends MakeDonationState {
  final String message;

  MakeDonationSuccess(this.message);
}

class MakeDonationFailure extends MakeDonationState {
  final String message;

  MakeDonationFailure(this.message);
}

class AddLocationLoading extends MakeDonationState {}

class FillControllerSuccess extends MakeDonationState {}

class ChangeIsImage extends MakeDonationState {}

class FillControllerFailure extends MakeDonationState {}
