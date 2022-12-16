part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class Authorized extends AuthState {}

class Unauthorized extends AuthState {}

class AuthFailure extends AuthState {
  final String message;

  const AuthFailure({
    required this.message,
  });

  @override
  List<Object> get props => [message];
}
