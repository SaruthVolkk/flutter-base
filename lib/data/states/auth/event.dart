import 'package:checkin_app/data/models/product.dart';

abstract class AuthEvent {
  const AuthEvent();
  List<Object> get props => [];
}

class SingIn extends AuthEvent {
  final String email;
  final String password;

  const SingIn(this.email, this.password);

  @override
  List<Object> get props => [email, password];
}

class SignOut extends AuthEvent {
  const SignOut();

  @override
  List<Object> get props => [];
}
