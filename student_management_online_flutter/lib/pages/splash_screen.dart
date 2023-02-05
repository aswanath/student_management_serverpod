import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_management_online_flutter/bloc/student_bloc.dart';

import 'homepage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    toHomeScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purpleAccent,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            SizedBox(
              child: Image(
                width: 150,
                image: AssetImage("assets/icon_image.png"),
              ),
            ),
            Text(
              "Student Management",
              style: TextStyle(
                fontWeight: FontWeight.w700,
                color: Colors.tealAccent,
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> toHomeScreen() async {
    await Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const HomePage(),
        ),
      );
    });
  }
}
