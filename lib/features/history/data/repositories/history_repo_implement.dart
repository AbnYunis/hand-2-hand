import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:hand2hand/core/errors/failure.dart';
import 'package:hand2hand/core/utils/api_service.dart';
import 'package:hand2hand/features/history/data/models/history_model.dart';
import 'package:hand2hand/features/history/data/repositories/history_repo.dart';

class HistoryRepoImplement extends HistoryRepo {
  final ApiService apiService;

  HistoryRepoImplement(this.apiService);

  @override
  Future<Either<Failures, DonationHistoryModel>> getDonationHistory() async {
    try {
      final res = await apiService.getData(endPoint: 'donations');
      if (res['message'] == 'success') {
        return right(DonationHistoryModel.fromJson(res));
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
  Future<Either<Failures, String>> cancelDonation(String id) async {
    try {
      final res =
          await apiService.patchData(endPoint: 'donations/$id', data: {});

      if (res['message'] == 'success , donation has canceled') {
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
