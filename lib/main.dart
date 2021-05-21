import 'dart:convert';

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'company.dart';
import 'config.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext context) {
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
  }
}

Future<void> main() async {

  List<Company> _response = await getCompanies();


  print('${_response[0].name} / ${_response[0].description}');

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

Future<List<Company>> getCompanies() async {
  try {
    Response response = await Dio().get('$baseUri/companies');
    // client.badCertificateCallback = ((X509Certificate cert, String host, int port) => true);
    // return 'Success response.${response}';
    // print(response.data.toString());

    // return response.data;
    return (response.data as List).map((x) => Company.fromJson(x)).toList();
  } catch (e) {

// print('ERRRRRRRORRRRR: ${e}');

    // return 'Failed response. ${e.toString()}';
    return e;
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Future<Response> _response = getCompanies();


    return Scaffold(
      appBar: AppBar(
        title: Container(
          child: Text('DIO Demo'),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              child: Text('Row 1'),
            ),
            Container(
              child: Text('Row 2'),
            ),

            // FutureBuilder<Response>(
            //   future: _companies,
            //   builder: (context, snapshot) {
            //     if (snapshot.hasData) {
            //       Map<String, dynamic> _userdata = snapshot.data.data;
            //       return Text('${_userdata['username']} ');
            //     } else if (snapshot.hasError) {
            //       return Text("${snapshot.error} // W");
            //     }
            //     return Text('No data were got.');
            //     // return CircularProgressIndicator();
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}
