import 'components/tela1.dart';
import 'package:flutter/material.dart';
import 'components/tabbar.dart';
import 'components/fab.dart';
import 'components/askcard.dart';
import 'components/likecard.dart';

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
        initialRoute: '/likecard',
        routes: {
          '/tela1': (context) => Tela1(),
          '/tabbar': (context) => TabBarApp(),
          '/fab': (context) => FAB(),
          '/askcard': (context) => AskCard(),
          '/likecard': (context) => LikeCard(),
        });
  }
}
