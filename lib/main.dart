import 'main_app.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'register.dart';
import 'login.dart';

const firebaseConfig = FirebaseOptions(
    apiKey: "AIzaSyBrgRowXHVv2rTsEqFyQja3P61NNBzpVtI",
    authDomain: "app-qa-a1600.firebaseapp.com",
    projectId: "app-qa-a1600",
    storageBucket: "app-qa-a1600.appspot.com",
    messagingSenderId: "783403749043",
    appId: "1:783403749043:web:f6110ca7980a64e41d2ac6",
    measurementId: "G-5H13QQBRF9");

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: firebaseConfig,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/Login',
        routes: {
          '/MainApp': (context) => MainApp(),
          '/Register': (context) => const RegisterPage(),
          '/Login': (context) => const LoginPage(),
        });
  }
}
