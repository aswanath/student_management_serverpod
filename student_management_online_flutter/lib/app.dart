import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_management_online_flutter/bloc/student_bloc.dart';
import 'package:student_management_online_flutter/pages/splash_screen.dart';
import 'package:student_management_online_flutter/repository/student_repository.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => StudentBloc(StudentRepository())..add(FetchStudents()),
      // lazy: false,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.blueAccent,
          iconTheme: const IconThemeData(color: Colors.brown),
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
