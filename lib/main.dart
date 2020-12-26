import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_mjpeg/flutter_mjpeg.dart';
import 'dart:io';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bot Interface',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final isRunning = useState(true);
    return Scaffold(
      appBar: AppBar(
        title: Text('Robot Interface'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Center(
              child: Mjpeg(
                isLive: isRunning.value,
                stream: 'http://shanesbot.local:8000/stream.mjpg', //'http://192.168.1.37:8081',
              ),
            ),
          ),
          Container(
                width: 600.0,
                height: 30.0,
                      child  :RaisedButton(
                onPressed: () {
                  isRunning.value = !isRunning.value;
                },
                
                child: Text('Refresh'),
              ),
          ),
              Container(
                width: 600.0,
                height: 30.0,
                      child  :RaisedButton(
                onPressed: () {
                Process.run('./scripts/arm.sh',[]).then((ProcessResult results) {
    print(results.stdout);})
;
                },
               child: Text('Arm/Disarm'),
               
             ),
              ),

             Container(
                width: 600.0,
                height: 30.0,
                      child  :RaisedButton(
                onPressed: () {
                Process.run('./scripts/stop.sh',[]).then((ProcessResult results) {
    print(results.stdout);})
;
                },
               child: Text('Stop'),
               
             ),
             ),
              Container(
                width: 600.0,
                height: 30.0,
                      child  :RaisedButton(
                onPressed: () {
                Process.run('./scripts/forward.sh',[]).then((ProcessResult results) {
    print(results.stdout);})
;
                },
               child: Text('Forward'),
               
             ),
              ),
             Container(
                width: 600.0,
                height: 30.0,
                      child  :RaisedButton(
                onPressed: () {
                Process.run('./scripts/back.sh',[]).then((ProcessResult results) {
    print(results.stdout);})
;
                },

               child: Text('Back'),
               
             ),
             ),
             Container(
                width: 600.0,
                height: 30.0,
                      child  :RaisedButton(
                onPressed: () {
                Process.run('./scripts/left.sh',[]).then((ProcessResult results) {
    print(results.stdout);})
;
                },
               child: Text('Left'),
               
             ),
             ),
             Container(
                width: 600.0,
                height: 30.0,
                      child  :RaisedButton(
                onPressed: () {
                Process.run('./scripts/right.sh',[]).then((ProcessResult results) {
    print(results.stdout);})
;
                },
               child: Text('Right'),
               
             ),
             ),
        ],
      ),
    );
  }
}