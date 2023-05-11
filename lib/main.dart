import 'components/principal.dart';
import 'package:flutter/material.dart';
import 'components/tabbar.dart';
import 'components/fab.dart';
import 'components/askcard.dart';
import 'components/likecard.dart';
import 'components/askpage.dart';

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
        initialRoute: '/askpage',
        routes: {
          '/principal': (context) => Principal(),
          '/tabbar': (context) => TabBarApp(),
          '/fab': (context) => FAB(),
          '/askcard': (context) => AskCard(),
          '/likecard': (context) => LikeCard(),
          '/askpage': (context) => AskPage(),
        });
  }
}
