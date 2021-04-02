import 'dart:io';
import 'dart:ui';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'api_client.dart';

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

  MyHomePage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _dio = Dio(); // Provide a dio instance
    final _uclient = RestUserClient(_dio);

    Future<User> _user = _uclient.getUser().then((userdata) => userdata);

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Column(
        children: [
          Center(
            child: Text(
              "User's Data",
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
          ),
          FutureBuilder<User>(
            future: _user,
            builder: (context, snapshot) {
              if (snapshot.hasData && snapshot.data != null) {
                return Column(
                  children: [
                    Row(
                      children: [
                        Text('Id: '),
                        Text('${snapshot.data.id}'),
                      ],
                    ),
                    Row(
                      children: [
                        Text('Username: '),
                        Text('${snapshot.data.username}'),
                      ],
                    ),
                    Row(
                      children: [
                        Text('First name: '),
                        Text('${snapshot.data.firstname}'),
                      ],
                    ),
                    Row(
                      children: [
                        Text('Last name: '),
                        Text('${snapshot.data.lastname}'),
                      ],
                    ),
                  ],
                );
              } else if (snapshot.hasError) {
                return Text("Error: ${snapshot.error}");
              } else {
                return Text('No both data and error.');
              }
              // return CircularProgressIndicator();
            },
          ),
        ],
      ),
    );
  }
}
