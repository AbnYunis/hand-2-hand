import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:hand2hand/core/errors/failure.dart';
import 'package:hand2hand/core/utils/api_service.dart';
import 'package:hand2hand/features/donate/data/repositories/make_donation_repo.dart';

class MakeDonationRepoImplement extends MakeDonationRepo {
  final ApiService apiService;

  MakeDonationRepoImplement(this.apiService);

  @override
  Future<Either<Failures, String>> makeDonation(
      Map<String, dynamic> data) async {
    try {
      FormData formData = FormData.fromMap({
        'image': await MultipartFile.fromFile(
          data['image'],
          filename: 'file.jpg',
        ),
        'donationType': data['donationType'],
        'desc': data['desc'],
        'location': data['location'],
        'charity': data['id'],
        'amount': data['amount']
      });
      print(formData.fields);
      final res =
          await apiService.postData(endPoint: 'donations', data: formData);

      if (res['message'] == 'success') {
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
}
