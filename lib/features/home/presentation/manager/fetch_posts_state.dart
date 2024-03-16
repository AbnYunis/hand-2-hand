import 'package:hand2hand/features/explore_charities/data/models/Charities.dart';
import 'package:hand2hand/features/home/data/models/one_post_model.dart';
import 'package:hand2hand/features/home/data/models/posts_model.dart';

abstract class FetchPostsState {}
final class FetchPostsInitial extends FetchPostsState {}
class FetchPostsLoading extends FetchPostsState {}

class FetchPostsSuccess extends FetchPostsState {
  final PostsModel postModel;

  FetchPostsSuccess(this.postModel);
}

class FetchPostsFailure extends FetchPostsState {
  final String message;
  FetchPostsFailure(this.message);
}

class FetchOnePostsLoading extends FetchPostsState {}

class FetchOnePostsSuccess extends FetchPostsState {
  final OnePostModel onePostModel;
  FetchOnePostsSuccess(this.onePostModel);
}

class FetchOnePostsFailure extends FetchPostsState {
  final String message;
  FetchOnePostsFailure(this.message);
}

class GetSearchCharitiesLoading extends FetchPostsState {}

class GetSearchCharitiesSuccess extends FetchPostsState {
  final Charities charities;
  GetSearchCharitiesSuccess(this.charities);
}

class GetSearchCharitiesFailure extends FetchPostsState {
  final String message;
  GetSearchCharitiesFailure(this.message);
}