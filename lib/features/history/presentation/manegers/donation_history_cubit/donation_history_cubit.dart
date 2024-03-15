import 'package:bloc/bloc.dart';
import 'package:hand2hand/features/history/data/models/history_model.dart';
import 'package:hand2hand/features/history/data/repositories/history_repo.dart';
import 'package:meta/meta.dart';

part 'donation_history_state.dart';

class DonationHistoryCubit extends Cubit<DonationHistoryState> {
  DonationHistoryCubit(this.historyRepo) : super(DonationHistoryInitial());
  final HistoryRepo historyRepo;

  Future<void> getDonationHistory() async {
    emit(DonationHistoryLoading());
    final res = await historyRepo.getDonationHistory();
    res.fold((failure) {
      emit(DonationHistoryFailure(failure.errorMessage));
    }, (donationHistory) {
      emit(DonationHistorySuccess(donationHistory));
    });
  }

}
