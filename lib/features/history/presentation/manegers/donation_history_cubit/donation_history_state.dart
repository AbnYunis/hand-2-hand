part of 'donation_history_cubit.dart';

@immutable
abstract class DonationHistoryState {}

class DonationHistoryInitial extends DonationHistoryState {}

class DonationHistoryLoading extends DonationHistoryState {}

class DonationHistorySuccess extends DonationHistoryState {
  final DonationHistoryModel donationHistoryModel;

  DonationHistorySuccess(this.donationHistoryModel);
}

class DonationHistoryFailure extends DonationHistoryState {
  final String message;

  DonationHistoryFailure(this.message);
}
