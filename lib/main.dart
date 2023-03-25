import 'dart:developer';
import 'dart:io';

import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState(){
    bluetoothPermission();
    super.initState();
  }
  void bluetoothPermission()async{
    print('This is Called');
    if (await Permission.bluetooth.isDenied) {
      await Permission.bluetoothConnect.request();
      var v = await Permission.bluetooth.status;
      print('$v This is the status now ');

    }
  }


  // BluetoothState? state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Find Devices'),
        actions: [
          ElevatedButton(
            onPressed: ()async  {

              FlutterBluePlus.instance.turnOn();
            },
            child: const Text('Turned off'),
          )
        ],
      ),
      body: Center(
        child: Column(
          children: const [
            Icon(
              Icons.bluetooth_searching,
              size: 200,
              color: Colors.black,
            )
          ],
        ),
      ),
    );
  }
}
