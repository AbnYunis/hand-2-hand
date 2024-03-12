import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:hand2hand/core/functions/location_fun.dart';
import 'package:hand2hand/features/donate/data/repositories/make_donation_repo.dart';
import 'package:meta/meta.dart';

part 'make_donation_state.dart';

class MakeDonationCubit extends Cubit<MakeDonationState> {
  MakeDonationCubit(this.makeDonationRepo) : super(MakeDonationInitial());
  final MakeDonationRepo makeDonationRepo;
  TextEditingController desController = TextEditingController();
  bool isImage = false;
  Future<void> makeDonation(Map<String, dynamic> data) async {
    emit(MakeDonationLoading());
    final res = await makeDonationRepo.makeDonation(data);
    res.fold((failure) {
      emit(MakeDonationFailure(failure.errorMessage));
    }, (success) {
      emit(MakeDonationSuccess(success));
    });
  }

  void changeIsImage(change) {
    isImage = change;
    emit(ChangeIsImage());
  }


  void changeController() async {
    emit(AddLocationLoading());
    if (await requestLocationPermissionAndRetrieveLocation() !=
        "Permission denied by user") {
      desController.text = await requestLocationPermissionAndRetrieveLocation();
      emit(FillControllerSuccess());
    } else {
      emit(FillControllerFailure());
    }
  }
}
