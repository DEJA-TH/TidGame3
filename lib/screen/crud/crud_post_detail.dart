import 'package:flutter/material.dart';
import 'package:tidgame3/model/crud_firesore_node.dart';

class PostDetailPage extends StatelessWidget {
  final Note note;

  const PostDetailPage({Key key,@required this.note}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tid | Post "),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
//            Image.network(_image),
              Text(note.game),
            const SizedBox(height: 20,),
            Text(note.content),
          ],
        ),
      ),
    );
  }
}
