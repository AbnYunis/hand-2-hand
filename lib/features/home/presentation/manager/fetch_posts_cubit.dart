import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hand2hand/features/home/data/repositories/home_repo.dart';
import 'package:hand2hand/features/home/presentation/manager/fetch_posts_state.dart';

class FetchPostsCubit extends Cubit<FetchPostsState> {
  FetchPostsCubit(this.homeRepo) : super(FetchPostsInitial());
  final HomeRepo homeRepo;

  Future<void> fetchPosts() async {
    emit(FetchPostsLoading());
    final res = await homeRepo.fetchPosts();
    res.fold((failure) {
      emit(FetchPostsFailure(failure.errorMessage));
    }, (posts) {
      emit(FetchPostsSuccess(posts));
    });
  }
  Future<void> fetchOnePosts(String id) async {
    emit(FetchOnePostsLoading());
    final res = await homeRepo.fetchOnePost(id);
    res.fold((failure) {
      emit(FetchOnePostsFailure(failure.errorMessage));
    }, (onePost) {
      emit(FetchOnePostsSuccess(onePost));
    });
  }
}
