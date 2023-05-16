import 'package:appqa/components/ask_page.dart';
import 'package:flutter/material.dart';
// import 'components/askcard.dart';
// import 'components/fab.dart';
import 'components/listview.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Q&A'),
        ),
        body: Column(
          children: [
            MyCustomForm(),
            CustomListView(),
          ],
        ),
      ),
    );
  }
}