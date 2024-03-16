import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:hand2hand/core/errors/failure.dart';
import 'package:hand2hand/features/volunteer/data/repositories/volunteer_repo.dart';
import '../../../../core/utils/api_service.dart';

class VolunteerRepoImplementation extends VolunteerRepo {
  final ApiService apiService;

  VolunteerRepoImplementation(this.apiService);

  @override
  Future<Either<Failures, String>> volunteer(String id) async {
    try {
      final res = await apiService.patchData(
        data: {},
        endPoint:'posts/$id',);
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
