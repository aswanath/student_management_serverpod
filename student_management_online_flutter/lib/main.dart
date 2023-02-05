import 'package:student_management_online_client/student_management_online_client.dart';
import 'package:flutter/material.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';
import 'package:student_management_online_flutter/pages/splash_screen.dart';

import 'app.dart';
var link = 'http://10.0.2.2:8080/'; //-when using emulator
 //'http://localhost:8080/'; //- when using physical device
var client = Client('http://10.0.2.2:8080/')
  ..connectivityMonitor = FlutterConnectivityMonitor();

void main() {
  runApp(const MyApp());
}

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Student Management Online - Serverpod',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const SplashScreen(),
//     );
//   }
// }

