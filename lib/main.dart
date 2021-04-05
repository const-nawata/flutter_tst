import 'dart:io';

import 'package:flutter/material.dart';

import 'api_client.dart';
import 'package:dio/dio.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() {
  HttpOverrides.global = new MyHttpOverrides();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Users Management'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  User _userdata;

  void _setUser(int userId) {
    final _dio = Dio(); // Provide a dio instance
    final _uclient = RestUserClient(_dio);
    _uclient.getUser(userId).then((userdata) {
      setState(() {
        _userdata = userdata;
      });
      return userdata;
    });
  }

  @override
  Widget build(BuildContext context) {
    final _dio = Dio(); // Provide a dio instance
    final _uclient = RestUserClient(_dio);
    Future<List<User>> _users =
        _uclient.getUsers().then((usersdata) => usersdata);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Text('id: ${_userdata == null ? 0 : _userdata.id}'),
          FutureBuilder<List<User>>(
              future: _users,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<User> _entries = snapshot.data;
                  List<Color> _colors = [Color(0xFFE6D8FF), Color(0xFFFFD3F9)];

                  return Container(
                    color: Color(0xFFFFF6C1),
                    margin: EdgeInsets.only(
                      top: 20,
                      left: 5,
                      right: 5,
                    ),
                    padding: EdgeInsets.only(top: 10, bottom: 10),
                    height: 400,
                    child: ListView.builder(
                      padding: const EdgeInsets.all(5.0),
                      itemCount: _entries.length,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                            _setUser(_entries[index].id);
                          },
                          child: Container(
                            height: 35,
                            child: Center(
                              child: Text(
                                'User: ${_entries[index].firstname} ${_entries[index].lastname} (${_entries[index].username})',
                                style: TextStyle(
                                  fontSize: 25.0,
                                  fontWeight: FontWeight.bold,
                                  backgroundColor: _colors[index % 2],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  );
                }

                return Text('Waiting...');
              }),
        ],
      ),
    );
  }
}
