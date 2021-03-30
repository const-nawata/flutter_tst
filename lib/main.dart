import 'dart:convert';

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

void main() {
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
//  http://localhost/api/
//  http://10.0.2.2:3000
Future<String> getUser() async {
  try {
    var response = await Dio().get('http://10.0.2.2:3000');
    // var response = await Dio().get('http://jsonplaceholder.typicode.com/albums/100');
      return 'Success response.${response.toString()}';
    // print(response);
  } catch (e) {
    // print(e);
    return 'Failed response. ${e.toString()}';
  }
}

class MyHomePage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    Future<String> _user = getUser();

    return Scaffold(
      appBar: AppBar(
        title: Container(
          child: Text('DIO Demo'),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Container(child: Text('Row 1 -- ${InternetAddress.loopbackIPv4.toString()}',),),
            Container(child: Text('Row 2'),),

            FutureBuilder<String>(
              future: _user,
              builder: (context, snapshot){
                if (snapshot.hasData) {

                  return Text('${snapshot.data} ');
                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                }
                return Text('Waiting...');
                // return CircularProgressIndicator();
              },
            ),


          ],
        ),
      ),
    );
  }
}
