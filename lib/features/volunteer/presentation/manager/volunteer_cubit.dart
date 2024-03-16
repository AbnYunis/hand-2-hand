import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hand2hand/features/volunteer/data/repositories/volunteer_repo.dart';
import 'package:hand2hand/features/volunteer/presentation/manager/volunteer_state.dart';

class VolunteerCubit extends Cubit<VolunteerState> {
  VolunteerCubit(this.volunteerRepo) : super(VolunteerInitial());
  final VolunteerRepo volunteerRepo;

  Future<void> volunteer(String id) async {
    emit(VolunteerLoading());
    final res = await volunteerRepo.volunteer(id);
    res.fold((failure) {
      emit(VolunteerFailure(failure.errorMessage));
    }, (message) {
      emit(VolunteerSuccess(message));
    });
  }
}
