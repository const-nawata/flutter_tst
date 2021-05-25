import 'dart:io';
import 'dart:ui';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'api_client.dart';

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
    // final _uclient = RestUserClient(_dio);
    final _invclient = RestInvestorClient(_dio);

    // Future<User> _user = _uclient.getUser(1162).then((userdata) => userdata);

    // Future<List<User>> _users = _uclient.getUsers().then((usersdata) => usersdata);

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

          /*
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

*/

          FutureBuilder<Startups>(
            future: _startups,
            builder: (context, snapshot1) {
              if (snapshot1.hasData && snapshot1.data != null) {
                Startups _dt = snapshot1.data!;
                ChunkItem _chunk = _dt.data.chunk[3];
                CompanyDetails _company = _chunk.company_details;

                return Container(
                  margin: EdgeInsets.only(top: 20.0, left: 20.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            'Startup result: ${snapshot1.data!.result} \n${_chunk.startup_id}',
                            style: TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Container(
                            width: 56.0,
                            height: 56.0,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black12),
                              borderRadius: BorderRadius.all(Radius.circular(4.0)),
                              image: DecorationImage(
                                image: NetworkImage(_company.logo.url),
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
                            Text('${_company.address.country}, ${_company.address.city}'),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 20.0),
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
                            Text('${_chunk.screening.partner.name}'),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
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
