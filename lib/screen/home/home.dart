import 'package:checkin_app/data/states/auth/bloc.dart';
import 'package:checkin_app/data/states/auth/event.dart';
import 'package:checkin_app/screen/auth/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CheckInApp extends StatefulWidget {
  const CheckInApp({super.key});

  @override
  State<CheckInApp> createState() => _CheckInAppState();
}

class _CheckInAppState extends State<CheckInApp> {
  late AuthBloc authBloc;

  @override
  void initState() {
    authBloc = context.read<AuthBloc>();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: authBloc.authStateChanges,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasData) {
          return Column(
            children: [
              Text('Home'),
              TextButton(onPressed: () => authBloc.add(SignOut()), child: Text('Sign Out')),
            ],
          );
        } else {
          return AuthScreen();
        }
      },
    );
  }
}
