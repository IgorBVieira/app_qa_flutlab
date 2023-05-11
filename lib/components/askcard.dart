import 'package:flutter/material.dart';

class AskCard extends StatelessWidget {
  const AskCard({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          colorSchemeSeed: const Color(0xff6750a4), useMaterial3: true),
      home: Scaffold(
        appBar: AppBar(title: const Text('Card Examples')),
        body: Column(
          children: <Widget>[
            Spacer(),
            ElevatedCardExample(),
            Spacer(),
          ],
        ),
      ),
    );
  }
}

class ElevatedCardExample extends StatelessWidget {
  const ElevatedCardExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
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
    );
  }
}
