part of 'reset_pass_cubit.dart';

abstract class ResetPassState {}

class ResetPassInitial extends ResetPassState {}

class ResetPassLoading extends ResetPassState {}

class ResetPassSuccess extends ResetPassState {
final String message;
  ResetPassSuccess({required this.message});
}

class ResetPassFailure extends ResetPassState {
  final String message;

  ResetPassFailure({required this.message});
}
