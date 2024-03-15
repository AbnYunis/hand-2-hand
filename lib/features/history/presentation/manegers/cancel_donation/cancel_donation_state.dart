part of 'cancel_donation_cubit.dart';

@immutable
abstract class CancelDonationState {}

class CancelDonationInitial extends CancelDonationState {}
class DonationCanceledFailure extends CancelDonationState {
  final String message;

  DonationCanceledFailure(this.message);
}
class DonationCanceledLoading extends CancelDonationState {}
class DonationCanceledSuccess extends CancelDonationState {}
