part of 'authentication_bloc.dart';

sealed class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();
  @override
  List<Object?> get props => [];
}

class LoginPressedEvent extends AuthenticationEvent {
  final String username;
  final String password;

  LoginPressedEvent(this.username, this.password);
  @override
  List<Object?> get props => [username, password];
}
