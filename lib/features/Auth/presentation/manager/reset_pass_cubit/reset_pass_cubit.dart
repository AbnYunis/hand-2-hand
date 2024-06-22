import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hand2hand/features/Auth/data/repositories/auth_repo.dart';
part 'reset_pass_state.dart';

class ResetPassCubit extends Cubit<ResetPassState> {
  ResetPassCubit(this.authRepo) : super(ResetPassInitial());
  final AuthRepo authRepo;
  int? otp;

  Future<void> resetPassOtp({required String pass,required Map<String, dynamic> data}) async {
    emit(ResetPassLoading());
    final res = await authRepo.resetPassword(pass,data);
    res.fold((failure) {

      emit(ResetPassFailure(message: failure.errorMessage));
    }, (l) {
      emit(ResetPassSuccess(message:l));
    });
  }
}
