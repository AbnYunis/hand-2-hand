part of 'log_out_cubit.dart';



abstract class LogOutState {}

class LogOutInitial extends LogOutState {}

class LogOutLoading extends LogOutState {}

class LogOutSuccess extends LogOutState {
  final String message;

  LogOutSuccess(this.message);
}

class LogOutFailure extends LogOutState {
  final String message;

  LogOutFailure(this.message);
}
