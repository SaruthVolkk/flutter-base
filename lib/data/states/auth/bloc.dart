import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:checkin_app/data/service/auth.dart';
import 'package:checkin_app/data/states/auth/event.dart';
import 'package:checkin_app/data/states/auth/state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthService authService = AuthService();
  User? userData;

  AuthBloc() : super(AuthInitial()) {
    on<SingIn>(signIn);
    on<SignOut>(signOut);
  }

  void signIn(SingIn event, Emitter<AuthState> emit) async {
    try {
      emit(const AuthLoading());
      userData = await authService.signIn(event.email, event.password);
      return emit(const AuthSuccess());
    } catch (error) {
      emit(AuthError(error.toString()));
    }
  }

  void signOut(SignOut event, Emitter<AuthState> emit) async {
    try {
      await authService.signOut();
      userData = null;
      emit(AuthInitial());
    } catch (error) {
      emit(AuthError(error.toString()));
    }
  }

  Stream<User?> get authStateChanges {
    return authService.authStateChanges;
  }
}
