import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:checkin_app/di.dart';
import 'package:checkin_app/firebase_options.dart';
import 'package:checkin_app/screen/home/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    const GlobalBlocProviders(
      child: MaterialApp(home: CheckInApp()),
    ),
  );
}
