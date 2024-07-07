import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hand2hand/features/Auth/presentation/manager/auth_cubit/auth_state.dart';

import '../../../data/repositories/auth_repo.dart';


class AuthCubit extends Cubit<AuthState> {


  AuthCubit(this.authRepo) : super(AuthInitial());
  final AuthRepo authRepo;

  Future<void> login({required String email, required String password}) async {
    emit(AuthLoading());
    final res = await authRepo.login(email, password);

    res.fold((failure) {
      emit(AuthFailure(failure.errorMessage));
    }, (login) {
      emit(AuthSuccess(login));
    });
  }

  Future<void> register({
    required String email,
    required String password,
    required String rePassword,
    required String phone,
    required String userName,
    required String image,
  }) async {
    emit(AuthLoading());
    final res = await authRepo.register(
      email,
      password,
      rePassword,
      phone,
      userName, image
    );
    res.fold((failure) {
      emit(AuthFailure(failure.errorMessage));
    }, (register) {
      emit(AuthSuccess(register));
    });
  }
}
