import 'package:flutter/material.dart';

class GameListCard extends StatelessWidget {
  final String imgUrl;
  final String name;
  final String type;

  GameListCard({this.imgUrl, this.name, this.type});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 15),
      child: Container(
        width: 165,
        height: 240,
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(left: 5, right: 5, bottom: 0),
                child: Container(
                  // size card
                  width: 160,
                  height: 200,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(.1),
                            offset: Offset(00, 10),
                        blurRadius: 20,
                        ),
                      ]),
                ),
              ),
            ),
            Positioned(
              right: 7, // ตำแหน่งภาพ
              top: 6, // ตำแหน่งภาพ
              child: Image.network(
                imgUrl,
                // image size
                width: 150,
                height: 130,
              ),
            ),
            Positioned(
              left: 15,
              bottom: 40,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(name,textAlign: TextAlign.center,)
                ],
              ),
            ),
            Positioned(
              left: 20,
              bottom: 10,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("ประเภท : $type")
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
