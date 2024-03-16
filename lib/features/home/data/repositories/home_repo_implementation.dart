import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:hand2hand/core/errors/failure.dart';
import 'package:hand2hand/features/explore_charities/data/models/Charities.dart';
import 'package:hand2hand/features/home/data/models/one_post_model.dart';
import 'package:hand2hand/features/home/data/models/posts_model.dart';
import 'package:hand2hand/features/home/data/repositories/home_repo.dart';
import '../../../../core/utils/api_service.dart';

class HomeRepoImplementation extends HomeRepo {
  final ApiService apiService;

  HomeRepoImplementation(this.apiService);

  @override
  Future<Either<Failures, PostsModel>> fetchPosts()async {
    try {
      final res = await apiService.getData(
          endPoint:'posts/all',);
      if (res['message'] == 'success') {
        return right(PostsModel.fromJson(res));
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
  Future<Either<Failures, OnePostModel>> fetchOnePost(String id) async {
    try {
      final res = await apiService.getData(
        endPoint:'posts/user/$id',);
      if (res['message'] == 'success') {
        return right(OnePostModel.fromJson(res));
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
