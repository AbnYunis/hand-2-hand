part of 'get_charities_cubit.dart';

@immutable
abstract class GetCharitiesState {}

class GetCharitiesInitial extends GetCharitiesState {}

class GetCharitiesLoading extends GetCharitiesState {}

class GetCharitiesSuccess extends GetCharitiesState {
  final Charities charities;

  GetCharitiesSuccess(this.charities);
}

class GetCharitiesFailure extends GetCharitiesState {
  final String message;

  GetCharitiesFailure(this.message);
}
