import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:checkin_app/data/states/auth/bloc.dart';
import 'package:checkin_app/data/states/home_page/bloc.dart';

class GlobalBlocProviders extends StatelessWidget {
  final Widget child;

  const GlobalBlocProviders({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomePageBloc>(create: (context) => HomePageBloc()),
        BlocProvider<AuthBloc>(create: (context) => AuthBloc()),
      ],
      child: child,
    );
  }
}
