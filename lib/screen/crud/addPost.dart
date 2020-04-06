import 'package:flutter/material.dart';
import 'package:tidgame3/service/firestore_service.dart';
import 'package:tidgame3/model/crud_firesore_node.dart';
import 'package:image_picker/image_picker.dart'; // For Image Picker
import 'package:firebase_storage/firebase_storage.dart'; // For File Upload To Firestore
import 'dart:io';
import 'package:path/path.dart' as Path;


class AddPostPage extends StatefulWidget {
  @override
  _AddPostPageState createState() => _AddPostPageState();
}

class _AddPostPageState extends State<AddPostPage> {
  GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  TextEditingController _gameController = TextEditingController();
  TextEditingController _contentController = TextEditingController();
  FocusNode _contentNode;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _gameController = TextEditingController(text: '');
    _contentController = TextEditingController(text: '');
    _contentNode = FocusNode();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tid | Post add"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(30),
        child: Form(
          key: _globalKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                controller: _gameController,
                textInputAction: TextInputAction.next,
                onEditingComplete: () {
                  FocusScope.of(context).requestFocus(_contentNode);
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Game cannot be empty";
                  }
                  return null;
                },
                maxLength: 50,
                decoration: InputDecoration(
                    labelText: 'Game Name', border: OutlineInputBorder()),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: _contentController,
                focusNode: _contentNode,
                maxLines: 5,
                decoration: InputDecoration(
                    labelText: 'Content', border: OutlineInputBorder()),
              ),
              SizedBox(
                height: 20,
              ),
              RaisedButton(
                onPressed: () async {
                  if (_globalKey.currentState.validate()) {}
                  try {
                    await FirestoreService().addPost(Note(
                        game: _gameController.text,
                        content: _contentController.text));
                    Navigator.pop(context);
                  } catch (e) {
                    return print(e);
                  }
                },
                color: Theme.of(context).accentColor,
                elevation: 10,
                child: Text(
                  "Post",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

