import 'package:flutter/material.dart';

class Fab extends StatelessWidget {
  const Fab({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: FabButton(),
    );
  }
}

class FabButton extends StatelessWidget {
  const FabButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.of(context).pushNamed('/AskPage');
      },
      backgroundColor: Colors.green,
      child: const Icon(Icons.plus_one),
    );
  }
}
