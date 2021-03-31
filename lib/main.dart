import 'dart:convert';

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';


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

Future<String> getUser() async {
  try {
    var response = await Dio().get('https://192.168.30.63/admin/auth/apicall');
    // client.badCertificateCallback = ((X509Certificate cert, String host, int port) => true);
    return 'Success response.${response.toString()}';
  } catch (e) {
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
            Container(child: Text('Row 1',),),
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
