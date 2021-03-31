import 'dart:convert';

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'config.dart';



class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}

void main() {
  HttpOverrides.global = new MyHttpOverrides();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Dio Demo',
      theme: ThemeData(
        primaryColor: Color(0xFF804712),
        accentColor: Color(0xFFEFB681),
      ),
      home: MyHomePage(),
    );
  }
}

Future<Response> getUser() async {
  try {
    Response response = await Dio().get('$baseUri/userdata');
    // client.badCertificateCallback = ((X509Certificate cert, String host, int port) => true);
    // return 'Success response.${response}';
    return response;
  } catch (e) {
    // return 'Failed response. ${e.toString()}';
    return e;
  }
}


class MyHomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Future<Response> _user = getUser();

    return Scaffold(
      appBar: AppBar(
        title: Container(
          child: Text('DIO Demo'),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Container(child: Text('Row 1',),),
            Container(child: Text('Row 2'),),

            FutureBuilder<Response>(
              future: _user,
              builder: (context, snapshot){
                if (snapshot.hasData) {
                  Map<String, dynamic> _user = jsonDecode(snapshot.data.toString());

                  return Text('${_user['username']} ');
                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                }
                return Text('No data were got.');
                // return CircularProgressIndicator();
              },
            ),
          ],
        ),
      ),
    );
  }
}
