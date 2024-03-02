import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hand2hand/features/Auth/data/models/generate_otp_model.dart';
import 'package:hand2hand/features/Auth/data/repositories/auth_repo.dart';
part 'generate_otp_state.dart';

class GenerateOtpCubit extends Cubit<GenerateOtpState> {
  GenerateOtpCubit(this.authRepo) : super(GenerateOtpInitial());
  final AuthRepo authRepo;
  int? otp;

  Future<void> generateOtp({required String email}) async {
    emit(GenerateOtpLoading());
    final res = await authRepo.generateOtp(email);
    res.fold((failure) {

      emit(GenerateOtpFailure(message: failure.errorMessage));
    }, (otp) {
      emit(GenerateOtpSuccess(generateOtp: otp));
    });
  }
}
