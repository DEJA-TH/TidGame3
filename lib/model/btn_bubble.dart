import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:tidgame3/main.dart';
import 'package:tidgame3/screen/chat.dart';
import 'package:tidgame3/screen/crud/crud.dart';
import 'package:tidgame3/screen/login/login.dart';
import 'package:tidgame3/screen/login/splash.dart';
import 'package:tidgame3/screen/vote/vote.dart';

void main() => runApp(MaterialApp(home: BottomNavBar()));

class BottomNavBar extends StatefulWidget {
  final FirebaseUser user;

  const BottomNavBar({Key key, this.user}) : super(key: key);

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int pageIndex = 0;
  final HomePage _homePage = HomePage();
  final PostPage _postPage = new PostPage();
  final ChatPage _chatPage = new ChatPage();
  final Vote _vote = new Vote();

//  final PostPage   =new PostPage();
//  final HomeChat _chat =new Chat();

  Widget _showPage = new HomePage();

  Widget _pageChoose(int page) {
    switch (page) {
      case 0:
        return _homePage;
        break;
      case 1:
        return _postPage;
        break;
      case 2:
        return _chatPage;
        break;
      case 3:
        return _vote;
        break;
      default:
        return Container(
          child: Center(
            child: Text('Not Page !!!'),
          ),
        );
    }
  }

  GlobalKey _bottomNavigationKey = GlobalKey();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          key: _bottomNavigationKey,
          index: pageIndex,
          height: 50.0,
          items: <Widget>[
            Icon(Icons.home, size: 30),
            Icon(Icons.chat, size: 30),
            Icon(Icons.add, size: 30),
            Icon(Icons.perm_identity, size: 30),
            Icon(Icons.settings, size: 35),
          ],
          color: Colors.white,
          buttonBackgroundColor: Colors.white,
          backgroundColor: Colors.blueAccent,
//          เอฟเฟคในการเคลื่อนที่
          animationCurve: Curves.decelerate,
//          เวลา อนิเมชัน
          animationDuration: Duration(milliseconds: 700),
          onTap: (int tappedIndex) {
            setState(() {
              _showPage = _pageChoose(tappedIndex);
            });
          },
        ),
        body: Container(
          color: Colors.blueAccent,
          child: Center(
            child: _showPage,
          ),
        ));
  }
}

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.onAuthStateChanged,
      builder: (context,AsyncSnapshot<FirebaseUser> snapshot) {
        if(snapshot.connectionState == ConnectionState.waiting)
          return SplashPage();
        if(!snapshot.hasData || snapshot.data == null)
          return LoginPage();
        return BottomNavBar();
      },
    );
  }
}



