import 'package:flutter/material.dart';
import 'tabbar.dart';

// ignore: must_be_immutable
class MainApp extends StatelessWidget {
  MainApp({super.key});

  TextEditingController txtPergunta = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Q&A'),
        ),
        body: Container(
          margin: EdgeInsets.all(10),
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  print("funcionei");
                },
                child: Card(
                  child: SizedBox(
                    width: 300,
                    height: 100,
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          CircleAvatar(
                            backgroundColor: Color(0xffffffff),
                            child: const Text('AH'),
                          ),
                          Text('Escreva sua pergunta'),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: SizedBox(
                  height: 100,
                  child: TabBarExample(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
