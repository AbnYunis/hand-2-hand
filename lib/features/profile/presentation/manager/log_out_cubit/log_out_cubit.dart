import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hand2hand/features/profile/data/repositories/edit_pofile_repo.dart';

part 'log_out_state.dart';

class LogOutCubit extends Cubit<LogOutState> {
  LogOutCubit(this.editProfileRepo) : super(LogOutInitial());
  final EditProfileRepo editProfileRepo;

  Future<void> logOut() async {
    emit(LogOutLoading());
    final res = await editProfileRepo.logOut();

    res.fold((failure) {
      emit(LogOutFailure(failure.errorMessage));
    }, (success) {
      emit(LogOutSuccess(success));
    });
  }
}
