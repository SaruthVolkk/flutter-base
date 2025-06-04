import 'package:checkin_app/data/states/auth/bloc.dart';
import 'package:checkin_app/data/states/auth/event.dart';
import 'package:checkin_app/data/states/auth/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final TextEditingController emailCtrl = TextEditingController();
  final TextEditingController passCtrl = TextEditingController();
  late AuthBloc authBloc;

  bool isLogin = true;

  @override
  void initState() {
    authBloc = context.read<AuthBloc>();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void submit() {
    final email = emailCtrl.text.trim();
    final password = passCtrl.text.trim();

    if (isLogin) {
      authBloc.add(SingIn(email, password));
    } else {
      authBloc.add(SingIn(email, password));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(isLogin ? 'Login' : 'Register')),
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Success!')),
            );
          } else if (state is AuthError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              TextField(controller: emailCtrl, decoration: InputDecoration(labelText: 'Email')),
              TextField(controller: passCtrl, decoration: InputDecoration(labelText: 'Password'), obscureText: true),
              SizedBox(height: 20),
              BlocBuilder<AuthBloc, AuthState>(
                builder: (context, state) {
                  if (state is AuthLoading) {
                    return CircularProgressIndicator();
                  }
                  return ElevatedButton(
                    onPressed: submit,
                    child: Text(isLogin ? 'Login' : 'Register'),
                  );
                },
              ),
              TextButton(
                onPressed: () => setState(() => isLogin = !isLogin),
                child: Text(isLogin ? 'No account? Register' : 'Have an account? Login'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
