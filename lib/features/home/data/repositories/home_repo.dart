import 'package:dartz/dartz.dart';
import 'package:hand2hand/core/errors/failure.dart';
import 'package:hand2hand/features/explore_charities/data/models/Charities.dart';
import 'package:hand2hand/features/home/data/models/one_post_model.dart';
import 'package:hand2hand/features/home/data/models/posts_model.dart';


abstract class HomeRepo {
  Future<Either<Failures, PostsModel>> fetchPosts();
  Future<Either<Failures, OnePostModel>> fetchOnePost(String id);
  Future<Either<Failures, Charities>> searchCharities(String key);
}
