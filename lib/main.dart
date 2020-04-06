import 'package:flutter/material.dart';
import 'package:tidgame3/model/firebase_auth.dart';
import 'package:tidgame3/model/listView.dart';
import 'package:tidgame3/widget/GameListCard.dart';
import 'package:tidgame3/model/btn_bubble.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  final _routes =<String ,WidgetBuilder> {
//  '/' : (BuildContext context) =>MainScreen(),
  '/' : (BuildContext context) =>BottomNavBar(),
  };


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
          debugShowCheckedModeBanner: false,
//        home: HomePage(),
      initialRoute: '/',
      routes: _routes,
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key key}):super(key:key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFf3f6fb),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding:
                  EdgeInsets.only(left: 16, right: 16, top: 30, bottom: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Tid Game",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w800),),
//                  IconButton(
//                    icon: Icon(Icons.menu),
//                    iconSize: 35,
//                    onPressed: () {
//                      Navigator.pushNamed(context, '/chat');
//                    },
//                  ),
                  FlatButton(
                    child: Text("Log Out"),
                    onPressed: () {
                      AuthProvider().logOut();
                    },
                  ),
                ],
              ),
            ),
//            Padding(
//              padding: EdgeInsets.only(left: 25),
//              child: Text(
//                "Tid Game",
//                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
//              ),
//            ),
//            SizedBox(
//              height: 25,
//            ),
            Container(
              width: double.infinity,
              height: 60,
              margin: EdgeInsets.symmetric(horizontal: 25),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(.12),
                        offset: Offset(0, 10),
                        blurRadius: 30),
                  ]),
              child: Center(
                child: Padding(
                  padding: EdgeInsets.only(left: 18, right: 20),
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "ค้นหาเกม ...",
//                    helperStyle: searchBarStyle,
                      suffixIcon: Icon(
                        Icons.search,
                        color: Colors.grey,
                        size: 26,
                      ),
                    ),
                    onTap: (){},
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Padding(
              padding: EdgeInsets.only(left: 25),
              child: Text(
                "Top Game",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 200,
              child: ListView.builder(
                itemCount: listProduct.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  var listproduct = listProduct[index];
                  return GameListCard(
                      imgUrl: listproduct.gImg,
                      name: listproduct.gName,
                      type: listproduct.gType);
                },
              ),
            ),
            SizedBox(
              height: 20,
            ),

//            New Game
            Padding(
              padding: EdgeInsets.only(left: 25),
              child: Text(
                "New Game",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 200,
              child: ListView.builder(
                itemCount: listProduct.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  var listproduct = listProduct[index];
                  return GameListCard(
                      imgUrl: listproduct.gImg,
                      name: listproduct.gName,
                      type: listproduct.gType);
                },
              ),
            ),
            SizedBox(
              height: 20,
            )
//            End New Game
          ],
        ),
      ),

    );
  }
}
