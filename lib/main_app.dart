import 'package:appqa/components/ask_page.dart';
import 'package:flutter/material.dart';
import 'components/listview.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MainApp extends StatelessWidget {
  MainApp({super.key});

  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Q&A'),
          actions: [
            IconButton(
                onPressed: () {
                  auth.signOut();
                  Navigator.of(context).pushNamed('/Login');
                },
                icon: const Icon(Icons.logout))
          ],
        ),
        body: const Column(
          children: [
            MyCustomForm(),
            CustomListView(),
          ],
        ),
      ),
    );
  }
}
