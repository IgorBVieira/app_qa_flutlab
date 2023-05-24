import 'package:flutter/material.dart';

/// Flutter code sample for [ListTile].

class LikeCard extends StatelessWidget {
  const LikeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      home: ListTileExample(),
    );
  }
}

class ListTileExample extends StatefulWidget {
  ListTileExample({super.key});

  @override
  State<ListTileExample> createState() => _ListTileExampleState();
}

class _ListTileExampleState extends State<ListTileExample> {
  bool likeStatus = false;
  int likeCount = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ListTile Sample')),
      body: ListView(
        children: <Widget>[
          Divider(height: 0),
          ListTile(
            leading: CircleAvatar(child: Text('C')),
            title: Text('NOME'),
            subtitle: Text(
                "Longer supporting text to demonstrate how the text wraps and how setting 'ListTile.isThreeLine = true' aligns leading and trailing widgets to the top vertically with the text."),
            trailing: SizedBox(
              width: 50,
              child: Row(
                children: [
                  Text('$likeCount'),
                  IconButton(
                      onPressed: () {
                        setState(() {
                          likeStatus = !likeStatus;
                          if (likeStatus) {
                            likeCount++;
                          } else {
                            likeCount--;
                          }
                        });
                        print('$likeStatus');
                      },
                      icon: likeStatus
                          ? const Icon(Icons.thumb_up)
                          : const Icon(Icons.thumb_up_outlined)),
                ],
              ),
            ),
            isThreeLine: true,
          ),
          Divider(height: 0),
        ],
      ),
    );
  }
}
