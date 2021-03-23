import 'package:flutter/material.dart';

class TopBar extends StatelessWidget {
  // const TopBar({Key key}) : super(key: key);
  TopBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300,
      padding: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
          image: DecorationImage(
            image: Image.asset('assets/images/bg1.png').image,
            fit: BoxFit.contain,
          ),
          gradient: LinearGradient(
            colors: [Colors.red, Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          )),
      child: SafeArea(
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    CircleAvatar(
                      backgroundColor: Color.fromRGBO(255, 0, 0, 0.3),
                      child: IconButton(
                        icon: Icon(Icons.dehaze),
                        color: Colors.white,
                        onPressed: () {},
                      ),
                    ),
                    CircleAvatar(
                      backgroundColor: Color.fromRGBO(255, 0, 0, 0.3),
                      child: IconButton(
                        icon: Icon(Icons.calendar_today),
                        color: Colors.white,
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      alignment: Alignment.centerLeft,
                      height: 50.0,
                      width: 150.0,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: <Widget>[
                          //  Icons with date (List)
                        ],
                      ),
                    ),

                    Chip(
                      backgroundColor: Color.fromRGBO(255, 0, 0, 0.5),
                      label: Text(
                        '02.06.2020',
                        style: TextStyle(color: Colors.white),
                      ),
                    ), // Block with rounded cones.

                    CircleAvatar(
                      backgroundColor: Color.fromRGBO(255, 0, 0, 0.5),
                      child: IconButton(
                        icon: Icon(Icons.insert_chart),
                        color: Colors.white,
                        tooltip: 'Shoe Grafik',
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
