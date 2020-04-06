//import 'package:flutter/material.dart';
//import 'package:tidgame3/model/listView.dart';
//
//
//class GameDetailPage extends StatelessWidget {
//  final GameList game;
//
//  const GameDetailPage({Key key,@required this.game}) : super(key: key);
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        title: Text("Tid | Game Detial"),
//        centerTitle: true,
//      ),
//      body: SingleChildScrollView(
//padding: EdgeInsets.all(30),
//        child: Column(
//          crossAxisAlignment: CrossAxisAlignment.start,
//          children: <Widget>[
//            Image.network(game.gImg),
//            SizedBox(height: 10,),
//            Text(game.gName),
//            SizedBox(height: 10,),
//            Text(game.gType),
//          ],
//        ),
//      ),
//    );
//  }
//}
