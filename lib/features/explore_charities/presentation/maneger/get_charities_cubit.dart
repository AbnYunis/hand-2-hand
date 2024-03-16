import 'package:bloc/bloc.dart';
import 'package:hand2hand/features/explore_charities/data/models/Charities.dart';
import 'package:hand2hand/features/explore_charities/data/repositories/charities_repo.dart';
import 'package:meta/meta.dart';

part 'get_charities_state.dart';

class GetCharitiesCubit extends Cubit<GetCharitiesState> {
  GetCharitiesCubit(this.charitiesRepo) : super(GetCharitiesInitial());
  final CharitiesRepo charitiesRepo;

  Future<void> getAllCharities() async {
    emit(GetCharitiesLoading());
    final res = await charitiesRepo.getAllCharities();
    res.fold((failure) {
      emit(GetCharitiesFailure(failure.errorMessage));
    }, (charities) {
      emit(GetCharitiesSuccess(charities));
    });
  }
  Future<void> searchCharities(String key) async {
    emit(GetSearchCharitiesLoading());
    final res = await charitiesRepo.searchCharities(key);
    res.fold((failure) {
      emit(GetSearchCharitiesFailure(failure.errorMessage));
    }, (charities) {
      emit(GetSearchCharitiesSuccess(charities));
    });
  }
}
