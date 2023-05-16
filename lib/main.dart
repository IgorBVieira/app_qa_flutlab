import 'main_app.dart';
import 'package:flutter/material.dart';
// import 'ask_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/MainApp',
        routes: {
          '/MainApp': (context) => const MainApp(),
          // '/AskPage': (context) => const AskPage(),
        });
  }
}
