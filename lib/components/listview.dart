import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class CustomListView extends StatefulWidget {
  const CustomListView({super.key});

  @override
  State<CustomListView> createState() => _CustomListViewState();
}

class _CustomListViewState extends State<CustomListView> {
  bool likeStatus = false;
  int likeCount = 0;

  final Stream<QuerySnapshot> _perguntasStream =
      FirebaseFirestore.instance.collection('perguntas').snapshots();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: StreamBuilder<QuerySnapshot>(
          stream: _perguntasStream,
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return Text('Something went wrong');
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            }

            return Container(
              child: ListView(
                  children: snapshot.data!.docs.map(
                (DocumentSnapshot document) {
                  Map<String, dynamic> data =
                      document.data()! as Map<String, dynamic>;
                  return Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                      side: const BorderSide(
                        color: Colors.grey,
                        width: 1,
                      ),
                    ),
                    color: Colors.white,
                    child: ListTile(
                      leading: const CircleAvatar(
                        child: Text('T'),
                      ),
                      title: Text(data['nome']),
                      subtitle: Text(data['pergunta']),
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
                                  // ignore: avoid_print
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
                  );
                },
              ).toList()),
            );
          }),
    );
  }
}


// TODO: listview precisa conversar com o banco para recuperar dados