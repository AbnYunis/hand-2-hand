import 'package:dartz/dartz.dart';
import 'package:hand2hand/core/errors/failure.dart';
import 'package:hand2hand/features/Auth/data/models/confirm_email_model.dart';
import 'package:hand2hand/features/Auth/data/models/generate_otp_model.dart';
import 'package:hand2hand/features/Auth/data/models/register_model.dart';


abstract class AuthRepo {
  Future<Either<Failures, AuthModel>> login(String email, String password);

  Future<Either<Failures, AuthModel>> register(
    String email,
    String password,
    String rePassword,
    String phone,
    String userName,
  );

  Future<Either<Failures, GenerateOtp>> generateOtp(String email);

  Future<Either<Failures, ConfirmEmailModel>> confirmEmailByOtp(
      String id, String otp, bool isRegister);

  // Future<Either<Failures, String>> resetPassword(
  //     String password, Map<String, dynamic> data);
}
