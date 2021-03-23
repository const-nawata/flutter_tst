import 'package:flutter/material.dart';
import 'package:flutter_tst/Widgets/top_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      // backgroundColor: Color(0xFFB4EFDF),
      body: Column(
        children: <Widget>[
          TopBar(),
        ],
      ),
    );
  }
}
