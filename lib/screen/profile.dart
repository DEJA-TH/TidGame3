import 'package:flutter/material.dart';
import 'package:http/http.dart' as Http;
import 'dart:convert';

class ProfilePage extends StatefulWidget {
//  ProfilePage({Key key,}):super(key:key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    // TODO: implement initState
    getDataAPI.getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FutureBuilder(future: getDataAPI.getData(),
                  builder: (context, snapshot) {
                if (snapshot.hasData) {
                  todoMessage msg = snapshot.data;
                  print("Snapshot  = " + msg.message);
                  return Text(msg.status);
                } else {
                  return Text("Error");
                }
              }),
            ]),
      ),
    );
  }
}

class getDataAPI {
  static Future <todoMessage> getData() async {
    var url = "https://dog.ceo/api/breeds/image/random";
    var response = await Http.get(url);
    Map map = json.decode(response.body);
    todoMessage msg = todoMessage.fromJson(map);
    print("URL image = " + msg?.message);
    return msg;
  }
}

class todoMessage {
  String status;
  String message;


  todoMessage({this.status, this.message});

  todoMessage.fromJson(Map<String, dynamic> json) {
//    userId = json['userId'];
//    id =json['id'];
//    title = json['json'];
    status = json['status'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
//    data['title'] = this.title;
    return data;
  }
}
