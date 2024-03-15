import 'package:bloc/bloc.dart';
import 'package:hand2hand/features/history/data/repositories/history_repo.dart';
import 'package:meta/meta.dart';

part 'cancel_donation_state.dart';

class CancelDonationCubit extends Cubit<CancelDonationState> {
  CancelDonationCubit(this.historyRepo) : super(CancelDonationInitial());
  final HistoryRepo historyRepo;

  Future<void> cancelDonation(String id) async {
    emit(DonationCanceledLoading());
    final res = await historyRepo.cancelDonation(id);
    res.fold((failure) {
      emit(DonationCanceledFailure(failure.errorMessage));
    }, (donationHistory) {
      emit(DonationCanceledSuccess());
    });
  }
}
