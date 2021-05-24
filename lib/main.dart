import 'dart:ui';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'api_client.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Retrofit Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Retrofit Demo'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;

  MyHomePage({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _dio = Dio(); // Provide a dio instance
    final _uclient = RestUserClient(_dio);

    Future<User> _user = _uclient.getUser(4).then((userdata) => userdata);

    Future<List<User>> _users = _uclient.getUsers().then((usersdata) => usersdata);

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 18.0),
            child: Center(
              child: Text(
                "User's Data",
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          FutureBuilder<User>(
            future: _user,
            builder: (context, snapshot) {
              if (snapshot.hasData && snapshot.data != null) {
                TextStyle _userFontStyle = TextStyle(fontSize: 18.0);

                return Container(
                  margin: EdgeInsets.only(top: 40.0, left: 20.0),
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: [
                          Text('Id: ', style: _userFontStyle),
                          Text('${snapshot.data!.id}', style: _userFontStyle),
                        ],
                      ),
                      Row(
                        children: [
                          Text('Username: ', style: _userFontStyle),
                          Text('${snapshot.data!.username}', style: _userFontStyle),
                        ],
                      ),
                      Row(
                        children: [
                          Text('First name: ', style: _userFontStyle),
                          Text('${snapshot.data!.firstname}', style: _userFontStyle),
                        ],
                      ),
                      Row(
                        children: [
                          Text('Last name: ', style: _userFontStyle),
                          Text('${snapshot.data!.lastname}', style: _userFontStyle),
                        ],
                      ),

                      FutureBuilder<List<User>>(
                        future: _users,
                        builder: (context, snapshot1) {
                          if (snapshot1.hasData && snapshot1.data != null) {
                            return Container(
                              margin: EdgeInsets.only(top: 20.0),
                              child: Row(
                                children: [
                                  Text(
                                    'Users count: ${snapshot1.data!.length}',
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          } else if (snapshot1.hasError) {
                            return Text("Error: ${snapshot1.error}");
                          } else {
                            return Text("Wait...");
                          }
                        },
                      ),

                      // Text('Users count: ${_users.length}')
                    ],
                  ),
                );
              } else if (snapshot.hasError) {
                return Text("Error: ${snapshot.error}");
              } else {
                return Container(
                  margin: EdgeInsets.only(top: 51.0),
                  child: Center(
                    child: SizedBox(
                      child: CircularProgressIndicator(),
                      width: 60,
                      height: 60,
                    ),
                  ),
                );
              }
              // return CircularProgressIndicator();
            },
          ),
        ],
      ),
    );
  }
}
