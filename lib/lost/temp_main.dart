import 'views/main_app.dart';
import 'package:flutter/material.dart';
import 'views/tabbar.dart';
import 'components/fab.dart';
import 'components/askcard.dart';
import 'components/likecard.dart';
import 'views/ask_page.dart';

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
        initialRoute: '/tabbar',
        routes: {
          '/MainApp': (context) => MainApp(),
          '/tabbar': (context) => TabBarExample(),
          '/fab': (context) => FAB(),
          '/askcard': (context) => AskCard(),
          '/likecard': (context) => LikeCard(),
          '/askpage': (context) => AskPage(),
        });
  }
}
