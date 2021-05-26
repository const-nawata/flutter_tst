import 'dart:io';
import 'dart:ui';
// import 'package:dio/dio.dart';
// import 'package:flutter/cupertino.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tst/widgets/investors.dart';

import 'api/api_client.dart';
import 'global.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
  }
}

Future<void> main() async {
  HttpOverrides.global = new MyHttpOverrides();

  final _dio = Dio(); // Provide a dio instance
  final _invclient = RestInvestorClient(_dio);
  try {
    startups = await _invclient.getStartups('828b561c52fabe0c26ba89de983dd3b65b25b612', 15, 15).then((data) => data);
  } catch (e) {
    print('1 / ${e.toString()}');
    try {
      RefreshTokenResponse _tokenR =
          await _invclient.refreshToken('a0a6bd7f6d1e05d6eff42312373b0e62202ebc96').then((data) => data);

      startups = await _invclient.getStartups(_tokenR.data!.access_token, 15, 15).then((data) => data);
    } catch (e) {

      print('2 / ${e.toString()}');
    }
  }

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
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
                "Company Data",
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Investors(),
        ],
      ),
    );
  }
}
