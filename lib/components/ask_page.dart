import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MyCustomForm extends StatefulWidget {
  const MyCustomForm({super.key});

  @override
  State<MyCustomForm> createState() => _MyCustomFormState();
}

class _MyCustomFormState extends State<MyCustomForm> {
  final TextEditingController _perguntaController = TextEditingController();
  final TextEditingController _nomeController = TextEditingController();

  Future<void> adicionarPergunta(Pergunta pergunta) async {
    CollectionReference perguntas =
        FirebaseFirestore.instance.collection('perguntas');
    await perguntas.add(pergunta.toMap());
  }

  Future<void> atualizarQtdLikes(String perguntaId, int novaQtdLikes) async {
    CollectionReference perguntas =
        FirebaseFirestore.instance.collection('perguntas');
    await perguntas.doc(perguntaId).update({'qtdLikes': novaQtdLikes});
  }

  Future<void> _enviarDados() async {
    String pergunta = _perguntaController.text;
    String nome = _nomeController.text;

    if (pergunta.isNotEmpty && nome.isNotEmpty) {
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        final uid = user.uid;
        final novaPergunta = Pergunta(
          id: uid,
          pergunta: pergunta,
          nome: nome,
          qtdLikes: 0,
        );
      }
      Pergunta novaPergunta =
          Pergunta(id: '', pergunta: pergunta, nome: nome, qtdLikes: 0);
      await adicionarPergunta(novaPergunta);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextField(
            controller: _perguntaController,
            maxLength: 250,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Digite sua pergunta',
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                backgroundColor: Colors.brown.shade800,
                child: const Text('TS'),
              ),
            ),
            SizedBox(
              width: 150,
              child: TextFormField(
                controller: _nomeController,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Digite seu nome',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: ElevatedButton(
                onPressed: () {
                  _enviarDados();
                },
                child: const Text('Enviar'),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class Pergunta {
  String id;
  String pergunta;
  String nome;
  int qtdLikes;

  Pergunta(
      {required this.id,
      required this.pergunta,
      required this.nome,
      required this.qtdLikes});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'pergunta': pergunta,
      'nome': nome,
      'qtdLikes': qtdLikes,
    };
  }
}
