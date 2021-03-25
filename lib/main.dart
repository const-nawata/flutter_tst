import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<String> fetchAlbum() async {
  final response = await http.get(Uri.https('jsonplaceholder.typicode.com', 'albums/100'));

  if (response.statusCode == 200) {
    var respBody  = jsonDecode(response.body);
    return respBody['title'];
  }else{
    throw Exception('Failed to load album');
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
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
  int _counter = 0;
  Future<String> _alb;

  void _incrementCounter() {
    setState(() {
      _alb = fetchAlbum();
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text(widget.title),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('You have pushed the button this many times:',),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),

            FutureBuilder<String>(
              future: _alb,
              builder: (context, snapshot){
                if (snapshot.hasData) {

                  return Text('${snapshot.data} / Album name');
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
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
