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

class GetSearchCharitiesLoading extends GetCharitiesState {}

class GetSearchCharitiesSuccess extends GetCharitiesState {
  final Charities charities;

  GetSearchCharitiesSuccess(this.charities);
}

class GetSearchCharitiesFailure extends GetCharitiesState {
  final String message;

  GetSearchCharitiesFailure(this.message);
}
