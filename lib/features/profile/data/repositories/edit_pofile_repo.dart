import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:hand2hand/core/errors/failure.dart';
import 'package:hand2hand/features/profile/data/models/UpdateProfileModel.dart';

abstract class EditProfileRepo {
  Future<Either<Failures, String>> logOut();

  Future<Either<Failures, UpdateProfileModel>> updateProfile(
      String name, String phone);
  Future<Either<Failures, UpdateProfileModel>> editPhoto(File? image);

}
