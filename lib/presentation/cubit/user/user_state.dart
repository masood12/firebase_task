part of 'user_cubit.dart';

abstract class UserState extends Equatable {
  const UserState();
}

class UserInitial extends UserState {
  @override
  List<Object> get props => [];
}

class UserLoading extends UserState {
  @override
  List<Object> get props => [];
}

class UserFailure extends UserState {
  final String? error;
  const UserFailure({required this.error});
  @override
  List<Object> get props => [error!];
}

class UserSuccess extends UserState {
  @override
  List<Object> get props => [];
}
