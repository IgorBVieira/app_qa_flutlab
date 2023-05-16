import 'package:flutter/material.dart';

class CustomListView extends StatefulWidget {
  const CustomListView({super.key});

  @override
  State<CustomListView> createState() => _CustomListViewState();
}

class _CustomListViewState extends State<CustomListView> {
  bool likeStatus = false;
  int likeCount = 0;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      // width: double.infinity,
      // height: 400,
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
              ),
            ),
            color: Colors.white,
            child: ListTile(
              leading: CircleAvatar(
                child: Text('T'),
              ),
              title: Text('Question $index,'),
              subtitle: Text('Answer $index'),
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
          );
        },
      ),
    );
  }
}
