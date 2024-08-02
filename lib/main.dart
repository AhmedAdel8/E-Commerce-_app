// ignore_for_file: prefer_const_constructors

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_18/Screens/checkout.dart';
import 'package:flutter_application_18/Screens/details_screen.dart';
import 'package:flutter_application_18/Screens/home.dart';
import 'package:flutter_application_18/Screens/login.dart';
import 'package:flutter_application_18/Screens/register.dart';
import 'package:flutter_application_18/firebase_options.dart';
import 'package:flutter_application_18/provider/cart.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.android,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        return Cart();
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Register(),
      ),
    );
  }
}
