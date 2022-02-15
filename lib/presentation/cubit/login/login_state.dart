part of 'login_cubit.dart';

abstract class LoginState extends Equatable {
  const LoginState();
}

class UserInitial extends LoginState {
  @override
  List<Object> get props => [];
}

class UserLoading extends LoginState {
  @override
  List<Object> get props => [];
}

class UserFailure extends LoginState {
  final String? error;
  const UserFailure({required this.error});
  @override
  List<Object> get props => [error!];
}

class UserSuccess extends LoginState {
  @override
  List<Object> get props => [];
}
