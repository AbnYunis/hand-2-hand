import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:hand2hand/core/errors/failure.dart';
import 'package:hand2hand/core/utils/api_service.dart';
import 'package:hand2hand/features/explore_charities/data/models/Charities.dart';
import 'package:hand2hand/features/explore_charities/data/repositories/charities_repo.dart';

class CharitiesRepoImplement extends CharitiesRepo {
  final ApiService apiService;

  CharitiesRepoImplement(this.apiService);

  @override
  Future<Either<Failures, Charities>> getAllCharities() async {
    try {
      final res = await apiService.getData(endPoint: 'charities/allcharities');

      if (res['message'] == 'success') {
        return right(Charities.fromJson(res));
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
  Future<Either<Failures, Charities>> searchCharities(String key) async{
    try {
      final res = await apiService.getData(endPoint: 'charities/search?searchKey=$key');

      if (res['message'] == 'success') {
        return right(Charities.fromJson(res));
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
