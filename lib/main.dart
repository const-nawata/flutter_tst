import 'dart:io';
import 'dart:ui';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'api/api_client.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
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
    final _invclient = RestInvestorClient(_dio);

    Future<Startups> _startups = _invclient.getStartups().then((userdata) => userdata);

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
          FutureBuilder<Startups>(
            future: _startups,
            builder: (context, snapshot1) {
              ChunkItem? _chunk;
              CompanyDetails? _company;
              String? _addr;

              if (snapshot1.hasData && snapshot1.data != null) {
                Startups _dt = snapshot1.data!;

                if (_dt.result) {
                  _chunk = _dt.data!.chunk[3];
                  _company = _chunk.company_details;
                  _addr = '${_company.address.country}, ${_company.address.city}';
                  _addr = _addr.length > 40 ? '${_addr.substring(0, 40)}...' : _addr;
                }

                return _dt.result
                    ? Container(
                        margin: EdgeInsets.only(top: 20.0, left: 20.0),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                  width: 56.0,
                                  height: 56.0,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black12),
                                    borderRadius: BorderRadius.all(Radius.circular(4.0)),
                                    image: DecorationImage(
                                      image: NetworkImage(_company!.logo.url),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 20.0),
                              child: Row(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(right: 10.0),
                                    child: Text(
                                      'Company: ',
                                      style: TextStyle(
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Text('${_company.name}'),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 20.0),
                              child: Row(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(right: 10.0),
                                    child: Text(
                                      'Address: ',
                                      style: TextStyle(
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Text(_addr!),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                top: 20.0,
                                right: 15.0,
                              ),
                              height: 50.0,
                              child: Row(
                                children: [
                                  Container(
                                    alignment: Alignment.topLeft,
                                    margin: EdgeInsets.only(right: 10.0),
                                    child: Text(
                                      'Description : ',
                                      style: TextStyle(
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Flexible(
                                    child: Text(
                                      '${_company.address.country}, ${_company.elevator_pitch}',
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 3,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 20.0),
                              child: Row(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(right: 10.0),
                                    child: Text(
                                      'Partner: ',
                                      style: TextStyle(
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Text('${_chunk!.screening.partner.name}'),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    : Text('Error Reading data.\nMessage: ${_dt.error_message}\nCode: ${_dt.error_code}');
              } else if (snapshot1.hasError) {
                return Text("Error5: ${snapshot1.error.toString()}");
              } else {
                return Text("Wait...");
              }
            },
          ),
        ],
      ),
    );
  }
}
