import 'package:flutter/material.dart';

class AskCard extends StatelessWidget {
  const AskCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed('/AskPage');
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
