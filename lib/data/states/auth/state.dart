import 'package:checkin_app/data/models/auth.dart';

class AuthState {
  const AuthState();
  List<Object?> get props => [];
}

class AuthInitial extends AuthState {}

class AuthLogin extends AuthState {
  final UserLogin userLogin;

  const AuthLogin({required this.userLogin});

  @override
  List<Object?> get props => [userLogin];
}

class AuthLoading extends AuthState {
  const AuthLoading();
}

class AuthSuccess extends AuthState {
  const AuthSuccess();
}

class AuthError extends AuthState {
  final String message;

  const AuthError(this.message);

  @override
  List<Object> get props => [message];
}
