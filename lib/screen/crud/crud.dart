import 'package:flutter/material.dart';
import 'package:tidgame3/model/crud_firesore_node.dart';
import 'package:tidgame3/screen/crud/addPost.dart';
import 'package:tidgame3/screen/crud/crud_post_detail.dart';
import 'package:tidgame3/service/firestore_service.dart';

class PostPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tid | Post"),
        centerTitle: true,
      ),
      body: StreamBuilder(
        stream: FirestoreService().getNotes(),
        builder: (BuildContext context, AsyncSnapshot<List<Note>> snapshot) {
          if (snapshot.hasError || !snapshot.hasData)
            return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  CircularProgressIndicator(
                    backgroundColor: Colors.red,
                  )
                ]);
          return ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (BuildContext context, int index) {
              Note note = snapshot.data[index];
              return ListTile(
                title: Text(note.game),
                subtitle: Text(note.content),
                trailing: IconButton(
                    icon: Icon(
                      Icons.delete,
                      color: Colors.green,
                    ),
                    onPressed: () => _deletePost(context,note.id)),
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => PostDetailPage(
                        note: note,
                      ),
                    )),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => AddPostPage()));
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void _deletePost(BuildContext context, String id) async {
    if (await _showConDialog(context)) {}
    try {
      await FirestoreService().deletePost(id);
      return print("Delete IdToken ${id.toString()}");
    } catch (e) {
      print(e);
    }
  }

  Future<bool> _showConDialog(BuildContext context) async {
    return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) => AlertDialog(
        content: Text("Are you sure ? "),
        actions: <Widget>[
          FlatButton(
            onPressed: () => Navigator.pop(context, true),
            child: Text("Delete"),
          ),
          FlatButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text("No"),
          ),
        ],
      ),
    );
  }
}
