import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      appBar: AppBar(
//        title: Text("Tid | Login"),
//      ),
      body: Container(
        color: Theme.of(context).primaryColor,
        child: SafeArea(
            child: Container(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircularProgressIndicator(
                backgroundColor: Colors.white,
              ),
              SizedBox(height: 28,),
              Text(
                "Loading...",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.w700),
              )
            ],
          ),
        )),
      ),
    );
  }
}


