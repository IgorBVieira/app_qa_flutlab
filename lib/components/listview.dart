import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:math';

class CustomListView extends StatefulWidget {
  const CustomListView({super.key});

  @override
  State<CustomListView> createState() => _CustomListViewState();
}

class _CustomListViewState extends State<CustomListView> {
  final Stream<QuerySnapshot> _perguntasStream = FirebaseFirestore.instance
      .collection('perguntas')
      .snapshots();

  Map<String, Color> _avatarColors = {};

  Color getAvatarColor(String id) {
    if (!_avatarColors.containsKey(id)) {
      _avatarColors[id] = getRandomColor();
    }
    return _avatarColors[id]!;
  }

  @override
  Widget build(BuildContext context) {
    final currentUser = FirebaseAuth.instance.currentUser;

    return Expanded(
      child: StreamBuilder<QuerySnapshot>(
          stream: _perguntasStream,
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return const Text('Something went wrong');
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            }

            return Container(
              child: ListView(
                  children: snapshot.data!.docs.map(
                (DocumentSnapshot document) {
                  Map<String, dynamic> data =
                      document.data()! as Map<String, dynamic>;

                  bool likeStatus = data['likedBy'] != null &&
                      (data['likedBy'] as List).contains(currentUser!.uid);
                  int likeCount = data['qtdLikes'] ?? 0;

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
                      leading: CircleAvatar(
                        backgroundColor: getAvatarColor(document.id),
                        child: Text(data['nome'][0]),
                      ),
                      title: Text(data['nome']),
                      subtitle: Text(data['pergunta']),
                      trailing: SizedBox(
                        width: 50,
                        child: Row(
                          children: [
                            Text('$likeCount'), 
                            IconButton(
                              onPressed: () async {
                                final docRef = FirebaseFirestore.instance
                                    .collection('perguntas')
                                    .doc(document.id);

                                final likedBy =
                                    List<String>.from(data['likedBy'] ?? []);
                                final newLikeStatus = !likeStatus;
                                setState(() {
                                  likeStatus = newLikeStatus;
                                });

                                if (newLikeStatus) {
                                  likedBy.add(currentUser!.uid);
                                  await docRef.update({
                                    'qtdLikes': FieldValue.increment(1),
                                    'likedBy': likedBy,
                                  });
                                } else {
                                  likedBy.remove(currentUser!.uid);
                                  await docRef.update({
                                    'qtdLikes': FieldValue.increment(-1),
                                    'likedBy': likedBy,
                                  });
                                }
                              },
                              icon: likeStatus
                                  ? const Icon(Icons.thumb_up)
                                  : const Icon(Icons.thumb_up_outlined),
                            ),
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

Color getRandomColor() {
  final random = Random();
  return Color.fromARGB(
    255,
    random.nextInt(256),
    random.nextInt(256),
    random.nextInt(256),
  );
}


// TODO: Os dados precisam ser mostrados em ordem de quem tem mais likes 
// ! Quando o card é criado ao clicar no like ele pode assumir o valor -1, isso não pode ocorrer
