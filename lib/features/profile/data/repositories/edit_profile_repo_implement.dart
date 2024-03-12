import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:hand2hand/core/errors/failure.dart';
import 'package:hand2hand/core/utils/api_service.dart';
import 'package:hand2hand/features/profile/data/models/UpdateProfileModel.dart';
import 'package:hand2hand/features/profile/data/repositories/edit_pofile_repo.dart';

class EditProfileRepoImplement extends EditProfileRepo {
  final ApiService apiService;

  EditProfileRepoImplement(this.apiService);

  @override
  Future<Either<Failures, String>> logOut() async {
    try {
      final res = await apiService.putData(endPoint: 'users/logout', data: {});

      if (res['message'] == 'success logging out') {
        return right(res['message']);
      } else {
        return left(
          ServerFailure(res['message']),
        );
      }
    } catch (e) {
      if (e is DioException) {
        return left(
          ServerFailure.fromDioError(e),
        );
      }
      return left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failures, UpdateProfileModel>> updateProfile(
      String name, String phone) async {
    try {
      final res = await apiService
          .putData(endPoint: 'users', data: {'phone': phone, 'userName': name});

      if (res['message'] == 'updated done') {
        return right(UpdateProfileModel.fromJson(res));
      } else {
        return left(
          ServerFailure(res['message']),
        );
      }
    } catch (e) {
      if (e is DioException) {
        return left(
          ServerFailure.fromDioError(e),
        );
      }
      return left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failures, UpdateProfileModel>> editPhoto(File? image) async {
    try {
      FormData formData = FormData.fromMap({
        'image':
            await MultipartFile.fromFile(image!.path, filename: 'file.jpg'),
      });

      final res = await apiService.patchData(endPoint: 'users', data: formData);

      if (res['message'] == 'done') {
        return right(UpdateProfileModel.fromJson(res));
      } else {
        return left(
          ServerFailure(res['message']),
        );
      }
    } catch (e) {
      if (e is DioException) {
        return left(
          ServerFailure.fromDioError(e),
        );
      }
      return left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
  }
}
