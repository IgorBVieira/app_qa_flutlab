import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Principal extends StatelessWidget {
  Principal({super.key});

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
              TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                  color: Colors.black,
                  width: 2.0,
                ))),
                controller: txtPergunta,
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      txtPergunta = TextEditingController(text: "teste");
                    },
                    child: const Text('Enviar'),
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                          side: BorderSide(
                            color: Colors.grey,
                            width: 1,
                          )),
                      color: Colors.white,
                      child: ListTile(
                        title: Text('Question $index,'),
                        subtitle: Text('Answer $index'),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
