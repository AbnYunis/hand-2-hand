
abstract class VolunteerState {}

final class VolunteerInitial extends VolunteerState {}
final class VolunteerLoading extends VolunteerState {}
final class VolunteerSuccess extends VolunteerState {
  final String message;

  VolunteerSuccess(this.message);
}
final class VolunteerFailure extends VolunteerState {
  final String errorMessage;

  VolunteerFailure(this.errorMessage);
}
